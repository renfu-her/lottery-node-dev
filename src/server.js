const express = require("express");
const { Sequelize, Op } = require("sequelize");
const http = require("http");
const socketIo = require("socket.io");
const sequelize = require("./models/index");
const User = require("./models/user");
const AvailableReward = require("./models/availableReward");
const Reward = require("./models/reward");

const app = express();
const server = http.createServer(app);
const io = socketIo(server);

app.use(express.json());
app.use(express.static("public"));

// 獲取所有用戶
app.get("/api/users", async (req, res) => {
  try {
    const users = await User.findAll({
      attributes: [
        "id",
        "name",
        "email",
        [
          sequelize.literal(
            "(SELECT COUNT(*) FROM Rewards WHERE Rewards.userId = User.id)"
          ),
          "hasWon",
        ],
      ],
    });
    res.json(users);
  } catch (error) {
    console.error("獲取用戶失敗:", error);
    res.status(500).json({ error: "獲取用戶失敗" });
  }
});

// 添加新的可用獎勵
app.post("/api/available-rewards", async (req, res) => {
  try {
    const { rewardType, description, quantity } = req.body;
    const newReward = await AvailableReward.create({
      rewardType,
      description,
      quantity,
    });
    res.status(201).json(newReward);
  } catch (error) {
    console.error("添加獎勵失敗:", error);
    res.status(500).json({ error: "添加獎勵失敗" });
  }
});

// 獲取所有可用獎勵
app.get("/api/available-rewards", async (req, res) => {
  try {
    const rewards = await AvailableReward.findAll();
    res.json(rewards);
  } catch (error) {
    console.error("獲取獎勵失敗:", error);
    res.status(500).json({ error: "獲取獎勵失敗" });
  }
});

// 抽獎
app.post("/api/draw", async (req, res) => {
  try {
    // 獲取所有沒有獲得過獎品的用戶
    const eligibleUsers = await User.findAll({
      where: {
        id: {
          [Op.notIn]: sequelize.literal(
            "(SELECT DISTINCT userId FROM Rewards)"
          ),
        },
      },
      order: sequelize.random(),
    });

    if (eligibleUsers.length === 0) {
      return res.status(404).json({ error: "沒有符合條件的用戶" });
    }

    const winner = eligibleUsers[0];

    const availableReward = await AvailableReward.findOne({
      where: { quantity: { [Op.gt]: 0 } },
      order: sequelize.random(),
    });

    if (!availableReward) {
      return res.status(404).json({ error: "沒有可用的獎勵" });
    }

    const reward = await Reward.create({
      userId: winner.id,
      rewardType: availableReward.rewardType,
      description: availableReward.description,
    });

    // 檢查獎勵是否成功創建
    const createdReward = await Reward.findByPk(reward.id);
    console.log('創建的獎勵:', createdReward.toJSON());

    // 減少可用獎勵的數量
    availableReward.quantity -= 1;
    await availableReward.save();

    io.emit("winner", { user: winner, reward: reward });
    res.json({ message: "抽獎成功", winner, reward });
  } catch (error) {
    console.error("抽獎失敗:", error);
    res.status(500).json({ error: "抽獎失敗" });
  }
});

// 獲取中獎記錄
app.get("/api/rewards", async (req, res) => {
  try {
    const rewards = await Reward.findAll({
      include: [{ model: User, attributes: ["id", "name", "email"] }],
    });
    res.json(rewards);
  } catch (error) {
    console.error("獲取中獎記錄失敗:", error);
    res.status(500).json({ error: "獲取中獎記錄失敗" });
  }
});

// 手動分配獎品給用戶
app.post("/api/assign-reward", async (req, res) => {
  try {
    const { userId, rewardId } = req.body;

    const user = await User.findByPk(userId);
    if (!user) {
      return res.status(404).json({ error: "用戶不存在" });
    }

    const availableReward = await AvailableReward.findByPk(rewardId);
    if (!availableReward || availableReward.quantity <= 0) {
      return res.status(404).json({ error: "獎品不可用或數量不足" });
    }

    const reward = await Reward.create({
      userId: user.id,
      rewardType: availableReward.rewardType,
      description: availableReward.description,
    });

    // 檢查獎勵是否成功創建
    const createdReward = await Reward.findByPk(reward.id);
    console.log('創建的獎勵:', createdReward.toJSON());

    // 減少可用獎勵的數量
    availableReward.quantity -= 1;
    await availableReward.save();

    io.emit("manualAssign", { user, reward });
    res.json({ message: "獎品分配成功", user, reward });
  } catch (error) {
    console.error("獎品分配失敗:", error);
    res.status(500).json({ error: "獎品分配失敗" });
  }
});

const PORT = process.env.PORT || 3000;

async function startServer() {
  try {
    await sequelize.authenticate();
    console.log("數據庫連接成功。");

    await sequelize.sync();
    console.log("模型同步完成。");

    server.listen(PORT, () => {
      console.log(`伺服器運行在端口 ${PORT}`);
    });
  } catch (error) {
    console.error("無法連接到數據庫:", error);
  }
}

startServer();
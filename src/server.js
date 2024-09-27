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

// 获取所有用户
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
    console.error("获取用户失败:", error);
    res.status(500).json({ error: "获取用户失败" });
  }
});

// 添加新的可用奖励
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
    console.error("添加奖励失败:", error);
    res.status(500).json({ error: "添加奖励失败" });
  }
});

// 获取所有可用奖励
app.get("/api/available-rewards", async (req, res) => {
  try {
    const rewards = await AvailableReward.findAll();
    res.json(rewards);
  } catch (error) {
    console.error("获取奖励失败:", error);
    res.status(500).json({ error: "获取奖励失败" });
  }
});

// 抽奖
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
    console.log('Created Reward:', createdReward.toJSON());

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

// 获取中奖记录
app.get("/api/rewards", async (req, res) => {
  try {
    const rewards = await Reward.findAll({
      include: [{ model: User, attributes: ["id", "name", "email"] }],
    });
    res.json(rewards);
  } catch (error) {
    console.error("获取中奖记录失败:", error);
    res.status(500).json({ error: "获取中奖记录失败" });
  }
});

// 手动分配奖品给用户
app.post("/api/assign-reward", async (req, res) => {
  try {
    const { userId, rewardId } = req.body;

    const user = await User.findByPk(userId);
    if (!user) {
      return res.status(404).json({ error: "用户不存在" });
    }

    const availableReward = await AvailableReward.findByPk(rewardId);
    if (!availableReward || availableReward.quantity <= 0) {
      return res.status(404).json({ error: "奖品不可用或数量不足" });
    }

    const reward = await Reward.create({
      userId: user.id,
      rewardType: availableReward.rewardType,
      description: availableReward.description,
    });

    // 檢查獎勵是否成功創建
    const createdReward = await Reward.findByPk(reward.id);
    console.log('Created Reward:', createdReward.toJSON());

    // 减少可用奖励的数量
    availableReward.quantity -= 1;
    await availableReward.save();

    io.emit("manualAssign", { user, reward });
    res.json({ message: "奖品分配成功", user, reward });
  } catch (error) {
    console.error("奖品分配失败:", error);
    res.status(500).json({ error: "奖品分配失败" });
  }
});

const PORT = process.env.PORT || 3000;

async function startServer() {
  try {
    await sequelize.authenticate();
    console.log("数据库连接成功。");

    await sequelize.sync();
    console.log("模型同步完成。");

    server.listen(PORT, () => {
      console.log(`服务器运行在端口 ${PORT}`);
    });
  } catch (error) {
    console.error("无法连接到数据库:", error);
  }
}

startServer();
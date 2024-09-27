const socket = io();
const drawBtn = document.getElementById("drawBtn");
const result = document.getElementById("result");
const addRewardForm = document.getElementById("addRewardForm");
const assignRewardForm = document.getElementById("assignRewardForm");
const userSelect = document.getElementById("userId");
const rewardSelect = document.getElementById("rewardId");
const rewardsList = document.getElementById("rewardsList");
const availableRewardsList = document.getElementById("availableRewardsList");

let isDrawing = false;
let drawInterval;

function showAlert(message, type, duration = 3000) {
  const alertDiv = document.createElement("div");
  alertDiv.className = `alert alert-${type} alert-dismissible fade show`;
  alertDiv.role = "alert";
  alertDiv.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    `;
  const container = document.querySelector(".container");
  container.insertBefore(alertDiv, container.querySelector("h1").nextSibling);

  // 設置定時器，指定時間後自動移除警告訊息
  setTimeout(() => {
    alertDiv.classList.remove('show');
    alertDiv.classList.add('hide');
    setTimeout(() => {
      alertDiv.remove();
    }, 300); // 等待淡出動畫完成後移除元素
  }, duration);
}

function loadUsersAndRewards() {
  fetch("/api/users")
    .then((response) => response.json())
    .then((users) => {
      userSelect.innerHTML =
        '<option value="">选择用户</option>' +
        users
          .map(
            (user) =>
              `<option value="${user.id}" ${user.hasWon ? "disabled" : ""}>${
                user.name
              } (${user.email}) ${user.hasWon ? "- 已获奖" : ""}</option>`
          )
          .join("");
    });

  fetch("/api/available-rewards")
    .then((response) => response.json())
    .then((rewards) => {
      rewardSelect.innerHTML =
        '<option value="">选择奖品</option>' +
        rewards
          .map(
            (reward) =>
              `<option value="${reward.id}">${reward.rewardType} (剩余: ${reward.quantity})</option>`
          )
          .join("");
    });
}

function updateAvailableRewards() {
  fetch("/api/available-rewards")
    .then((response) => response.json())
    .then((rewards) => {
      availableRewardsList.innerHTML = rewards
        .map(
          (reward) =>
            `<li class="list-group-item">
                    ${reward.rewardType} - ${reward.description} (剩余数量: ${reward.quantity})
                </li>`
        )
        .join("");
    })
    .catch((error) => {
      console.error("获取可用奖励失败:", error);
      showAlert("获取可用奖励失败", "danger", 3000);
    });
  loadUsersAndRewards();
}

function updateRewardsList() {
  fetch("/api/rewards")
    .then((response) => response.json())
    .then((rewards) => {
      rewardsList.innerHTML = rewards
        .map(
          (reward) =>
            `<li class="list-group-item">
                    ${reward.User.name} (${reward.User.email}) 获得了 ${
              reward.rewardType
            }
                    <small class="text-muted">- ${new Date(
                      reward.createdAt
                    ).toLocaleString()}</small>
                </li>`
        )
        .join("");
    })
    .catch((error) => {
      console.error("获取中奖记录失败:", error);
      showAlert("获取中奖记录失败", "danger", 3000);
    });
  loadUsersAndRewards();
}

function updateEligibleUsersCount() {
  fetch("/api/users")
    .then((response) => response.json())
    .then((users) => {
      const eligibleCount = users.filter((user) => !user.hasWon).length;
      document.getElementById(
        "eligibleUsersCount"
      ).textContent = `剩餘可抽獎用戶: ${eligibleCount}`;
    })
    .catch((error) => {
      console.error("獲取用戶數量失敗:", error);
    });
}

// 添加獎勵表單提交事件
addRewardForm.addEventListener("submit", (e) => {
  e.preventDefault();
  const rewardType = document.getElementById("rewardType").value;
  const description = document.getElementById("description").value;
  const quantity = parseInt(document.getElementById("quantity").value);

  fetch("/api/available-rewards", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ rewardType, description, quantity }),
  })
    .then((response) => response.json())
    .then((data) => {
      console.log("獎勵添加成功:", data);
      showAlert("獎勵添加成功", "success", 3000);
      addRewardForm.reset();
      updateAvailableRewards();
    })
    .catch((error) => {
      console.error("添加獎勵失敗:", error);
      showAlert("添加獎勵失敗", "danger", 3000);
    });
});

// 修改抽獎按鈕點擊事件
drawBtn.addEventListener("click", () => {
  if (isDrawing) {
    stopDrawing();
  } else {
    startDrawing();
  }
});

function startDrawing() {
  isDrawing = true;
  drawBtn.textContent = "停止抽獎";
  drawBtn.classList.remove("btn-primary");
  drawBtn.classList.add("btn-danger");
  
  drawInterval = setInterval(() => {
    fetch("/api/draw", { method: "POST" })
      .then((response) => response.json())
      .then((data) => {
        if (data.error) {
          showAlert(data.error, "warning", 3000);
          stopDrawing();
        } else {
          console.log("抽獎結果:", data);
          showAlert(
            `恭喜 ${data.winner.name} 獲得了 ${data.reward.rewardType}!`,
            "success",
            3000
          );
          updateRewardsList();
          updateAvailableRewards();
          updateEligibleUsersCount();
        }
      })
      .catch((error) => {
        console.error("抽獎失敗:", error);
        showAlert("抽獎失敗", "danger", 3000);
        stopDrawing();
      });
  }, 2000); // 每2秒抽一次獎
}

function stopDrawing() {
  isDrawing = false;
  drawBtn.textContent = "開始抽獎";
  drawBtn.classList.remove("btn-danger");
  drawBtn.classList.add("btn-primary");
  clearInterval(drawInterval);
}

// 手動分配獎品表單提交事件
assignRewardForm.addEventListener("submit", (e) => {
  e.preventDefault();
  const userId = userSelect.value;
  const rewardId = rewardSelect.value;

  if (!userId || !rewardId) {
    showAlert("請選擇用戶和獎品", "warning", 3000);
    return;
  }

  fetch("/api/assign-reward", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ userId, rewardId }),
  })
    .then((response) => response.json())
    .then((data) => {
      console.log("獎品分配成功:", data);
      showAlert(
        `獎品 ${data.reward.rewardType} 已成功分配給 ${data.user.name}`,
        "success",
        3000
      );
      assignRewardForm.reset();
      updateAvailableRewards();
      updateRewardsList();
      updateEligibleUsersCount();
    })
    .catch((error) => {
      console.error("獎品分配失敗:", error);
      showAlert("獎品分配失敗", "danger", 3000);
    });
});

// Socket.io 事件監聽
socket.on('winner', (data) => {
    showAlert(`恭喜 ${data.user.name} (${data.user.email}) 獲得了 ${data.reward.rewardType}!`, 'info', 3000);
    updateRewardsList();
    updateAvailableRewards();
    updateEligibleUsersCount();
});

socket.on('manualAssign', (data) => {
    showAlert(`${data.user.name} 被手動分配了 ${data.reward.rewardType}`, 'info', 3000);
    updateAvailableRewards();
    updateRewardsList();
    updateEligibleUsersCount();
});

// 初始化
loadUsersAndRewards();
updateAvailableRewards();
updateRewardsList();
updateEligibleUsersCount();

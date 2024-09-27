const { faker } = require('@faker-js/faker');
const sequelize = require('../models/index');
const User = require('../models/user');

async function generateUsers(count) {
  try {
    await sequelize.authenticate();
    console.log('數據庫連接成功。');

    await sequelize.sync();
    console.log('模型同步完成。');

    const users = [];

    for (let i = 0; i < count; i++) {
      users.push({
        name: faker.person.fullName(),
        email: faker.internet.email(),
      });
    }

    await User.bulkCreate(users);
    console.log(`成功創建 ${count} 個用戶。`);

  } catch (error) {
    console.error('生成用戶時出錯:', error);
  } finally {
    await sequelize.close();
  }
}

generateUsers(200);

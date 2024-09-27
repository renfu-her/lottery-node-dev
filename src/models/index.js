const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('lottery_system', 'root', '', {
  host: 'localhost',
  dialect: 'mysql'
});

module.exports = sequelize;
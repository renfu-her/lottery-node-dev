const { DataTypes } = require('sequelize');
const sequelize = require('./index');
const User = require('./user');

const Reward = sequelize.define('Reward', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  rewardType: {
    type: DataTypes.STRING,
    allowNull: false
  },
  description: {
    type: DataTypes.STRING,
    allowNull: true
  },
  userId: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'Users',
      key: 'id'
    }
  }
});

Reward.belongsTo(User);
User.hasMany(Reward);

module.exports = Reward;
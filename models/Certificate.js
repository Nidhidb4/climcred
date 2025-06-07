const mongoose = require('mongoose');

const certificateSchema = new mongoose.Schema({
  name: String,
  club: String,
  event: String,
  date: Date,
  certificateId: String,
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
});

module.exports = mongoose.model('Certificate', certificateSchema);
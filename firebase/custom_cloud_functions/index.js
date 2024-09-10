const admin = require("firebase-admin/app");
admin.initializeApp();

const sendNotification = require("./send_notification.js");
exports.sendNotification = sendNotification.sendNotification;
const updateChatMessages = require("./update_chat_messages.js");
exports.updateChatMessages = updateChatMessages.updateChatMessages;

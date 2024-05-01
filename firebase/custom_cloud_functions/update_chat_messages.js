const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.updateChatMessages = functions.https.onCall(async (data, context) => {
  const chatMessages = data.chatMessages;
  // Write your code below!
  if (!data || !chatMessages || !Array.isArray(chatMessages)) {
    throw new functions.https.HttpsError(
      "invalid-argument",
      "Missing or invalid messageIds",
    );
  }

  const db = admin.firestore();
  const writeBatch = db.batch();

  // Update each message document
  messageIds.forEach((messageId) => {
    writeBatch.update(db.collection("chat_messages").doc(messageId), {
      read: true,
    });
  });

  // Commit the batch write
  await writeBatch.commit();
  // Write your code above!
});

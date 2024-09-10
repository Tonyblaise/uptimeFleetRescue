const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.sendNotification = functions.https.onRequest(async (req, res) => {
  // Get the device token and notification details from the request body
  const token = req.body.token;
  const title = req.body.title;
  const body = req.body.body;
  const initialPageName = req.body.initialPageName;
  const data = req.body.data;

  // Check if required parameters are present
  if (!token || !title || !body) {
    return res.status(400).send("Missing required fields");
  }

  // Create the notification payload
  const message = {
    notification: {
      title: title,
      body: body,
    },
    token: token,
    data,
  };

  // Send the notification
  try {
    await admin.messaging().send(message);
    return res.status(200).send("Notification sent successfully");
  } catch (error) {
    console.error("Error sending notification:", error);
    return res.status(500).send(`Error sending this notification ${error} `);
  }
});

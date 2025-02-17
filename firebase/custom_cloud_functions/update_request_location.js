const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

/**
 * Cloud Function to update request location
 * Expects a POST request with the following body:
 * {
 *   "requestId": "03GgA72HjmSTUFpt70SD",
 *   "latitude": 31.0937711,
 *   "longitude": -97.7761675
 * }
 */
exports.updateRequestLocation = functions.https.onRequest(async (req, res) => {
  // Enable CORS
  res.set("Access-Control-Allow-Origin", "*");

  if (req.method === "OPTIONS") {
    // Send response to OPTIONS requests
    res.set("Access-Control-Allow-Methods", "POST");
    res.set("Access-Control-Allow-Headers", "Content-Type");
    res.set("Access-Control-Max-Age", "3600");
    res.status(204).send("");
    return;
  }

  // Check if method is POST
  if (req.method !== "POST") {
    res.status(405).send("Method Not Allowed");
    return;
  }

  try {
    const { requestId, latitude, longitude } = req.body;

    // Validate input
    if (!requestId || latitude === undefined || longitude === undefined) {
      res.status(400).send({
        error:
          "Missing required fields. Please provide requestId, latitude, and longitude.",
      });
      return;
    }

    // Validate coordinates
    if (
      typeof latitude !== "number" ||
      typeof longitude !== "number" ||
      latitude < -90 ||
      latitude > 90 ||
      longitude < -180 ||
      longitude > 180
    ) {
      res.status(400).send({
        error:
          "Invalid coordinates. Latitude must be between -90 and 90, longitude between -180 and 180.",
      });
      return;
    }

    // Format the location string
    const locationString = `[${Math.abs(latitude)}° ${latitude >= 0 ? "N" : "S"}, ${Math.abs(longitude)}° ${longitude >= 0 ? "E" : "W"}]`;

    // Update the document
    const requestRef = admin.firestore().collection("request").doc(requestId);

    // Check if document exists
    const doc = await requestRef.get();
    if (!doc.exists) {
      res.status(404).send({
        error: `Request document ${requestId} not found`,
      });
      return;
    }

    // Perform the update
    await requestRef.update({
      location: locationString,
      updatedAt: admin.firestore.FieldValue.serverTimestamp(),
    });

    res.status(200).send({
      success: true,
      message: "Location updated successfully",
      data: {
        requestId,
        location: locationString,
      },
    });
  } catch (error) {
    console.error("Error updating location:", error);
    res.status(500).send({
      error: "Internal server error",
      message: error.message,
    });
  }
});

// Optional: Add an onCall version if you want to call it from Firebase SDK
exports.updateRequestLocationCallable = functions.https.onCall(
  async (data, context) => {
    try {
      const { requestId, latitude, longitude } = data;

      // Validate input
      if (!requestId || latitude === undefined || longitude === undefined) {
        throw new functions.https.HttpsError(
          "invalid-argument",
          "Missing required fields. Please provide requestId, latitude, and longitude.",
        );
      }

      // Validate coordinates
      if (
        typeof latitude !== "number" ||
        typeof longitude !== "number" ||
        latitude < -90 ||
        latitude > 90 ||
        longitude < -180 ||
        longitude > 180
      ) {
        throw new functions.https.HttpsError(
          "invalid-argument",
          "Invalid coordinates. Latitude must be between -90 and 90, longitude between -180 and 180.",
        );
      }

      // Format the location string
      const locationString = `[${Math.abs(latitude)}° ${latitude >= 0 ? "N" : "S"}, ${Math.abs(longitude)}° ${longitude >= 0 ? "E" : "W"}]`;

      // Update the document
      const requestRef = admin.firestore().collection("request").doc(requestId);

      // Check if document exists
      const doc = await requestRef.get();
      if (!doc.exists) {
        throw new functions.https.HttpsError(
          "not-found",
          `Request document ${requestId} not found`,
        );
      }

      // Perform the update
      await requestRef.update({
        location: locationString,
        updatedAt: admin.firestore.FieldValue.serverTimestamp(),
      });

      return {
        success: true,
        data: {
          requestId,
          location: locationString,
        },
      };
    } catch (error) {
      console.error("Error updating location:", error);
      throw new functions.https.HttpsError("internal", error.message);
    }
  },
);

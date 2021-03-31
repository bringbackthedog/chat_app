const functions = require('firebase-functions');

// The Firebase Admin SDK to access Cloud Firestore.
const admin = require('firebase-admin');
admin.initializeApp();


//db instance
const db = admin.firestore();

// user collection (or table) reference
const userCollectionRef = db.collection('users');



exports.sendChatNotification = functions.firestore.document('messages/{messageID}')
  .onWrite(async (change, context) => {

    let recipientUID = change.after.data()['recipientUID'];
    let messageSender = change.after.data()["senderUsername"];
    let messageContent = change.after.data()["message"];
    let recipientDoc = await userCollectionRef.doc(recipientUID).get();

    let recipientToken = recipientDoc.data()["fcmToken"];
    let recipientUserName = recipientDoc.data()["userName"];

    //
    //
    // 
    //

    // Optional: Log message doc and content of message 
    let messageMap = change.after.data();
    messageMap['messageContent'] = messageContent; // add content
    messageMap['recipientToken'] = recipientToken;
    function createFunctionLog(logMsg) { functions.logger.info(logMsg, messageMap) }

    // If we have a FCM Tolen for this recipient, send notification
    if (recipientToken) {
      
      // Construct notification payload 
      message = {
        "notification": {
          "title": messageSender,
          "body": messageContent,
        },

        // Apple Push Notification service
        // see: https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/generating_a_remote_notification
        "apns": {
          "payload":
          {
            "aps": {
              "alert": {
                "title": messageSender,
                "body": messageContent,
              },
              "sound": "default",
            },
          }
        },
        token: recipientToken,
      };

      // DO THE SENDING 
      try {
        admin.messaging().send(message);
        createFunctionLog(`Successfully sent message to ${recipientUserName}`);
      }
      catch (e) {
        createFunctionLog(`Failed to send message to ${recipientUserName} with error: ${e}`);
      }
    }
    //if no fcmToken available for this recipient
    else {
      createFunctionLog(`No FCM token for user: ${recipientUserName}, with uid: ${recipientUID}`);
    }// end if(recipientToken)
  });
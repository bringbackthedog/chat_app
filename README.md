# flutter_chat_app

A chat app built using Flutter and Firebase. 

## Getting Started 
Login or create an account. Pick a sender. Send messages. 

### Run on web
- `flutter run -d chrome`
- To see logs: Look for `dart.developer.log` in console (must set 'levels' to 'verbose')

### Firebase 

- Export all documents from Firestore [*(documentation)*](https://firebase.google.com/docs/firestore/manage-data/export-import#gcloud_1) :  

     - open a [cloud shell](https://console.cloud.google.com/?cloudshell=true)
     - From cloud shell: set project in cloud shell: `gcloud config set project flutter-crash-course-2021`
     - From cloud shell: export firestore data to project's cloud storage bucket: `gcloud firestore export gs://flutter-crash-course-2021.appspot.com`

     - Locally: download export data locally from command line using gsutil: `gsutil -m cp -r "gs://flutter-crash-course-2021.appspot.com/[FOLDER_NAME]" .`
     OR download via google cloud console / storage

     ________________________________________

     CLI only
     - set project in gcloud util: `gcloud config set project flutter-crash-course-2021`
     - export firestore data to project's cloud storage bucket:`gcloud firestore export gs://flutter-crash-course-2021.appspot.com/[FOLDER_NAME]`
     - download export data locally: `gsutil -m cp -r "gs://flutter-crash-course-2021.appspot.com/[FOLDER_NAME]" .`
     - `firebase emulators:start --import=./firestore_exports/[FOLDER_NAME]"`



- Emulator [(documentation)](https://firebase.google.com/docs/emulator-suite/install_and_configure): 
     - Start emulator: `firebase emulators:start`
     - Import/export data to emulator:  
             e.g.: `firebase emulators:start --only firestore --import=./firestore_export --export-on-exit`

- [functions shell](https://firebase.google.com/docs/functions/local-shell) : 
     - Start shell: `firebase functions:shell`
     - Function call example: 
````
var after = {
     message:"whats up king!", 
     recipientUID: "lirNaN4Ys6Qgz5AyPFXuHhNF6hl1",
     recipientUsername: "kingTortoise",
     senderUID: "9FENLOVyFhPcKb5cWyX7tDZpEP32",
     senderUsername: "basquiat",
     timestamp: "2021-03-29T23:22:18",
};

sendChatNotification(
     {after: after}, 
     {params: 
          {messageID: 'ViAWUBoTVUTEOTD5RKYQ'}
     }
)
````

### FCM Messaging
[Apple Push Notification (APN)](https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/generating_a_remote_notification) 
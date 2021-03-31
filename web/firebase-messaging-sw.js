importScripts("https://www.gstatic.com/firebasejs/8.2.9/firebase-app.js");

importScripts("https://www.gstatic.com/firebasejs/8.2.9/firebase-messaging.js")

//Using singleton breaks instantiating messaging()
// App firebase = FirebaseWeb.instance.app;


var firebaseConfig = {
    apiKey: "AIzaSyANG52aGLFupgZdQVrzoC5sf8ia-tRgA8Y",
    authDomain: "flutter-crash-course-2021.firebaseapp.com",
    projectId: "flutter-crash-course-2021",
    storageBucket: "flutter-crash-course-2021.appspot.com",
    messagingSenderId: "777516205924",
    appId: "1:777516205924:web:32e53c77ca778096bb9c71",
    measurementId: "G-B51XJ1PLKB"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);


const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            return registration.showNotification("New Message");
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:flutter_chat_app/core/services/database.dart';
import 'package:provider/provider.dart';

// TODO: Create StateLess widget `ChatUserProvider` with required member `child` of type Widget
// TODO: Use provider to get current value of Firbase User
// TODO: Create Future Provider to fetch value of `ChatUser` using `Database.getUserFromDb`
//        passing it the `uid` of currently logged firebase user
// TODO: Pass child as child

class ChatUserProvider extends StatelessWidget {
  /// Fetches the remote data about this [ChatUser].
  ///
  /// Once the data is fetched (i.e. the future is completed),
  /// it injects the data into the subtree as a [ChatUser].

}

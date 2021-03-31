import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/core/models/chat_user.dart';
import 'package:flutter_chat_app/core/services/database.dart';
import 'package:provider/provider.dart';

class ChatUserProvider extends StatelessWidget {
  /// Fetches the remote data about this [ChatUser].
  ///
  /// Once the data is fetched (i.e. the future is completed),
  /// it injects the data into the subtree as a [ChatUser].
  ChatUserProvider({@required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    /// The currently logged in [User].
    User firebaseUser = Provider.of<User>(context);

    return FutureProvider<ChatUser>.value(
      value: Database().getUserFromDb(uid: firebaseUser.uid),
      catchError: (context, error) {
        throw 'FutureProvider Error: ${error.toString()}';
      },
      child: child,
    );
  }
}

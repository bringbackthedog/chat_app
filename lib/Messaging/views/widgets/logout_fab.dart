import 'package:flutter/material.dart';
import 'package:flutter_chat_app/authenticate/services/auth_service.dart';

/// Logout Floating Action Button.
class LogoutFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: FloatingActionButton(
        mini: true,
        onPressed: () async => await AuthService().onLogout(),
        child: Icon(
          Icons.close,
          size: 30,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Messaging/views/widgets/logout_fab.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: LogoutFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.amber,
      body: Container(
        child: SpinKitWave(
          size: 120,
          color: Colors.white,
        ),
      ),
    );
  }
}

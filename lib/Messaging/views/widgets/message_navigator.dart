import 'package:flutter/material.dart';

class MessageNavigator extends StatelessWidget {
  MessageNavigator({this.builder});
  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (_) {
        return MaterialPageRoute(
          builder: builder,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/authenticate/view_models/auth_view_model.dart';
import 'package:flutter_chat_app/authenticate/views/login.dart';
import 'package:flutter_chat_app/authenticate/views/register.dart';

/// Redirects the user to [LoginView] or [RegisterView].
///
/// Notice it is a [StatefulWidget].
///
/// We want to be able to rebuild from this point in the tree down when
/// `setState()` is called from within a child widget.
///
/// We can accomplish this by passing the function `toggleLoginRegister` as an
/// argument to the children widgets' constructor.
///
/// When `toggleLoginRegister` is called, it triggers `setState()` (i.e rebuild)
/// of the widget that defined the function.
///
/// i.e.: When [LoginView] calls `toggleLoginRegister`, it triggers `setState` of
/// it's parent, [Authenticate].
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  AuthViewModel authViewModel;

  /// Toggles between [LoginView] and [RegisterView].
  bool showingLoginView = true;
  void toggleLoginRegister() =>
      setState(() => showingLoginView = !showingLoginView);

  @override
  Widget build(BuildContext context) {
    authViewModel = AuthViewModel(toggleLoginRegister: toggleLoginRegister);

    if (showingLoginView) {
      return LoginView(authViewModel: authViewModel);
    } else {
      return RegisterView(authViewModel: authViewModel);
    }
  }
}

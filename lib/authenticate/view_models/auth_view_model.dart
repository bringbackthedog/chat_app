import 'package:flutter/material.dart';
import 'package:flutter_chat_app/authenticate/services/auth_service.dart';

class AuthViewModel {
  AuthViewModel({@required this.toggleLoginRegister});
  final Function toggleLoginRegister;

  final AuthService _auth = AuthService();

  /// Text Editing Controllers allow us to read/set the value of a text field.
  final emailController = TextEditingController(text: "");
  final passwordController = TextEditingController(text: "");
  final userNameController = TextEditingController(text: "");

  final String loginViewTitle = "Sign In";
  final String loginViewSubtitle = "Chat with Flutter and Firebase";

  final String registerViewtitle = "Register";
  final String registerViewsubtitle = "Create a new account";

  final String emailHintText = "email";
  final String passwordHintText = "password";
  final String userNameHintText = "username";

  final String signInButtonText = "SIGN IN";
  final String registerButtonText = "REGISTER";
  final String createAccountButtonText = "Create my account";
  final String loginButtonText = "LOGIN";

  Future<void> signInWithEmail() async {
    await _auth.onSignInWithEmail(
      emailController.text,
      passwordController.text,
    );
  }

  Future<void> signUpWithEmail() async {
    await _auth.onSignUpWithEmail(
      userName: userNameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
  }
}

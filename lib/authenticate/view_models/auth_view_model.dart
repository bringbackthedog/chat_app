import 'package:flutter/material.dart';
import 'package:flutter_chat_app/authenticate/services/auth_service.dart';
// TODO: Create `AuthViewModel` class with
//    -  a member of AuthService called _auth
//    - a member `toggleLoginRegister` of type function (required in constructor)
// TODO: create
// TODO: Create `emailController`, `passwordController`, and `userNameController` as `TextEdititingControllers`
// to track value of textfields
// TODO: create `signInWithEmail` method : call AuthService method
// TODO: create `signUpWithEmail` method : call AuthService method

class AuthViewModel {
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
}

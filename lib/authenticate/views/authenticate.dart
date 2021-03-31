import 'package:flutter/material.dart';
import 'package:flutter_chat_app/authenticate/view_models/auth_view_model.dart';
import 'package:flutter_chat_app/authenticate/views/login.dart';
import 'package:flutter_chat_app/authenticate/views/register.dart';

// TODO: Create Stateful widget `Authenticate`
// TODO: Declare an unitialized authViewModel parameter in the state (outside build)
// TODO: Create a bool `showingLoginView` initialized to `true`
// TODO: Create a `toggleLoginRegister`  method that rebuilds this view based of the value of `showingLoginView`

// TODO:  Within build Create AuthViewModel and pass `toggleLoginRegister` to its constructor
// TODO:  Return LoginView/RegisterView views based on `showingLoginView` (assigning the viewmodel to their constructor)
//
//
//
//
//

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

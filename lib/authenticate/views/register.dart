import 'package:flutter/material.dart';
import 'package:flutter_chat_app/authenticate/view_models/auth_view_model.dart';
import 'package:flutter_chat_app/core/helpers/layout.dart';

class RegisterView extends StatelessWidget {
  RegisterView({@required this.authViewModel});
  final AuthViewModel authViewModel;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Container(
          width: getColumnWidthForThisScreen(width, maxColWidth),
          height: height,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /// HEADER
                  Container(
                    height: height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// ICON
                        Container(
                            child: Icon(
                          Icons.chat,
                          size: 50,
                          color: Colors.white,
                        )),

                        /// TITLE CARD
                        ListTile(
                          title: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Text(
                              authViewModel.registerViewtitle,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          subtitle: Text(
                            authViewModel.registerViewsubtitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// FORM
                  Column(
                    children: [
                      // USERNAME
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: TextFormField(
                          controller: authViewModel.userNameController,
                          decoration: InputDecoration(
                            hintText: authViewModel.userNameHintText,
                            contentPadding: EdgeInsets.only(left: 14),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      // EMAIL
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: TextFormField(
                          controller: authViewModel.emailController,
                          decoration: InputDecoration(
                            hintText: authViewModel.emailHintText,
                            contentPadding: EdgeInsets.only(left: 14),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),

                      // PASSWORD
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: TextFormField(
                          controller: authViewModel.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: authViewModel.passwordHintText,
                            contentPadding: EdgeInsets.only(left: 14),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// BUTTONS
                  FractionallySizedBox(
                    widthFactor: 0.75,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: ElevatedButton(
                              onPressed: () async =>
                                  await authViewModel.signUpWithEmail(),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.deepOrange[800]),
                              child: FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Center(
                                    child: Text(
                                      authViewModel.createAccountButtonText,
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                ),
                              )),
                        ),

                        /// TOGGLE LOGIN
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                          ),
                          onPressed: authViewModel.toggleLoginRegister,
                          child: FractionallySizedBox(
                            widthFactor: 0.35,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    Text(
                                      authViewModel.loginButtonText,
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nextnotes/res/CustomColors.dart';
import 'package:nextnotes/utils/Authentication.dart';
import 'package:nextnotes/widget/google_sign_in_button.dart';


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/firebase_logo.png',
                        height: 160,
                        )
                      ),
                      SizedBox(height: 20),
                      Text(
                        'NextNotes',
                        style: TextStyle(
                          color: CustomColors.firebaseYellow,
                          fontSize: 40
                        )
                      ),
                      Text(
                        'Authentication',
                        style: TextStyle(
                          color: CustomColors.firebaseOrange,
                          fontSize: 40,
                        ),
                      ),
                  ],
                )
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.firebaseOrange,
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
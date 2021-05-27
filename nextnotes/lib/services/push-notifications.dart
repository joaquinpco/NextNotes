
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm;
  final BuildContext context;

  PushNotificationService(this._fcm, this.context);

  Future initialise() async {
    if (Platform.isIOS || Platform.isAndroid) {
      _fcm.requestPermission();
    }

    showAlertDialog(BuildContext context, String message) {
      // set up the button
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () { Navigator.pop(context); },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("New Notification"),
        content: Text(message),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    String token = (await _fcm.getToken()).toString();
    print("FirebaseMessaging token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showAlertDialog(context, message.notification.toString());
    });
  }
}

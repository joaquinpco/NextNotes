import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nextnotes/routes/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nextnotes/services/push-notifications.dart';

Future<void> main() async{
  await DotEnv.load(fileName: ".env");
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Widget build(BuildContext context) {
    final pushNotificationService = PushNotificationService(_firebaseMessaging, context);
    pushNotificationService.initialise();

    return MaterialApp(
      title: 'NextNotes',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      routes: getApplicationRoutes(),
    );
  }
}

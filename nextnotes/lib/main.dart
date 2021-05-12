import 'package:flutter/material.dart';
import 'package:nextnotes/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
 
Future<void> main() async {

  WidgetsFlutterBinding().ensureFrameCallbacksRegistered();

  await Firebase.initializeApp();

  runApp(MyApp()); 
  
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NextNotes',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(), 
    );
  }
}
import 'package:flutter/material.dart';
import 'package:nextnotes/routes/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
Future main() async{
  await DotEnv.load(fileName: ".env");
  runApp(MyApp()); 
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
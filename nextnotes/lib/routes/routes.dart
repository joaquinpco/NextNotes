import 'package:flutter/material.dart';
import 'package:nextnotes/pages/login_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder> {
    '/': (BuildContext context) => LoginPage(),
  };
}

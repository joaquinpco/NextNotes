import 'package:flutter/material.dart';

import 'package:nextnotes/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder> {
    '/' : (BuildContext context) => HomePage()
  };
}
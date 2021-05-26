import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {

    String? _name;
    String? _text;
    String? _color;

    return Scaffold(
      appBar: AppBar(
        title: Text('NextNotes - Add'),
      ),
      body: Column(
        children: <Widget>[

        ]
      ),
    );
  }
}
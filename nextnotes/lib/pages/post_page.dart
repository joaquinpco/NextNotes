import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nextnotes/res/CustomColors.dart';
import 'package:nextnotes/utils/Api.dart';
import 'dart:convert';

class PostPage extends StatefulWidget {

  PostPage({Key? key, required User user}) : _user=user, super(key: key);
  final User _user;

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  String? _name;
  String? _text;
  String? _colour;
  String? _userId;

  Future<void> _postNote(
    String? name, String text,
    String colour, String userId
  ) async {
    colour = colour == "null" ? "#000000": colour;

    Map<String, dynamic> body = {
      "Name" : name, 
      "Colour" : colour,
      "Text" : text, 
      "UserId" : userId,  
    };
    Uri url = Api().getUri("/notes");
    await Api.httpPost(url, jsonEncode(body));
  }

  Widget _createNotesTitle() {
    _name = "";

    return Padding(
      padding: EdgeInsets.all(25.0),
      child: TextFormField(
      autofocus: true,
      initialValue: _name,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
          ),
        hintText: 'Notes title',
        labelText: 'title',
        helperText: 'Write some title to this note',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.note )
      ),
      onChanged: (valor) {
        print(valor);
       _name = valor;
      }
    ));
  }

  Widget _createNotesContent() {
    _text = "";
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: TextFormField(
      autofocus: true,
      initialValue: _text,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
          ),
        hintText: 'Notes content',
        labelText: 'content',
        helperText: 'Write a description or the note semantics.',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.comment_outlined )
      ),
      onChanged: (valor) {
        _text = valor;
      }
    )
    );
  }

  void postNote() async {
    setState(() {});
    await _postNote(_name, _text.toString(), _colour.toString(), widget._user.uid);
    Navigator.pop(context);
  }

  Widget _createNotesButton() {
    return TextButton(
      style: TextButton.styleFrom(
        primary: CustomColors.firebaseYellow,
        onSurface: CustomColors.firebaseOrange,
      ),
      onPressed: postNote,
      child: Text('New Note'),
    );
  }

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
          _createNotesTitle(),
          _createNotesContent(),
          _createNotesButton()
        ]
      ),
    );
  }
}
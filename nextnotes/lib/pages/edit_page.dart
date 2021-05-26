import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nextnotes/models/Note.dart';
import 'package:nextnotes/res/CustomColors.dart';
import 'package:nextnotes/utils/Api.dart';

class EditPage extends StatefulWidget {
  EditPage({Key? key, required Note note}) : _note=note, super(key: key);

  final Note _note;

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  String? _name;
  String? _text;
  String? _color;


  Future<void> _putNote(
    String? name, String text, String id,
    String colour, String userId
  ) async {
    colour = colour == "null" ? "#000000": colour;

    Map<String, dynamic> body = {
      "Name" : name, 
      "Colour" : colour,
      "Text" : text, 
      "UserId" : userId,  
    };
    Uri url = Api().getUri("/notes", params: {"id" : id});
    await Api.httpPut(url, jsonEncode(body));
  }
  void updateNote() async {
    setState(() {});
    Note note = widget._note;
    await _putNote(
      _name, _text.toString(), note.ID.toString(), 
      _color.toString(), note.UserId.toString()
    );
  }

  Widget _createNotesTitle() {
    _name = widget._note.Name;

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
    _text = widget._note.Text;
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

  Widget _createNotesButton() {
    return TextButton(
      style: TextButton.styleFrom(
        primary: CustomColors.firebaseYellow,
        onSurface: CustomColors.firebaseOrange,
      ),
      onPressed: updateNote,
      child: Text('TextButton'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("NextNotes - Edit"),
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
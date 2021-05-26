import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:nextnotes/models/Note.dart';
import 'package:nextnotes/pages/edit_page.dart';
import 'package:nextnotes/res/CustomColors.dart';
import 'package:nextnotes/utils/Api.dart';

class NotesPage extends StatefulWidget {
  NotesPage({Key? key, required User user}) : _user=user, super(key: key);

  User _user;

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {


  Future<List<Note>> _retrieveAllNotesFromDatabase() async {
    Map<String, dynamic> map = { "userId" : widget._user.uid };
    Uri url = Api().getUri("/notes", params: map);    
    dynamic response = await Api.httpGet(url);
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Note>((json) => Note.fromJson(json)).toList();
  }

  Future<void> _deleteNote(String? id) async {
    Map<String, dynamic> param = { "id" : id };
    Uri url = Api().getUri("/notes", params: param);
    await Api.httpDelete(url);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Note>>(
      future: _retrieveAllNotesFromDatabase(),
      builder: (ctx, snapshot) {
        List<Widget> items = [];
        snapshot.data?.forEach((element) {
          items.add(Card(
              color: Color(
                CustomColors.getColorFromHex(
                  element.Colour.toString()
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text(element.Name.toString()),
                    subtitle: Text(element.Text.toString())
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: Icon(
                          Icons.edit, 
                          color: CustomColors.firebaseGrey,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditPage(note: element,)),
                          ).then((value) => setState(() {
                            _retrieveAllNotesFromDatabase();
                          }));
                        },
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        onPressed: () async {
                          await _deleteNote(
                            element.ID
                          );
                          setState(() {
                            _retrieveAllNotesFromDatabase();
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ]
              ),
          ));
        });
        
        return Scaffold(
          body: ListView(
            children: items,
          ),
        );
      },
    );
  }

}
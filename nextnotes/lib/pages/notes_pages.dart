import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:nextnotes/models/Note.dart';
import 'package:nextnotes/res/CustomColors.dart';
import 'package:nextnotes/utils/Api.dart';

class NotesPage extends StatefulWidget {
  NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {


  Future<List<Note>> _retrieveAllNotesFromDatabase() async {
    Map<String, dynamic> map = { "userId" : "1" };
    Uri url = Api().getUri("/notes", params: map);    
    dynamic response = await Api.httpGet(url);
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Note>((json) => Note.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Note>>(
      future: _retrieveAllNotesFromDatabase(),
      builder: (ctx, snapshot) {
        List<Widget> items = [];
        snapshot.data?.forEach((element) { 
          print(element); 
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
                    title: Text(element.Text.toString()),
                    subtitle: Text(element.Name.toString())
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: Icon(
                          Icons.edit, 
                          color: CustomColors.firebaseGrey,
                        ),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        onPressed: () {/* ... */},
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
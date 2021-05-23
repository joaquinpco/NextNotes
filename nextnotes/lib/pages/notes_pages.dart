import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nextnotes/models/Note.dart';
import 'package:nextnotes/utils/Api.dart';

class NotesPage extends StatefulWidget {
  NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {


  Future<List<Note>> _retrieveAllNotesFromDatabase() async {
    Uri url = Api().getUri("/notes");
    dynamic response = await Api.httpGet(url);
    print(response);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Note>>(
      future: _retrieveAllNotesFromDatabase(),
      builder: (ctx, snapshot) {
        List<Note>? notes = snapshot.data;
        return Container();
      },
    );
  }

}
import 'package:flutter/material.dart';

class Note {
  int? _id;
  String? _title;
  String? _content;
  Color _noteColor;

  Note(this._id, this._title, this._content, this._noteColor);

  get title => _title;
  get content => _content;
  get noteColor => _noteColor;
  set title(title) => _title = title;
  set content(content) => _content = content;
  set noteColor(noteColor) => _noteColor = noteColor;  

  @override
  String toString() {
    return {
      'id': _id,
      'title': _title,
      'content': _content,
      'noteColor': _noteColor
    }.toString();
  }
}
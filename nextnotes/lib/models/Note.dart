import 'package:flutter/material.dart';

class Note {
  int? id;
  String? title;
  String? content;
  Color noteColor;

  Note(this.id, this.title, this.content, this.noteColor);

  @override
  String toString() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'noteColor': noteColor
    }.toString();
  }
}
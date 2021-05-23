import 'package:flutter/material.dart';

class Note {
  
  String? name;
  String? text;
  String? userId;
  Color colour;

  Note(this.name, this.text, this.colour);

  get title => name;
  get content => text;
  get noteColor => colour;
  get userUUID => this.userId; 
  set title(title) => name = title;
  set content(content) => text = content;
  set noteColor(noteColor) => colour = noteColor; 
  set userUUID(userId) => this.userId; 

  @override
  String toString() {
    return {
      'Name': name,
      'Text': text,
      'Colour': colour,
      'UserId': userId,
    }.toString();
  }
}
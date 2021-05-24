import 'package:flutter/material.dart';

class Note {
  
  final String? Name;
  final String? Text;
  final String? ID;
  final String? Colour;

  Note({
    required this.Name, 
    required this.Text, 
    required this.ID, 
    required this.Colour
    });


  factory Note.fromJson(Map<String, dynamic> parsedJSON) {
    return new Note(
      Name: parsedJSON['Name'],
      Text: parsedJSON['Text'],
      ID: parsedJSON['ID'],
      Colour: parsedJSON['Colour']
    );
  }

  @override
  String toString() {
    return {
      'Name': Name,
      'Text': Text,
      'ID': ID,
      'Colour': Colour,
    }.toString();
  }
}
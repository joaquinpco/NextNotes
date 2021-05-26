import 'package:flutter/material.dart';

class Note {
  
  final String? Name;
  final String? Text;
  final String? ID;
  final String? Colour;
  final String? UserId;

  Note({
    required this.Name, 
    required this.Text, 
    required this.ID, 
    required this.Colour,
    required this.UserId
  });


  factory Note.fromJson(Map<String, dynamic> parsedJSON) {
    return new Note(
      Name: parsedJSON['Name'],
      Text: parsedJSON['Text'],
      ID: parsedJSON['ID'],
      Colour: parsedJSON['Colour'],
      UserId: parsedJSON['UserId']
    );
  }

  @override
  String toString() {
    return {
      'Name': Name,
      'Text': Text,
      'ID': ID,
      'Colour': Colour,
      'UserId': UserId
    }.toString();
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nextnotes/pages/notes_pages.dart';
import 'package:nextnotes/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    NotesPage(),
    ProfilePage()
  ];

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('NextNotes'),
     ),
     body: _children[_currentIndex],
     bottomNavigationBar: BottomNavigationBar(
       currentIndex: _currentIndex,
       onTap: onTabTapped, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.notes),
           label: 'Notes',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           label: 'Profile'
         )
       ],
     ),
   );    
  }
}
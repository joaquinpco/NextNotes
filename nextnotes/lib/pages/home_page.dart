import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nextnotes/pages/notes_pages.dart';
import 'package:nextnotes/pages/post_page.dart';
import 'package:nextnotes/pages/profile_page.dart';
import 'package:nextnotes/res/CustomColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  User get defaultUser => _user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  late User _user;

  @override
  void initState() { 
    _user = widget._user;
    super.initState();
  }

  int _currentIndex = 0;

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
  }

  bool isNoteTab() => _currentIndex == 0;

  void pressedFloatingButton() {
    setState(() {
      if(isNoteTab()) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostPage()),
        );
      }
      else {
        print("Settings");
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> _children = [
      NotesPage(),
      ProfilePage(user: widget.defaultUser,)
    ];

    final List<Icon> _icons = [
      Icon(Icons.add),
      Icon(Icons.settings)
    ];

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
           icon: Icon(Icons.notes),
           label: 'Notes',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           label: 'Profile'
         )
       ],
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: pressedFloatingButton,
       child: _icons[_currentIndex],
       backgroundColor: CustomColors.firebaseGrey,
     ),
   );    
  }
}
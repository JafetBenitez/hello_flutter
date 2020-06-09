import 'package:flutter/material.dart';
import 'package:hello_flutter/Drawer.dart';
import 'package:hello_flutter/InboxScreen.dart';
import 'package:hello_flutter/MessageList.dart';

import 'CalendarScreen.dart';
import 'ComposeButton.dart';
import 'ContactsScreen.dart';



class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        InboxScreen(),
        ContactsScreen(),
        CalendarScreen()
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.inbox), title: Text('Inbox')),
          BottomNavigationBarItem(icon: Icon(Icons.people_outline), title: Text('Contacts')),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), title: Text('Calendar')),

        ],
        onTap: _inBasItemTap,
        currentIndex: _selectedIndex,
      ),
              );
          }
        
          void _inBasItemTap(int value) {
            setState(() {
              this._selectedIndex = value;
            });
  }
}

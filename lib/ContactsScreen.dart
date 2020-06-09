import 'package:flutter/material.dart';
import 'package:hello_flutter/Drawer.dart';

import 'ContactsManager.dart';

class ContactsScreen extends StatelessWidget {
  final ContactsManager manger = ContactsManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Contacts'),
        actions: <Widget>[
          Chip(
            backgroundColor: Colors.white,
            label: StreamBuilder<int>(
              stream: manger.contactsCounter,
              builder: (context, snapshot) {
                return Text((snapshot.data ?? 0).toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold ) ,);
              }
            ), padding: EdgeInsets.only(right: 4),)
        ],
        ),
          body: Center(
        child: StreamBuilder<List<String>>(
          stream: manger.contactListNow,
          builder: (context, snapshot) {


            List<String> contacts = snapshot.data;

            return ListView.separated(
              itemBuilder: (BuildContext context, int index ) {
                return ListTile(title: Text(contacts[index]));
              }, 
              separatorBuilder: (BuildContext context, int index ) {
                return Divider();
              }, 
              itemCount: contacts.length);
          }
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(child: Text('JB'),),
              accountEmail: Text('jafet@eetz.com'),
              accountName: Text('Jafet Benitez'),),
              ListTile(
                leading: Icon(FontAwesomeIcons.inbox),
                title: Text('Inbox'),
                trailing: Chip(label: Text('98'),),
                ),
              ListTile(
                leading: Icon(FontAwesomeIcons.paperPlane),
                title: Text('Sent'),
                trailing: Chip(label: Text('98'),),
                ),
              ListTile(
                leading: Icon(FontAwesomeIcons.github),
                title: Text('Draft'),
                trailing: Chip(label: Text('98'),),
                ),
              ListTile(
                leading: Icon(FontAwesomeIcons.trash),
                title: Text('Trash'),
                trailing: Chip(label: Text('98'),),
                ),
              Divider(),
              Expanded(
                child:  Align(
                alignment: FractionalOffset.bottomCenter,
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.cog),
                    title: Text('Settings'),),
                    )
              )

          ],),
        );
  }
}
import 'package:flutter/material.dart';
import 'package:hello_flutter/Drawer.dart';

import 'MessageList.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 2,
          child: Scaffold(
            drawer: AppDrawer(),
                appBar: AppBar(
              title: Text('Inbox'),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.refresh),
                onPressed: () {

                })
              ],
              bottom: TabBar(tabs: <Widget>[
                Tab(text: "Important",),
                Tab(text: "Whatever",)
              ]),
            ),
                  body: TabBarView(children: <Widget>[
              MessageList(status: "important"),
              MessageList(status: "whatever")
            ]
            ),
      ),
    );
  }
}
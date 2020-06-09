import 'package:flutter/material.dart';
import 'package:hello_flutter/Drawer.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
          appBar: AppBar(
          title: Text('Calendar'),
          ),
          body: Center(
        child: Text('Calendar'),
      ),
    );
  }
}
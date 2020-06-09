import 'package:flutter/material.dart';

import 'Message.dart';

class MessageDetail extends StatelessWidget {
  final Message message;

  MessageDetail(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(this.message.subject)),
      body:     Center(
        child: Text(this.message.body),
      )
    );
    
    
    

  }
}
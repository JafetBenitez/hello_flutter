import 'package:flutter/material.dart';
import 'package:hello_flutter/Message.dart';

import 'MessageCompose.dart';

class ComposeButton extends StatelessWidget {
  final List<Message> messages;

  ComposeButton(this.messages);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(child: Icon(Icons.add)  , onPressed: () async {
          Message message = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
            return MessageCompose();
          }));
          if(message != null) {
            this.messages.add(message);
                      String txt = message.subject;
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('You message was sent with $txt')
          ));
          }
        },);

  }
}
import 'package:flutter/material.dart';
import 'package:hello_flutter/Message.dart';


class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  Message messageForm = new Message('', '','');
  String sender = '';
  String subject = '';
  String body = '';
  final key = GlobalKey<FormState>();

@override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Message Form')), body: Container(
      child: Form(
          key: key,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            ListTile(
              title:TextFormField(
                onSaved: (value){
                  this.sender = value;
                },
                validator: (value) => !value.contains('@') ? 'email invalid' : null,
                decoration: InputDecoration(
                labelText: 'TO',
                labelStyle: TextStyle(fontWeight: FontWeight.bold)
              ),
            ) ,
            ) 
            ,
            ListTile(
              title: 
              TextFormField(
                onSaved: (value){
                  this.subject = value;
                },
              decoration: InputDecoration(
                labelText: 'SUBJECT',
                labelStyle: TextStyle(fontWeight: FontWeight.bold)
              ),
            )
              ,)
            , ListTile(title: TextFormField(
              onSaved: (value) {
                this.body = value;
              },
              decoration: InputDecoration(
                labelText: 'BODY',
                labelStyle: TextStyle(fontWeight: FontWeight.bold)
              ),
              maxLines: 9,
            )
            
            ,),
            ListTile( 
              title: RaisedButton(child: Text('SEND'), onPressed: () {
                
                if(this.key.currentState.validate() ){

                  this.key.currentState.save();
                  print(this.sender);
                  print(this.subject);
                  print(this.body);

                  Message message = Message(this.subject, this.body, this.sender);
                  Navigator.pop(context, message);
                }


              },))
            
          ]),
      )


    ));
  }
}


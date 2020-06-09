import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'Message.g.dart';

@JsonSerializable()
class Message {
  final String sender;
  final String subject;
  final String body;


  Message(this.subject, this.body, this.sender);
 
  factory Message.fromJson(Map<String, dynamic> json) 
    => _$MessageFromJson(json);

  static Future<List<Message>> browse({status = 'important'}) async{

    String url= 'http://www.mocky.io/v2/5e4b4ca12f0000640097d7ac';

    if( status == 'important') {
      url = "http://www.mocky.io/v2/5e78066a3300005d0009a128";
    }

    http.Response  response = await http.get(url);

    String content = response.body;
    
    var parsed = json.decode(content);

    List<Message> collection = List<Message>.from(parsed.map((i) => Message.fromJson(i)));
    return collection;

  }
}

import 'package:flutter/material.dart';
import 'package:hello_flutter/Message.dart';
import 'package:hello_flutter/MessageDetail.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class MessageList extends StatefulWidget {
  final String title;
  final String status;

  MessageList({this.title, this.status = 'important'});

  @override
  State<StatefulWidget> createState() => _MessageList();
}

class _MessageList extends State<MessageList> {
  Future<List<Message>> future;
  List<Message> messages;

  void initState() {
    super.initState();
    this.fetch();
  }

  fetch() async {

    this.future =  Message.browse(status: widget.status);
    this.messages = await this.future;
  }

  _showSnackBar(BuildContext ctx, String txt) {
    Scaffold.of(ctx).showSnackBar(SnackBar(
            content: Text(txt)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
            future: future,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Nothing to see. Bye.');
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return Center(child: CircularProgressIndicator());
                  break;
                case ConnectionState.done:
                  if (snapshot.hasError) return Text('There is an error: ${snapshot.error}');
                  // var messages = snapshot.data;
                  return Center(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: messages.length,
                          itemBuilder: (BuildContext context, int index) {
                            Message msgItm = messages[index];
                            return Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 0.25,
                              key: UniqueKey(),
                               actions: <Widget>[
                                  IconSlideAction(
                                    caption: 'Archive',
                                    color: Colors.blue,
                                    icon: Icons.archive,
                                    onTap: () => _showSnackBar(context, 'Archive'),
                                  ),
                                  IconSlideAction(
                                    caption: 'Share',
                                    color: Colors.indigo,
                                    icon: Icons.share,
                                    onTap: () => _showSnackBar(context, 'Share'),
                                  ),
                                ],
                                secondaryActions: <Widget>[
                                  IconSlideAction(
                                    caption: 'More',
                                    color: Colors.black45,
                                    icon: Icons.more_horiz,
                                    onTap: () => _showSnackBar(context, 'More'),
                                  ),
                                  IconSlideAction(
                                    caption: 'Delete',
                                    color: Colors.red,
                                    icon: Icons.delete,
                                    onTap: () => _showSnackBar(context, 'Delete'),
                                  ),
                                ],
                              child: ListTile(
                                onTap: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
                                    return MessageDetail(messages[index]);
                                  }));
                                
                                },
                                leading: CircleAvatar(
                                  child: Text(msgItm.sender.substring(0, 1)),
                                ),
                                title: Text(msgItm.subject),
                                subtitle: Text(
                                  msgItm.body,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          }));
              }
            });
  }
}


import 'package:abcd/models/event.dart';
import 'package:flutter/material.dart';

class EventsTile extends StatelessWidget {

  final EVent event;
  EventsTile({ required this.event });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            
          ),
          title: Text(event.name),
          
        ),
      ),
    );
  }
}
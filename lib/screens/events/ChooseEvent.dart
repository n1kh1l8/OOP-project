// ignore_for_file: use_key_in_widget_constructors, unused_import, file_names, duplicate_ignore, avoid_unnecessary_containers, prefer_const_constructors

import 'package:abcd/models/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EventsTile.dart';

class ChooseEvent extends StatefulWidget {
  @override
  _ChooseEvent createState() => _ChooseEvent();
}

class _ChooseEvent extends State<ChooseEvent> {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<List<Event>>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: events.length,
      itemBuilder: (context, index) {
        return EventsTile(event: events[index]);
      },
    );
    // return Container(
    //   child: Text("Events"),
    // );
  }
}

import 'dart:html';

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

    final events = Provider.of<List<EVent>>(context);

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return EventsTile(event: events![index]);
      },
    );
  }
}
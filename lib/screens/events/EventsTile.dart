// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:abcd/models/event.dart';
import 'package:abcd/models/profile.dart';
import 'package:abcd/models/user.dart';
import 'package:abcd/screens/events/event_details.dart';
import 'package:abcd/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsTile extends StatefulWidget {
  final Event event;
  EventsTile({required this.event});

  @override
  State<EventsTile> createState() => _EventsTileState();
}

class _EventsTileState extends State<EventsTile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass?>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StreamProvider<Profile>.value(
                      value: DatabaseService(uid: user!.uid).profileData,
                      initialData: Profile(
                          name: '',
                          college: '',
                          email_id: '',
                          phone_no: '',
                          gender: '',
                          registration_nos: {},
                          events_registered: ''),
                      child: EventDetails(event: widget.event))));
        },
        child: Container(
          height: 80,
          child: Card(
              elevation: 10,
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),

            child: ListTile(

              leading: CircleAvatar(

               // radius: 20.0,
                radius: 20,
                backgroundColor: Colors.blue,
                child: Icon(

                  Icons.arrow_forward,
                  color: Colors.grey[800],
                ),
              ),
              title: Text(widget.event.name),
            ),
          ),
        ),
      ),
    );
  }
}

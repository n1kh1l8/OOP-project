// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:abcd/models/profile.dart';
import 'package:abcd/models/user.dart';
import 'package:abcd/screens/events/event_registration.dart';
import 'package:abcd/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abcd/models/event.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class EventDetails extends StatefulWidget {
  //const EventDetails({Key? key}) : super(key: key);

  final Event event;
  EventDetails({required this.event});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass?>(context);
    final profile = Provider.of<Profile?>(context);

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Event Details',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 25,
            )),
        backgroundColor: Colors.brown[100],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 75),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  Container(
                      height: 200.0,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Hero(
                          tag: widget.event.name,
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: widget.event.images,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(widget.event.name,
                  style: const TextStyle(
                    color: Colors.brown,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    //fontFamily: "Overlock",
                  )),
              Text(
                "Dates: ${widget.event.dates}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  //fontFamily: "Nunito"),
                ),
              ),
              Text(
                "Time:  - ${widget.event.times}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  //fontFamily: "Nunito"),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                widget.event.status,
                style: const TextStyle(
                  color: Colors.brown,
                  fontSize: 20.0,
                  //fontFamily: "Nunito")
                ),
              ),
              const SizedBox(
                height: 7.0,
              ),
              Text(
                widget.event.description,
                style: const TextStyle(
                  color: Colors.brown,
                  fontSize: 20.0,
                  //fontFamily: "Nunito")
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                "Defending Champions: ${widget.event.winners}",
                style: const TextStyle(
                  color: Colors.brown,
                  fontSize: 20.0,
                  //fontFamily: "Nunito")
                ),
              ),
              const SizedBox(height: 15.0),
              ButtonTheme(
                minWidth: 150,
                height: 40,
                child: RaisedButton(
                  color: Colors.pink[400],
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => user!.isRegistered
                                ? EventRegistration(
                                    event_uid: widget.event.event_uid,
                                    no_of_participants:
                                        widget.event.no_of_participants,
                                    is_registered: true,
                                    profile: profile,
                                  )
                                : EventRegistration(
                                    event_uid: widget.event.event_uid,
                                    no_of_participants:
                                        widget.event.no_of_participants,
                                    is_registered: false,
                                  )));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

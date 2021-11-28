// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_init_to_null

import 'package:abcd/models/profile.dart';
import 'package:abcd/models/user.dart';
import 'package:abcd/services/database.dart';
import 'package:abcd/shared/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventRegistration extends StatefulWidget {
  // const EventRegistration({Key? key}) : super(key: key);
  final int no_of_participants;
  final String event_uid;
  final bool is_registered;
  final dynamic profile;
  EventRegistration(
      {required this.no_of_participants,
      required this.event_uid,
      this.profile = null,
      required this.is_registered});

  @override
  _EventRegistrationState createState() => _EventRegistrationState();
}

class _EventRegistrationState extends State<EventRegistration> {
  final _formKey = GlobalKey<FormState>();

  String name = '-1';
  String email_id = '-1';
  String phone_no = '-1';
  String college = '-1';
  String gender = '-1';

  Future<void> _showErrorDialog(String error) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return errorDialog(error: error);
        });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass?>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://raw.githubusercontent.com/afgprogrammer/Flutter-Login-Page-UI/master/assets/images/background.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Register\nFor Event',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              autofocus: true,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Name",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (val) => val!.isEmpty
                                  ? "Please enter your name"
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  name = val;
                                });
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              autofocus: true,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "College",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (val) => val!.isEmpty
                                  ? "Please enter your college name"
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  college = val;
                                });
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              autofocus: true,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (val) => val!.isEmpty
                                  ? "Please enter your email id"
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  email_id = val;
                                });
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              autofocus: true,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (val) => val!.isEmpty
                                  ? "Please enter your phone number"
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  phone_no = val;
                                });
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              autofocus: true,
                              textInputAction: TextInputAction.done,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Gender(M/F)",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (val) => val!.isEmpty
                                  ? "Please enter your gender(M/F)"
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  gender = val;
                                });
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          if (user!.isRegistered == true) {
                                            var new_no =
                                                widget.no_of_participants + 1;
                                            widget.profile.registration_nos
                                                .append({
                                              widget.event_uid: "$new_no"
                                            });
                                            widget.profile.events_registered
                                                .append(widget.event_uid);
                                            dynamic result1 =
                                                await DatabaseService(
                                                        uid: user.uid)
                                                    .editRegistrationNosData(
                                                        widget.profile
                                                            .registration_nos,
                                                        widget.profile
                                                            .events_registered);
                                            dynamic result2 = DatabaseService(
                                                    event_uid: widget.event_uid)
                                                .editNoOfParticipantsInEvent(
                                                    new_no);
                                            if (result1 != null &&
                                                result2 != null) {
                                              setState(() {
                                                _showErrorDialog(
                                                    "Could not register");
                                              });
                                            } else {
                                              Navigator.pop(context);
                                            }
                                          } else {
                                            var new_no =
                                                widget.no_of_participants + 1;
                                            DatabaseService(uid: user.uid)
                                                .firstRegistration();
                                            DatabaseService(uid: user.uid)
                                                .addProfileData(name, email_id,
                                                    phone_no, college, gender, {
                                              widget.event_uid: "$new_no"
                                            }, [
                                              widget.event_uid
                                            ]);
                                            DatabaseService(
                                                    event_uid: widget.event_uid)
                                                .editNoOfParticipantsInEvent(
                                                    new_no);
                                          setState(() {
                                            Navigator.pop(context);
                                          });
                                          }
                                        }
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

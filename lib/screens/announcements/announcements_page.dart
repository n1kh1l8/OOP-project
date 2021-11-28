// ignore_for_file: prefer_const_constructors

import 'package:abcd/services/auth.dart';
import 'package:flutter/material.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({Key? key}) : super(key: key);

  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(child: GestureDetector(onTap: () async {
        await _auth.signOut();
      },child: Text("Announcements"))),
    );
  }
}

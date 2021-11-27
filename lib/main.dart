// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:abcd/screens/wrapper.dart';
import 'package:abcd/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserClass?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Overlock'),
        home: Wrapper(),
      ),
    );
  }
}

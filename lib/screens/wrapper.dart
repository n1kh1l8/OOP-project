import 'package:abcd/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:abcd/services/auth.dart';
import 'package:abcd/shared/error_dialog.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  //const Register({Key? key}) : super(key: key);
  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';
  String admin_passcode = '';

  Future<void> _showErrorDialog(String error) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return errorDialog(error: error);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://raw.githubusercontent.com/afgprogrammer/Flutter-Login-Page-UI/master/assets/images/background.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Sign\nup',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              autofocus: true,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (val) =>
                                  val!.isEmpty ? "Please enter an email" : null,
                              onChanged: (val) {
                                setState(() {
                                  email = val;
                                });
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              style: TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (val) => val!.length < 8
                                  ? "Password should be longer than 8 characters"
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  password = val;
                                });
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.done,
                              style: TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Admin Passcode",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              onChanged: (val) {
                                setState(() {
                                  admin_passcode = val;
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
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                      color: Colors.grey[800],
                                      onPressed: () async {
                                        if (_formkey.currentState!.validate()) {
                                          setState(() {
                                            loading = true;
                                          });
                                          dynamic result = await _auth
                                              .registerWithEmailAndPassword(
                                                  email,
                                                  password,
                                                  admin_passcode);
                                          if (result == null) {
                                            error =
                                                "Could not Register with those Credentials";
                                            loading = false;
                                            _showErrorDialog(error);
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Go back to sign in',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    widget.toggleView();
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.red[800],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     TextButton(
                            //       onPressed: () {
                            //         Navigator.pushNamed(context, 'register');
                            //       },
                            //       child: Text(
                            //         'Sign Up',
                            //         textAlign: TextAlign.left,
                            //         style: TextStyle(
                            //             decoration: TextDecoration.underline,
                            //             color: Color(0xff4c505b),
                            //             fontSize: 18),
                            //       ),
                            //       style: ButtonStyle(),
                            //     ),
                            //     TextButton(
                            //         onPressed: () {},
                            //         child: Text(
                            //           'Forgot Password',
                            //           style: TextStyle(
                            //             decoration: TextDecoration.underline,
                            //             color: Color(0xff4c505b),
                            //             fontSize: 18,
                            //           ),
                            //         )),
                            //   ],
                            // )
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

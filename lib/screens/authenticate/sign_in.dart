// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:abcd/services/auth.dart';
import 'package:abcd/shared/error_dialog.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  //const SignIn({ Key? key }) : super(key: key);
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  bool _autoFocus = true;

  //text field state
  String email = '';
  String password = '';
  String error = '';

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
                'Sign\nIn',
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
                              autofocus: _autoFocus,
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
                                              .signInWithEmailAndPassword(
                                                  email, password);
                                          if (result == null) {
                                            setState(() {
                                              loading = false;
                                              _autoFocus = false;
                                            });
                                            error =
                                                "Could not Sign In with those Credentials";
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
                                  'If you are not registered:',
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

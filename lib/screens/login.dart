import 'package:flutter/material.dart';
import 'package:abcd/screens/SignUp.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('https://raw.githubusercontent.com/afgprogrammer/Flutter-Login-Page-UI/master/assets/images/background.png'), fit: BoxFit.cover),

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
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
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
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    color: Colors.grey[800],
                                    onPressed: () {},
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
                                    fontSize: 20, fontWeight: FontWeight.w700,color: Colors.red),
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    color: Colors.red[800],
                                    onPressed: () {
                                      Navigator.pushNamed(context,'SignUp');
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
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
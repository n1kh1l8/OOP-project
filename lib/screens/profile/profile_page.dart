// ignore_for_file: prefer_const_constructors

import 'package:abcd/models/profile.dart';
import 'package:abcd/models/user.dart';
import 'package:abcd/services/database.dart';
import 'package:abcd/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserClass?>(context);
    return StreamBuilder<Profile>(
      stream: DatabaseService(uid: user!.uid).profileData,
      builder: (context, snapshot)
        {
          if(snapshot.hasData)
            {
              var profile = snapshot.data;
          return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Event Details',
        style: TextStyle(
        color: Colors.black54,
        fontSize: 25,
        )),
        backgroundColor: Colors.brown[100],
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
        icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
        ),
        onPressed: () {},
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.edit,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       // Navigator.of(context).push(MaterialPageRoute(
        //       //     builder: (BuildContext context) => SettingsPage()));
        //     },
        //   ),
        // ],
        ),
        body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
        onTap: () {
        FocusScope.of(context).unfocus();
        },
        child: ListView(
        children: [
        Text(
        "Profile Page",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        SizedBox(
        height: 15,
        ),
        Center(
        child: Stack(
        children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
          border: Border.all(
          width: 4,
          color: Theme.of(context).scaffoldBackgroundColor),
          boxShadow: [
          BoxShadow(
          spreadRadius: 2,
          blurRadius: 10,
          color: Colors.black.withOpacity(0.1),
          offset: Offset(0, 10))
          ],
          // shape: BoxShape.circle,
          // image: const DecorationImage(
          //     fit: BoxFit.cover,
          //     image: NetworkImage(
          //        "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
          //     ))
          ),
          ),
          Positioned(
          bottom: 0,
          right: 0,
          child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
          shape: BoxShape.circle,
        border: Border.all(
        width: 4,
        color: Theme.of(context).scaffoldBackgroundColor,
        ),
        color: Colors.green,
        ),
        child: Icon(
        Icons.edit,
        color: Colors.white,
        ),
        )),
        ],
        ),
        ),
        SizedBox(
        height: 35,
        ),

        Text(
        "Full Name: ${profile!.name}",
        style: const TextStyle(
        color: Colors.black,
        fontSize: 28.0,
        //fontFamily: "Nunito"),
        ),
        ),
        SizedBox(
        height:  35.0,
        ),
        Text(
        "College: ${profile.college}",
        style: const TextStyle(
        color: Colors.black,
        fontSize: 28.0,
        //fontFamily: "Nunito"),
        ),
        ),
        SizedBox(
        height:  35.0,
        ),
        Text(
        "Email Id: ${profile.email_id}",
        style: const TextStyle(
        color: Colors.black,
        fontSize: 28.0,
        //fontFamily: "Nunito"),
        ),
        ),
        SizedBox(
        height:  35.0,
        ),
        Text(
        "Phone Number: ${profile.phone_no}",
        style: const TextStyle(
        color: Colors.black,
        fontSize: 28.0,
        //fontFamily: "Nunito"),
        ),
        ),
        // buildTextField("Full Name", profile.name, false),
        // buildTextField("E-mail", profile.email_id, false),
        // //buildTextField("Password", "********", true),
        // buildTextField("Phone Number", profile.phone_no, false),
        // buildTextField("college", profile.college, false),
        // buildTextField("Gender", profile.gender, false),
        SizedBox(height: 35),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     RaisedButton(
        //       padding: EdgeInsets.symmetric(horizontal: 30),
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(20)),
        //       onPressed: () {},
        //       color: Colors.blue,
        //       child: Text("Upcoming Events",
        //           style: TextStyle(
        //               fontSize: 12,
        //               letterSpacing: 2.0,
        //               color: Colors.white)),
        //     ),
        //     RaisedButton(
        //       onPressed: () {},
        //       color: Colors.blue,
        //       padding: EdgeInsets.symmetric(horizontal: 30),
        //       elevation: 2,
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(20)),
        //       child: Text(
        //         "Results",
        //         style: TextStyle(
        //             fontSize: 12,
        //             letterSpacing: 2.2,
        //             color: Colors.white),
        //       ),
        //     )
        //   ],
        // )
        ],
          ),
          ),
          ),
          );

            } else {
            print("1 - ${snapshot.hasData}");
            print("2 - ${snapshot.connectionState}");
            return Container(
              child: Text(
                "Loading",
              ),
            );
          }
        }

    );
    final profile = Provider.of<Profile>(context);

    var name = profile.name == '' ? "Name" : profile.name;
    var email = profile.email_id == ''? "Email" : profile.email_id;
    var college = profile.college == ''? "College" : profile.college;
    var phone = profile.phone_no == ''? "Phone Number": profile.phone_no;


  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.black,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            floatingLabelBehavior: FloatingLabelBehavior
                .always, // helps to see player details statically.
            labelText: labelText,
            hintText: placeholder,
            labelStyle: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}

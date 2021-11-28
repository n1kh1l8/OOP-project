// ignore_for_file: prefer_const_constructors
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(

        leading: IconButton(
          icon:const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title:const Text('About Us'),
        centerTitle: true,
        backgroundColor: Colors.red[600],

      ),
      body:
      SingleChildScrollView(

        child:Column(

          children: [
            Container(
//           color:Colors.orangeAccent,
              child:Text(
                'Spree ‘20: Rising from Ashes is a call to all those who live, breathe and dream sports. At Spree, we give you a platform to showcase your skills, learn from others and grow as a community. Our goal, is not only to conduct a sports competition, but allow everyone to live an experience. It is in that spirit, that we include mesmerizing cultural nights and a plethora of off-beat events. We proudly organize "Udaan", a sports fest for specially abled kids, and a marathon for the cause "Do not Drink and Drive", as part of our social responsibility. This Spree, we invite you to seek discomfort, to put all fears behind, to reset your limits, reach farther than ever before and be a part of this enthralling extravaganza, that is Spree ‘20:Rising from Ashes.',

                textAlign: TextAlign.center,
                style: GoogleFonts.stylish(
                  textStyle: TextStyle(color: Colors.blue, letterSpacing: 1.5),
                  fontSize: 20,
                ),


              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.50),
              child: Container(

                child:Text(
                  'GALLERY',
                  style: GoogleFonts.satisfy(
                    textStyle: TextStyle(color: Colors.red, letterSpacing: 1.5,
                      fontSize:40,
                    ),
                  ),
                ),
              ),
            ),
            Container(

              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 200.0,
              child: ListView(

                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    child: Image(
                      height:150,
                      width:300,
                      image: NetworkImage('https://static.vecteezy.com/system/resources/previews/002/399/730/non_2x/victory-podium-with-gift-cups-vector.jpg'),

                    ),
                    width: 160.0,
                    color: Colors.red,
                  ),
                  Container(
                    child: Image(
                      height:150,

                      image: NetworkImage('https://static.vecteezy.com/system/resources/previews/002/399/730/non_2x/victory-podium-with-gift-cups-vector.jpg'),

                    ),
                    width: 160.0,
                    color: Colors.blue,
                  ),
                  Container(
                    child: Image(
                      height:150,

                      image: NetworkImage('https://static.vecteezy.com/system/resources/previews/002/399/730/non_2x/victory-podium-with-gift-cups-vector.jpg'),

                    ),
                    width: 160.0,
                    color: Colors.green,
                  ),
                  Container(
                    child: Image(
                      height:150,

                      image: NetworkImage('https://static.vecteezy.com/system/resources/previews/002/399/730/non_2x/victory-podium-with-gift-cups-vector.jpg'),

                    ),
                    width: 160.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Image(
                      height:150,

                      image: NetworkImage('https://static.vecteezy.com/system/resources/previews/002/399/730/non_2x/victory-podium-with-gift-cups-vector.jpg'),

                    ),
                    width: 160.0,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}

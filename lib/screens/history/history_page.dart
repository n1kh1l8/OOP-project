// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:abcd/models/history.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final history = Provider.of<History>(context);
    return Scaffold(
      appBar: AppBar( title: Text('History of spree'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.grey[800]
            //     ),
            //   padding: EdgeInsets.only(top: 25),
            //   child: Align(
            //     alignment: Alignment(-0.75, -1),
            //     child: Text(
            //       'History of Spree',
            //       style: TextStyle(
            //         fontSize: 25.0,
            //         fontWeight: FontWeight.w100,
            //          fontFamily: 'Lobster-Regular',
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey[700]
                  
                  ),
// margin: EdgeInsets.fromLTRB(4, 10, 0, 5) ,
              padding: EdgeInsets.only(left: 35, top: 30, right: 35),
              child: Text(

                 'Spree is the annual sports fest of BITS Pilani K.K. Birla Goa Campus. SPREE is the biggest Inter-Collegiate Sports and Entertainment festival of India, organised with the sole aim of promoting sports and social interaction amongst colleges from India and abroad.  Since its inception in 2006 by a bunch of sports enthusiasts, SPREE has grown into India’s biggest inter-collegiate sports fest. Every year the number of participants in this intercollegiate sports and entertainment festival is on the rise, thus providing a stiff competitive quality to each of the sporting events like football, basketball, cricket, volleyball, badminton, tennis, squash, table tennis, carom, chess, kabaddi and powerlifting. Colleges from across the country in major cities like Mumbai, New Delhi, Pune, Jaipur, Hyderabad, Indore and so on, send their most athletic students to compete for the laurels of Spree. Spree has kept synchronism with the evolving nature of sports by including off beat events like Ultimate Frisbee, Kho Kho, Tug of War, Pool, Gully Cricket and Futsal. Besides being a coveted competitive base for athletes all over the country, the festival also has a wide range of social initiatives under its letterhead, like Udaan, the Spree Marathon and the ‘Act to Inspire’ campaign. Udaan, organized by Spree in collusion with NGO Nirmaan, is for the benefit of the specially- abled children. Various sporting events, workshops and talks by celebrities convert the 3 days of Spree into a source of happiness for the less fortunate. Spree symbolizes the sporting spirit of the engineering colleges of India. With guest speakers like Kapil Dev and Simon Taufel and live performances by The Local Train and Nucleya, Spree turns BITS Goa into a sports party for three days.',
                //history.description,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Raleway',
                  color: Colors.white,
                ),
              ),
            ),
            Container(

              // margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 200.0,
              child: ListView(

                scrollDirection: Axis.horizontal,
               // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    child: Image(
                      height:250,
                      width:300,
                      image: NetworkImage('https://bits-spree.org/static/media/5.e89c7241.jpg'),

                    ),
                    width: 160.0,
                    color: Colors.blueGrey[700],
                  ),
                  Container(
                    child: Image(
                      height:250,

                      image: NetworkImage('https://bits-spree.org/static/media/13.72c93879.jpg'),

                    ),
                    width: 160.0,
                    color: Colors.blueGrey[700],
                  ),
                  Container(
                    child: Image(
                      height:150,

                      image: NetworkImage('https://bits-spree.org/static/media/2.b8923e03.jpg'),

                    ),
                    width: 160.0,
                    color: Colors.blueGrey[700],
                  ),
                  // Container(
                  //   child: Image(
                  //     height:150,
                  //
                  //     image: NetworkImage('https://bits-spree.org/static/media/9.ed6cf09a.jpg'),
                  //
                  //   ),
                  //   width: 160.0,
                  //   color: Colors.blueGrey[700],
                  // ),
                  Container(
                    child: Image(
                      height:150,

                      image: NetworkImage('https://bits-spree.org/static/media/6.e47ac93f.jpg'),

                    ),
                    width: 160.0,
                    color: Colors.blueGrey[700],
                  ),
                ],
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //       gradient: LinearGradient(colors: [
            //     Colors.blue,
            //     Colors.blueGrey,
            //     Colors.deepOrangeAccent,
            //   ])),
            //   padding: EdgeInsets.only(bottom: 30),
            //   child: Align(
            //     alignment: Alignment(-0.75, -1),
            //     child: Text(
            //       'Gallery',
            //       style: TextStyle(
            //         fontSize: 22.50,
            //         fontWeight: FontWeight.bold,
            //         fontFamily: 'Lobster-Regular',
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.blueGrey[700],
            //   ),
            //   padding: EdgeInsets.fromLTRB(75, 0, 75, 15),
            //   child: Image(image: NetworkImage(
            //        'https://pbs.twimg.com/profile_images/650737633597886464/DYTKEmxm_400x400.jpg')),
            //       //history.images[0])),
            // ),
            // Container(
            //   decoration: BoxDecoration(
            //       gradient: LinearGradient(colors: [
            //     Colors.blue,
            //     Colors.blueGrey,
            //     Colors.deepOrangeAccent,
            //   ])),
            //   padding: EdgeInsets.fromLTRB(75, 0, 75, 15),
            //   child: Image(image: NetworkImage(
            //        'https://bits-spree.org/static/media/10.bb417679.jpg')),
            //       //history.images[1])),
            // ),
            // Container(
            //   decoration: BoxDecoration(
            //       gradient: LinearGradient(colors: [
            //     Colors.blue,
            //     Colors.blueGrey,
            //     Colors.deepOrangeAccent,
            //   ])),
            //   padding: EdgeInsets.fromLTRB(75, 0, 75, 15),
            //   child: Image(image: NetworkImage(
            //        'https://bits-spree.org/static/media/8.b8e2cbc9.jpg')),
            //       //history.images[2])),
            // ),
            // Container(
            //   decoration: BoxDecoration(
            //       gradient: LinearGradient(colors: [
            //     Colors.blue,
            //     Colors.blueGrey,
            //     Colors.deepOrangeAccent,
            //   ])),
            //   padding: EdgeInsets.fromLTRB(75, 0, 75, 15),
            //   child: Image(image: NetworkImage(
            //        'https://bits-spree.org/static/media/13.72c93879.jpg')),
            //       //history.images[3])),
            // ),
          ],
        ),
      ),
    );
    ;
  }
}

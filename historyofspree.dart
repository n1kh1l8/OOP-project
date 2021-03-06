import 'package:flutter/material.dart';

class HistoryOfSpree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          Icons.arrow_back_ios,
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.blueGrey,
                        Colors.deepOrangeAccent,
                      ]
                  )
              ),
              padding: EdgeInsets.only(top: 25),
              child: Align(
                alignment: Alignment(-0.75, -1),
                child: Text(
                  'History of Spree',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lobster-Regular', color: Colors.black,
                  ),
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.blueGrey,
                        Colors.deepOrangeAccent,
                      ]
                  )
              ),
              padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
              child: const Text(
                'Spree is the annual sports fest of BITS Pilani K.K. Birla Goa Campus. SPREE is the biggest Inter-Collegiate Sports and Entertainment festival of India, organised with the sole aim of promoting sports and social interaction amongst colleges from India and abroad.  Since its inception in 2006 by a bunch of sports enthusiasts, SPREE has grown into India’s biggest inter-collegiate sports fest. Every year the number of participants in this intercollegiate sports and entertainment festival is on the rise, thus providing a stiff competitive quality to each of the sporting events like football, basketball, cricket, volleyball, badminton, tennis, squash, table tennis, carom, chess, kabaddi and powerlifting. Colleges from across the country in major cities like Mumbai, New Delhi, Pune, Jaipur, Hyderabad, Indore and so on, send their most athletic students to compete for the laurels of Spree. Spree has kept synchronism with the evolving nature of sports by including off beat events like Ultimate Frisbee, Kho Kho, Tug of War, Pool, Gully Cricket and Futsal. Besides being a coveted competitive base for athletes all over the country, the festival also has a wide range of social initiatives under its letterhead, like Udaan, the Spree Marathon and the ‘Act to Inspire’ campaign. Udaan, organized by Spree in collusion with NGO Nirmaan, is for the benefit of the specially- abled children. Various sporting events, workshops and talks by celebrities convert the 3 days of Spree into a source of happiness for the less fortunate. Spree symbolizes the sporting spirit of the engineering colleges of India. With guest speakers like Kapil Dev and Simon Taufel and live performances by The Local Train and Nucleya, Spree turns BITS Goa into a sports party for three days.',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w200,
                  fontFamily: 'Lobster-Regular',
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.blueGrey,
                        Colors.deepOrangeAccent,
                      ]
                  )
              ),
              padding: EdgeInsets.only(bottom: 30),
              child: Align(
                alignment: Alignment(-0.75, -1),
                  child: Text(
                    'Gallery',
                    style: TextStyle(
                      fontSize: 22.50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster-Regular', color: Colors.black,
                    ),
                  ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.blueGrey,
                        Colors.deepOrangeAccent,
                      ]
                  )
              ),
              padding: EdgeInsets.fromLTRB(75, 0, 75, 15),
              child: Image(
                image: NetworkImage('https://pbs.twimg.com/profile_images/650737633597886464/DYTKEmxm_400x400.jpg'),
              ),
            ),

        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.blueGrey,
                    Colors.deepOrangeAccent,
                  ]
              )
          ),
          padding: EdgeInsets.fromLTRB(75, 0, 75, 15),
          child: Image(
            image: NetworkImage('https://bits-spree.org/static/media/10.bb417679.jpg'),
          ),
        ),

            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.blueGrey,
                        Colors.deepOrangeAccent,
                      ]
                  )
              ),
              padding: EdgeInsets.fromLTRB(75, 0, 75, 15),
              child: Image(
                image: NetworkImage('https://bits-spree.org/static/media/8.b8e2cbc9.jpg'),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.blueGrey,
                        Colors.deepOrangeAccent,
                      ]
                  )
              ),
              padding: EdgeInsets.fromLTRB(75, 0, 75, 15),
              child: Image(
                image: NetworkImage('https://bits-spree.org/static/media/13.72c93879.jpg'),
              ),
            ),
        ],
      ),
      ),
    );
  }
}



// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:abcd/models/sponsor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sponser extends StatefulWidget {
  @override
  State<Sponser> createState() => _SponserState();
}

class _SponserState extends State<Sponser> {
  @override
  Widget build(BuildContext context) {
    // final sponsors = Provider.of<List<Sponsor>>(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text('SPONSORSHIPS'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 80.0,
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/BITS_Pilani_Goa_Campus_Main_Building.JPG/1200px-BITS_Pilani_Goa_Campus_Main_Building.JPG'),
                  ),
                ),
                Divider(
                  height: 50.0,
                  color: Colors.black,
                ),
                Text(
                  'TITLE SPONSOR- CocaCola',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                   'Spree ’21 is proud to announce PokerStars as the Official Title Sponsor of Rook ’n Rule 2.0, and our official Poker Partner. You’ll find the best tournaments and games here, with secure deposits, fast withdrawals and award winning software. You can practice your poker skills with Play-money, or can join games with real money. There is no better place to learn and play Poker.',
                  //sponsors[0].text,
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.0,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(
                //   height: 10.0,
                // ),
                // Center(child: Image(image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/spree-app-a8c89.appspot.com/o/Sponsors%2FSponsor1%2FPokerstars-app-download.jpeg?alt=media&token=6c7125bb-c0dd-4d3a-b6dd-7015974f34d0"),)),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'RESTAURANT PARTNER- PayTM',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                   'Spree ’21, is proud to associate with Sale and Pepe as the Official Restaurant Partner for Rook ’n Rule 2.0. Sale and Pepe, famous for its authentic Neapolitan pizzas, is an Ahmedabad based Restaurant. Twice Winner of the Times food award, it is one of the best eateries in town, and a must go to!',
                  //sponsors[1].text,
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.0,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'MERCHANDISE PARTNER- Unilever',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                   'Spree ’21 is glad to associate with Kambo Handicrafts as the Official Merchandise Partner for Rook ’n Rule 2.0. Based out of Amritsar, Kambo handicrafts has an extensive range of chess boards, wooden handicrafts and toys. Their have a wide range of skilfully produced items, which are supplied throughout the country.',
                  //sponsors[2].text,
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.0,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'SAVINGS PARTNER- YouTube',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                   'Spree ’21 is happy to announce GrabOn as the Official Savings Partner of Rook ’n Rule 2.0. Coupons are countless, Deals are innumerable, Savings are priceless with GrabOn. Find Latest Coupons & Offers For Online Shopping Sites in India. GrabOn ensures that you get the right coupon codes, promo codes and deals, whenever you need them!',
                  //sponsors[3].text,
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.0,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'abcd@bits-spree.org',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '+91 9922334455',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

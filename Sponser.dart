import 'package:flutter/material.dart';

class Sponser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('SPONSORSHIPS'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
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
                    backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/BITS_Pilani_Goa_Campus_Main_Building.JPG/1200px-BITS_Pilani_Goa_Campus_Main_Building.JPG'),
                  ),
                ),
                Divider(
                  height: 50.0,
                  color: Colors.black,
                ),
                Text(
                  'TITLE SPONSOR',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  'Spree ’21 is proud to announce PokerStars as the Official Title Sponsor of Rook ’n Rule 2.0, and our official Poker Partner. You’ll find the best tournaments and games here, with secure deposits, fast withdrawals and award winning software. You can practice your poker skills with Play-money, or can join games with real money. There is no better place to learn and play Poker.',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'RESTAURANT PARTNER',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  'Spree ’21, is proud to associate with Sale and Pepe as the Official Restaurant Partner for Rook ’n Rule 2.0. Sale and Pepe, famous for its authentic Neapolitan pizzas, is an Ahmedabad based Restaurant. Twice Winner of the Times food award, it is one of the best eateries in town, and a must go to!',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'MERCHANDISE PARTNER',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  'Spree ’21 is glad to associate with Kambo Handicrafts as the Official Merchandise Partner for Rook ’n Rule 2.0. Based out of Amritsar, Kambo handicrafts has an extensive range of chess boards, wooden handicrafts and toys. Their have a wide range of skilfully produced items, which are supplied throughout the country.',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'SAVINGS PARTNER',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  'Spree ’21 is happy to announce GrabOn as the Official Savings Partner of Rook ’n Rule 2.0. Coupons are countless, Deals are innumerable, Savings are priceless with GrabOn. Find Latest Coupons & Offers For Online Shopping Sites in India. GrabOn ensures that you get the right coupon codes, promo codes and deals, whenever you need them!',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 15.0,
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
                        fontSize: 17.0,
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
                        fontSize: 17.0,
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
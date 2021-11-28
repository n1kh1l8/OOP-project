// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:abcd/models/event.dart';
import 'package:abcd/models/history.dart';
import 'package:abcd/models/leaderboard.dart';
import 'package:abcd/models/profile.dart';
import 'package:abcd/models/sponsor.dart';
import 'package:abcd/models/user.dart';
import 'package:abcd/screens/about_us/about_us_page.dart';
import 'package:abcd/screens/announcements/announcements_page.dart';
import 'package:abcd/screens/events/ChooseEvent.dart';
import 'package:abcd/screens/history/history_page.dart';
import 'package:abcd/screens/leaderboard/leaderboard_page.dart';
import 'package:abcd/screens/profile/profile_page.dart';
import 'package:abcd/screens/schedule/schedule.dart';
import 'package:abcd/screens/sponsors/Sponser.dart';
import 'package:abcd/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _controller = PageController();

  void initState() {
    _controller = PageController();
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass?>(context);

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0.0,
        title: Text("Home"),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.red,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: Colors.black,
                child: DrawerHeader(
                  child: Text(
                    "Drawer Header",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _controller.animateToPage(0,
                            duration: Duration(milliseconds: 1200),
                            curve: Curves.easeInOut);
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          size: 26.0,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Home",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller.animateToPage(1,
                            duration: Duration(milliseconds: 1200),
                            curve: Curves.easeInOut);
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          size: 26.0,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Schedule",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller.animateToPage(2,
                            duration: Duration(milliseconds: 1200),
                            curve: Curves.easeInOut);
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          size: 26.0,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Profile",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller.animateToPage(3,
                            duration: Duration(milliseconds: 1200),
                            curve: Curves.easeInOut);
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          size: 26.0,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Leaderboard",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller.animateToPage(4,
                            duration: Duration(milliseconds: 1200),
                            curve: Curves.easeInOut);
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          size: 26.0,
                          color: Colors.white,
                        ),
                        title: Text(
                          "History",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller.animateToPage(5,
                            duration: Duration(milliseconds: 1200),
                            curve: Curves.easeInOut);
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          size: 26.0,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Sponsors",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller.animateToPage(6,
                            duration: Duration(milliseconds: 1200),
                            curve: Curves.easeInOut);
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          size: 26.0,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Announcements",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller.animateToPage(7,
                            duration: Duration(milliseconds: 1200),
                            curve: Curves.easeInOut);
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          size: 26.0,
                          color: Colors.white,
                        ),
                        title: Text(
                          "About Us",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: _controller,
        pageSnapping: false,
        children: <Widget>[
          StreamProvider<List<Event>>.value(
              value: DatabaseService().eventsList,
              initialData: <Event>[],
              child: ChooseEvent()),
          StreamProvider<List<Event>>.value(
              value: DatabaseService().eventsList,
              initialData: <Event>[],
              child: Schedule()),
          StreamProvider<Profile>.value(
              value: DatabaseService(uid: user!.uid).profileData,
              initialData: Profile(
                  name: '',
                  college: '',
                  email_id: '',
                  phone_no: '',
                  gender: '',
                  registration_nos: {},
                  events_registered: ''),
              child: ProfilePage()),
          StreamProvider<List<Leaderboard>>.value(
              value: DatabaseService().leaderboardList,
              initialData: <Leaderboard>[],
              child: LeaderboardPage()),
          StreamProvider<History>.value(
              value: DatabaseService().historyData,
              initialData: History(
                description: '',
                images: [],
              ),
              child: HistoryPage()),
          StreamProvider<List<Sponsor>>.value(
              value: DatabaseService().sponsorsList,
              initialData: <Sponsor>[],
              child: Sponser()),
          AnnouncementsPage(),
          AboutUsPage()
        ],
      ),
    );
  }
}

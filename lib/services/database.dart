import 'package:abcd/models/about_us.dart';
import 'package:abcd/models/announcement.dart';
import 'package:abcd/models/event.dart';
import 'package:abcd/models/history.dart';
import 'package:abcd/models/leaderboard.dart';
import 'package:abcd/models/profile.dart';
import 'package:abcd/models/sponsor.dart';
import 'package:abcd/models/user.dart';
import 'package:abcd/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
user - > documents with uid -> profile collection -> PrelimData doc
                                                  -> ProfileData doc

sponsors -> documents with name of company -> details inside documents  

leaderboard -> documents with name of college -> details inside documents

aboutus -> About Us document -> details in document

history -> History document -> details in document

announcements -> announcement headline document -> details inside documents

events -> docs with event uid -> details of events in docs
*/

class DatabaseService {
  final String uid;
  final String admin_passcode;
  final String company_name;
  final String college_name;
  final String headline;
  final String event_uid;
  DatabaseService(
      {this.admin_passcode = '',
      this.uid = '',
      this.company_name = '',
      this.college_name = '',
      this.headline = '',
      this.event_uid = ''});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");

  final CollectionReference sponsorCollection =
      FirebaseFirestore.instance.collection("Sponsors");

  final CollectionReference leaderboardCollection =
      FirebaseFirestore.instance.collection("Leaderboard");

  final CollectionReference aboutUsCollection =
      FirebaseFirestore.instance.collection('About Us');

  final CollectionReference historyCollection =
      FirebaseFirestore.instance.collection('History');

  final CollectionReference announcementsCollection =
      FirebaseFirestore.instance.collection('Announcements');

  final CollectionReference eventsCollection =
      FirebaseFirestore.instance.collection("Events");

  Future setPrelimUserData() async {
    return await userCollection
        .doc(uid)
        .collection("Profile")
        .doc("PrelimData")
        .set(<String, dynamic>{
      "isAdmin": admin_passcode == ADMIN_PASSCODE ? true : false,
      "isRegistered": false
    });
  }

  Future addProfileData(
      String name,
      String email_id,
      int phone_no,
      String college,
      String gender,
      Map<String, String> registration_nos,
      List<String> events_registered) async {
    return await userCollection
        .doc(uid)
        .collection("Profile")
        .doc("ProfileData")
        .set(<String, dynamic>{
          "name": name,
          "email_id": email_id,
          "phone_no": phone_no.toInt(),
          "college": college,
          "gender": gender,
          "registrations_nos": registration_nos,
          "events": events_registered
        })
        .then((value) => print("added profile data"))
        .catchError((error) {
          return error;
        });
  }

  Future editProfileData(String name, String email_id, int phone_no,
      String college, String gender) async {
    return await userCollection
        .doc(uid)
        .collection("Profile")
        .doc("ProfileData")
        .update(<String, dynamic>{
          "name": name,
          "email_id": email_id,
          "phone_no": phone_no.toInt(),
          "college": college,
          "gender": gender,
        })
        .then((value) => print("edited profile data"))
        .catchError((error) {
          return error;
        });
  }

  Future deleteProfileData() async {
    return await userCollection
        .doc(uid)
        .collection("Profile")
        .doc("ProfileData")
        .delete()
        .then((value) => print("deleted profile data"))
        .catchError((error) {
      return error;
    });
  }

  Future addCollegeToLeaderboard(String name, int rank, int points) async {
    return await leaderboardCollection
        .doc(college_name)
        .set(<String, dynamic>{
          "name": college_name,
          "rank": rank.toInt(),
          "points": points.toInt()
        })
        .then((value) => print("added $college_name to leaderboard"))
        .catchError((error) {
          return error;
        });
  }

  Future deleteCollegeFromLeaderboard() async {
    return await leaderboardCollection
        .doc(college_name)
        .delete()
        .then((value) => print("deleted $college_name from leaderboard"))
        .catchError((error) {
      return error;
    });
  }

  Future editCollegeDataInLeaderboard(int rank, int points) async {
    return await leaderboardCollection
        .doc(college_name)
        .update(
            <String, dynamic>{"rank": rank.toInt(), "points": points.toInt()})
        .then((value) => print("edited Leaderboard"))
        .catchError((error) {
          return error;
        });
  }

  Future addAnnouncement(
      String headline, DateTime date, DateTime time, String text) async {
    return await announcementsCollection
        .doc(headline)
        .set(<String, dynamic>{
          "headline": headline,
          "date": date,
          "time": time,
          "text": text
        })
        .then((value) => print("added announcement"))
        .catchError((error) {
          return error;
        });
  }

  Future deleteAnnouncement() async {
    return await announcementsCollection
        .doc(headline)
        .delete()
        .then((value) => print("deleted announcement"))
        .catchError((error) {
      return error;
    });
  }

  Future editNoOfParticipantsInEvent(int no_of_participants) async {
    return await eventsCollection
        .doc(event_uid)
        .update(
            <String, dynamic>{"no_of_participants": no_of_participants.toInt()})
        .then((value) => print("edited no_of_participants in $event_uid"))
        .catchError((error) {
          return error;
        });
  }

  Future addWinnersToEvent(List<String> winners) async {
    return await eventsCollection
        .doc(event_uid)
        .update(<String, dynamic>{"winners": winners})
        .then((value) => print("edited no_of_participants in $event_uid"))
        .catchError((error) {
          return error;
        });
  }

  Future firstRegistration() async {
    return await userCollection
        .doc(uid)
        .collection('Profile')
        .doc('PrelimData')
        .update(<String, dynamic>{"isRegistered": true})
        .then((value) => print("first registration complete"))
        .catchError((error) {
          return error;
        });
  }

  Sponsor _sponsorDataFromSnapshot(DocumentSnapshot snapshot) {
    return Sponsor(
        company_name: company_name,
        image: snapshot.get('imageURL'),
        text: snapshot.get('text'));
  }

  List<Sponsor> _sponsorsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Sponsor(
          company_name: doc.get('company_name') ?? '',
          image: doc.get('imageURL') ?? '',
          text: doc.get('text') ?? '');
    }).toList();
  }

  AboutUs _aboutUsDataFromSnapshot(DocumentSnapshot snapshot) {
    return AboutUs(
        images: snapshot.get('images'),
        text: snapshot.get('text'),
        video: snapshot.get('video'));
  }

  History _historyDataFromSnapshot(DocumentSnapshot snapshot) {
    return History(
        description: snapshot.get('description'),
        images: snapshot.get('images'));
  }

  Leaderboard _leaderboardDataFromSnapshot(DocumentSnapshot snapshot) {
    return Leaderboard(
        name: college_name,
        points: snapshot.get('points'),
        rank: snapshot.get('rank'));
  }

  List<Leaderboard> _leaderboardListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Leaderboard(
          name: doc.get('name') ?? '',
          points: doc.get('points') ?? 0,
          rank: doc.get('rank') ?? 0);
    }).toList();
  }

  Announcement _announcementDataFromSnapshot(DocumentSnapshot snapshot) {
    return Announcement(
        date: snapshot.get('date'),
        text: snapshot.get('text'),
        headline: headline,
        time: snapshot.get('time'));
  }

  List<Announcement> _announcementsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Announcement(
          date: doc.get('date') ?? DateTime(0),
          text: doc.get('text') ?? '',
          headline: doc.get('headline') ?? '',
          time: doc.get('time') ?? DateTime(0));
    }).toList();
  }

  EVent _eventDataFromSnapshot(DocumentSnapshot snapshot) {
    return EVent(
        no_of_participants: snapshot.get('no_of_participants'),
        dates: snapshot.get('dates'),
        description: snapshot.get('description'),
        event_uid: snapshot.get('event_uid'),
        images: snapshot.get('images'),
        name: snapshot.get('name'),
        status: snapshot.get('status'),
        times: snapshot.get('times'),
        winners: snapshot.get('winners'));
  }

  List<EVent> _eventListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return EVent(
          no_of_participants: doc.get('no_of_participants') ?? 0,
          dates: doc.get('dates') ?? [],
          description: doc.get('description') ?? '',
          event_uid: event_uid,
          images: doc.get('images') ?? [],
          name: doc.get('name') ?? '',
          status: doc.get('status') ?? '',
          times: doc.get('times') ?? [],
          winners: doc.get('winners') ?? []);
    }).toList();
  }

  Profile _profileDataFromSnapshot(DocumentSnapshot snapshot) {
    return Profile(
        college: snapshot.get('college'),
        email_id: snapshot.get('email_id'),
        events_registered: snapshot.get('events_registered'),
        gender: snapshot.get('gender'),
        name: snapshot.get('name'),
        phone_no: snapshot.get('phone_no'),
        registration_nos: snapshot.get('registration_nos'));
  }

  UserClass _userPrelimDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserClass(
        uid: uid,
        isAdmin: snapshot.get('isAdmin'),
        isRegistered: snapshot.get('isRegistered'));
  }

  Stream<Profile> get profileData {
    return userCollection
        .doc(uid)
        .collection("Profile")
        .doc('ProfileData')
        .snapshots()
        .map(_profileDataFromSnapshot);
  }

  Stream<UserClass> get userData {
    return userCollection
        .doc(uid)
        .collection('Profile')
        .doc('PrelimData')
        .snapshots()
        .map(_userPrelimDataFromSnapshot);
  }

  Stream<List<Sponsor>> get sponsorsList {
    return sponsorCollection.snapshots().map(_sponsorsListFromSnapshot);
  }

  Stream<Sponsor> get sponsorData {
    return sponsorCollection
        .doc(company_name)
        .snapshots()
        .map(_sponsorDataFromSnapshot);
  }

  Stream<AboutUs> get aboutUsData {
    return aboutUsCollection
        .doc('About Us')
        .snapshots()
        .map(_aboutUsDataFromSnapshot);
  }

  Stream<History> get historyData {
    return historyCollection
        .doc('History')
        .snapshots()
        .map(_historyDataFromSnapshot);
  }

  Stream<List<Leaderboard>> get leaderboardList {
    return leaderboardCollection.snapshots().map(_leaderboardListFromSnapshot);
  }

  Stream<Leaderboard> get leaderboardData {
    return leaderboardCollection
        .doc(college_name)
        .snapshots()
        .map(_leaderboardDataFromSnapshot);
  }

  Stream<List<Announcement>> get announcementsList {
    return announcementsCollection
        .snapshots()
        .map(_announcementsListFromSnapshot);
  }

  Stream<Announcement> get announcementData {
    return announcementsCollection
        .doc(headline)
        .snapshots()
        .map(_announcementDataFromSnapshot);
  }

  Stream<List<EVent>> get eventsList {
    return eventsCollection.snapshots().map(_eventListFromSnapshot);
  }

  Stream<EVent> get eventData {
    return eventsCollection
        .doc(event_uid)
        .snapshots()
        .map(_eventDataFromSnapshot);
  }
}

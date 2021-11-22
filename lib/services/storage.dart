import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final String event_uid;
  final int image_no;
  final String company_name;
  StorageService(
      {this.event_uid = '', this.image_no = 0, this.company_name = ''});

  final storageInstance = FirebaseStorage.instance;

  Future getEventImage() async {
    return await storageInstance
        .ref("$event_uid/image-$image_no.jpg")
        .getDownloadURL();
  }

  Future getHistoryImage() async {
    return await storageInstance
        .ref("history/image-$image_no.jpg")
        .getDownloadURL();
  }

  Future getSponsorImage() async {
    return await storageInstance
        .ref("sponsors/$company_name-$image_no.jpg")
        .getDownloadURL();
  }

  Future getAboutUsImage() async {
    return await storageInstance
        .ref("about_us/image-$image_no.jpg")
        .getDownloadURL();
  }

  Future getAboutUsVideo() async {
    return await storageInstance
        .ref("about_us/about_us_video.mp4")
        .getDownloadURL();
  }
}

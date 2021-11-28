class Profile {
  final String name;
  final String email_id;
  final String phone_no;
  final String college;
  final String gender;
  final Map<String, String> registration_nos;
  final String events_registered;
  Profile(
      {required this.college,
      required this.email_id,
      required this.events_registered,
      required this.gender,
      required this.name,
      required this.phone_no,
      required this.registration_nos});
}

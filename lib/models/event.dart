class Event {
  final int no_of_participants;
  final String name;
  final List<dynamic> dates;
  final List<dynamic> times;
  final String status;
  final String images;
  final String description;
  final String event_uid;
  final List<dynamic> winners;
  Event(
      {required this.no_of_participants,
      required this.dates,
      required this.description,
      required this.event_uid,
      required this.images,
      required this.name,
      required this.status,
      required this.times,
      required this.winners});
}

class Event {
  final String title;
  final String date;
  final String imageUrl;

  Event({
    required this.title,
    required this.date,
    required this.imageUrl,
  });

  factory Event.fromMap(Map<String, dynamic> data) {
    return Event(
      title: data['title'] ?? '',
      date: data['date'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }
}

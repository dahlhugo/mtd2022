class MtdEvent {
  final String name;
  final String type;
  final String place;
  final String description;
  final DateTime date;

  MtdEvent({
    required this.name,
    required this.type,
    required this.place,
    required this.description,
    required this.date,
  });

  factory MtdEvent.fromRTDB(Map<String, dynamic> data) {
    return MtdEvent(
        name: data['name'] ?? "",
        type: data['type'] ?? "",
        place: data['place'] ?? "",
        description: data['description'] ?? "",
        date: DateTime.parse(data['date']));
  }
}

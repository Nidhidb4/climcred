// Certificate model
class Certificate {
  final String id;
  final String name;
  final String club;
  final String event;
  final String date;
  final String certificateId;
  final String userId;

  Certificate({
    this.id = '',
    required this.name,
    required this.club,
    required this.event,
    required this.date,
    required this.certificateId,
    this.userId = '',
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      club: json['club'] ?? '',
      event: json['event'] ?? '',
      date: json['date'] ?? '',
      certificateId: json['certificateId'] ?? '',
      userId: json['userId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'club': club,
      'event': event,
      'date': date,
      'certificateId': certificateId,
      'userId': userId,
    };
  }
}

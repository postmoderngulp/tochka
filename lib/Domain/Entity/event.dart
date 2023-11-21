import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class event {
  int id;
  String title;
  String description;
  bool is_open;
  int max_num_participants;
  String datetime_event;
  String? datetime_creation;
  int organizer_id;
  double rate;
  String address;
  List<dynamic> interests;
  List<dynamic> participants;

  event({
    required this.id,
    required this.title,
    required this.description,
    required this.is_open,
    required this.max_num_participants,
    required this.datetime_event,
    required this.datetime_creation,
    required this.organizer_id,
    required this.rate,
    required this.address,
    required this.interests,
    required this.participants,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'is_open': is_open,
      'max_num_participants': max_num_participants,
      'datetime_event': datetime_event,
      'datetime_creation': datetime_creation,
      'organizer_id': organizer_id,
      'rate': rate,
      'address': address,
      'interests': interests,
      'participants': participants,
    };
  }

  factory event.fromMap(Map<String, dynamic> map) {
    return event(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      is_open: map['is_open'] as bool,
      max_num_participants: map['max_num_participants'] as int,
      datetime_event: map['datetime_event'] as String,
      datetime_creation: map['datetime_creation'] as String?,
      organizer_id: map['organizer_id'] as int,
      rate: map['rate'] as double,
      address: map['address'] as String,
      interests: List<dynamic>.from((map['interests'] as List<dynamic>)),
      participants: List<dynamic>.from((map['participants'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory event.fromJson(String source) =>
      event.fromMap(json.decode(source) as Map<String, dynamic>);
}

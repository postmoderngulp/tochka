import 'dart:convert';

import 'package:flutter/foundation.dart';

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

  @override
  bool operator ==(covariant event other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.is_open == is_open &&
        other.max_num_participants == max_num_participants &&
        other.datetime_event == datetime_event &&
        other.datetime_creation == datetime_creation &&
        other.organizer_id == organizer_id &&
        other.rate == rate &&
        other.address == address &&
        listEquals(other.interests, interests) &&
        listEquals(other.participants, participants);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        is_open.hashCode ^
        max_num_participants.hashCode ^
        datetime_event.hashCode ^
        datetime_creation.hashCode ^
        organizer_id.hashCode ^
        rate.hashCode ^
        address.hashCode ^
        interests.hashCode ^
        participants.hashCode;
  }

  event copyWith({
    int? id,
    String? title,
    String? description,
    bool? is_open,
    int? max_num_participants,
    String? datetime_event,
    String? datetime_creation,
    int? organizer_id,
    double? rate,
    String? address,
    List<dynamic>? interests,
    List<dynamic>? participants,
  }) {
    return event(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      is_open: is_open ?? this.is_open,
      max_num_participants: max_num_participants ?? this.max_num_participants,
      datetime_event: datetime_event ?? this.datetime_event,
      datetime_creation: datetime_creation ?? this.datetime_creation,
      organizer_id: organizer_id ?? this.organizer_id,
      rate: rate ?? this.rate,
      address: address ?? this.address,
      interests: interests ?? this.interests,
      participants: participants ?? this.participants,
    );
  }
}

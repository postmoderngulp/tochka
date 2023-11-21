import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class user {
  int id;
  String username;
  user({
    required this.id,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
    };
  }

  factory user.fromMap(Map<String, dynamic> map) {
    return user(
      id: map['id'] as int,
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory user.fromJson(String source) =>
      user.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class interest {
  int id;
  String name;
  int? created_by;
  interest({
    required this.id,
    required this.name,
    required this.created_by,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'created_by': created_by,
    };
  }

  factory interest.fromMap(Map<String, dynamic> map) {
    return interest(
      id: map['id'] as int,
      name: map['name'] as String,
      created_by: map['created_by'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory interest.fromJson(String source) =>
      interest.fromMap(json.decode(source) as Map<String, dynamic>);
}

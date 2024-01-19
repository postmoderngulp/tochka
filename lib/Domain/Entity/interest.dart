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

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ created_by.hashCode;

  @override
  bool operator ==(covariant interest other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.created_by == created_by;
  }

  interest copyWith({
    int? id,
    String? name,
    int? created_by,
  }) {
    return interest(
      id: id ?? this.id,
      name: name ?? this.name,
      created_by: created_by ?? this.created_by,
    );
  }
}

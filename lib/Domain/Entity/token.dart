import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class token {
  String refresh;
  String access;
  token({
    required this.refresh,
    required this.access,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'refresh': refresh,
      'access': access,
    };
  }

  factory token.fromMap(Map<String, dynamic> map) {
    return token(
      refresh: map['refresh'] as String,
      access: map['access'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory token.fromJson(String source) =>
      token.fromMap(json.decode(source) as Map<String, dynamic>);
}

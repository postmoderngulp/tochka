// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

class profile {
  int? id;
  int? user_id;
  String first_name;
  String last_name;
  String email;
  String about;
  String birthday;
  String avatar_path;
  double rate;
  String sex;
  bool is_organizer;
  profile({
    required this.id,
    required this.user_id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.about,
    required this.birthday,
    required this.avatar_path,
    required this.rate,
    required this.sex,
    required this.is_organizer,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'about': about,
      'birthday': birthday,
      'avatar_path': avatar_path,
      'rate': rate,
      'sex': sex,
      'is_organizer': is_organizer,
    };
  }

  factory profile.fromMap(Map<String, dynamic> map) {
    return profile(
      id: map['id'] as int?,
      user_id: map['user_id'] as int?,
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      email: map['email'] as String,
      about: map['about'] as String,
      birthday: map['birthday'] as String,
      avatar_path: map['avatar_path'] as String,
      rate: map['rate'] as double,
      sex: map['sex'] as String,
      is_organizer: map['is_organizer'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory profile.fromJson(String source) =>
      profile.fromMap(json.decode(source) as Map<String, dynamic>);
}

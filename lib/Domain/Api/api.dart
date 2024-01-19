import 'dart:convert';
import 'package:Tochka_Sbora/Domain/Entity/event.dart';
import 'package:Tochka_Sbora/Domain/Entity/interest.dart';
import 'package:Tochka_Sbora/Domain/Entity/profile.dart';
import 'package:Tochka_Sbora/Domain/Entity/token.dart';
import 'package:Tochka_Sbora/Domain/Entity/user.dart';
import 'package:http/http.dart' as http;

class Api {
  String host = "http://xn----7sbpbfclakh1al9a7fxc.xn--p1ai:8000";
  void getAllUsers() async {
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/v1/users/');
    final response = await http.get(endPoint, headers: headers);
    print(response.statusCode);
    print(response.body);
  }

  void getConcretUser(int id) async {
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/v1/users/$id/');
    final response = await http.get(endPoint, headers: headers);
    print(response.statusCode);
    print(response.body);
  }

  void putConcretUser(String username, String password, int id) async {
    final headers = {'Content-Type': 'application/json'};
    final body = {"username": username, "password": password};
    var endPoint = Uri.parse('$host/api/v1/users/$id/');
    final response =
        await http.put(endPoint, headers: headers, body: json.encode(body));
    print(response.statusCode);
    print(response.body);
  }

  void patchConcretUser(String username, int id) async {
    final headers = {'Content-Type': 'application/json'};
    final body = {
      "username": username,
    };
    var endPoint = Uri.parse('$host/api/v1/users/$id/');
    final response =
        await http.patch(endPoint, headers: headers, body: json.encode(body));
    print(response.statusCode);
    print(response.body);
  }

  Future<int> createUser(String username, String password) async {
    final headers = {'Content-Type': 'application/json'};
    final body = {"username": username, "password": password};
    var endPoint = Uri.parse('$host/api/v1/users/');
    final response =
        await http.post(endPoint, headers: headers, body: json.encode(body));
    print(response.statusCode);
    print(response.body);
    final User = user.fromJson(response.body);
    return User.id;
  }

  Future<token> getToken(String username, String password) async {
    final headers = {'Content-Type': 'application/json'};
    final body = {"username": username, "password": password};
    var endPoint = Uri.parse('$host/api/token/');
    final response =
        await http.post(endPoint, headers: headers, body: json.encode(body));
    print(response.statusCode);
    print(response.body);
    return token.fromJson(response.body);
  }

  Future<List<profile>> getAllProfile() async {
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/v1/users_profile/');
    final response = await http.get(
      endPoint,
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
    final list = json.decode(response.body);
    List<profile> listProfile = [];
    list.forEach((element) {
      listProfile.add(profile.fromMap(element));
    });
    return listProfile;
  }

  Future<profile> getConcretProfile(int id) async {
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/v1/users_profile/$id/');
    final response = await http.get(endPoint, headers: headers);
    print(response.statusCode);
    print(response.body);
    return profile.fromJson(response.body);
  }

  void putAvatarProfile(String path, int id, String token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
    final body = {
      "user_id": id,
      "avatar_path": path,
    };
    var endPoint = Uri.parse('$host/api/v1/users_profile/$id/');
    final response =
        await http.put(endPoint, headers: headers, body: json.encode(body));
    print(response.statusCode);
    print(response.body);
  }

  void patchConcretProfile(List<int> interest, int id, String token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
    final body = {"interests": interest};
    var endPoint = Uri.parse('$host/api/v1/users_profile/$id/');
    final response =
        await http.patch(endPoint, headers: headers, body: json.encode(body));
    print(response.statusCode);
    print(response.body);
  }

  void deleteConcretProfile(int id) async {
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/v1/users_profile/$id/');
    final response = await http.delete(
      endPoint,
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
  }

  Future<profile> createProfile(String firstName, String lastName, String email,
      String about, String dob, String sex, List<int> interests, int id) async {
    final headers = {'Content-Type': 'application/json'};
    final body = {
      "user_id": id,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "about": about,
      "birthday": dob,
      "interests": interests,
      "avatar_path": "https://avatars.githubusercontent.com/u/111433564?v=4",
      "sex": sex
    };
    var endPoint = Uri.parse('$host/api/v1/users_profile/');
    final response =
        await http.post(endPoint, headers: headers, body: json.encode(body));
    print(response.statusCode);
    print(response.body);
    final Profile = profile.fromJson(response.body);
    return Profile;
  }

  void createAdminProfile(String firstName, String lastName, String email,
      String about, String dob, String sex, int id) async {
    final headers = {'Content-Type': 'application/json'};
    final body = {
      "user_id": id,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "about": about,
      "birthday": dob,
      "avatar_path": "https://avatars.githubusercontent.com/u/111433564?v=4",
      "sex": sex
    };
    var endPoint = Uri.parse('$host/api/v1/admin/');
    final response =
        await http.post(endPoint, headers: headers, body: json.encode(body));
    print(response.statusCode);
    print(response.body);
  }

  Future<List<interest>> getAllInterests() async {
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/v1/interests/');
    final response = await http.get(
      endPoint,
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
    final list = json.decode(response.body);
    List<interest> listInterest = [];
    list.forEach((element) {
      listInterest.add(interest.fromMap(element));
    });
    return listInterest;
  }

  void getConcretInterest(int id) async {
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/v1/interests/$id/');
    final response = await http.get(
      endPoint,
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
  }

  Future<List<event>> getAllEvent() async {
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/v1/events/');
    final response = await http.get(
      endPoint,
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
    final list = json.decode(response.body);
    List<event> listEvent = [];
    list.forEach((element) {
      listEvent.add(event.fromMap(element));
    });
    return listEvent;
  }

  Future<List<event>> getMyEvent(String token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
    var endPoint = Uri.parse('$host/api/v1/events/my/');
    final response = await http.get(
      endPoint,
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
    final list = json.decode(response.body);
    List<event> listEvent = [];
    list.forEach((element) {
      listEvent.add(event.fromMap(element));
    });
    return listEvent;
  }

  void getConcretEvent(int id) async {
    final headers = {'Content-Type': 'application/json'};
    var endPoint = Uri.parse('$host/api/v1/events/$id/');
    final response = await http.get(
      endPoint,
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
  }

  void putConcretEvent(String title, String description, String dateTime,
      String address, List<int> interests, int id, String token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
    final body = {
      {
        "title": title,
        "description": description,
        "datetime_event": dateTime,
        "address": address,
        "interests": interests
      }
    };
    var endPoint = Uri.parse('$host/api/v1/events/$id/');
    final response =
        await http.put(endPoint, headers: headers, body: json.encode(body));
    print(response.statusCode);
    print(response.body);
  }

  void patchConcretEvent(String title, int id, String token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
    final body = {"title": title};
    var endPoint = Uri.parse('$host/api/v1/events/$id/');
    final response =
        await http.patch(endPoint, headers: headers, body: json.encode(body));
    print(response.statusCode);
    print(response.body);
  }

  void deleteConcretEvent(int id, String token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
    var endPoint = Uri.parse('$host/api/v1/events/$id/');
    final response = await http.delete(
      endPoint,
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
  }

  void createEvent(String title, String description, String dateTime,
      String address, List<int> interests, String token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    final body = {
      "title": title,
      "description": description,
      "datetime_event": dateTime,
      "address": address,
      "interests": interests
    };
    var endPoint = Uri.parse('$host/api/v1/events/');
    final response =
        await http.post(endPoint, headers: headers, body: json.encode(body));
    print(response.statusCode);
    print(response.body);
  }

  void SubscribeEvent(int id, String token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
    var endPoint = Uri.parse('$host/api/v1/events/$id/subscribe/');
    final response = await http.post(
      endPoint,
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
  }

  void unSubscribeEvent(int id, String token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
    var endPoint = Uri.parse('$host/api/v1/events/$id/unsubscribe/');
    final response = await http.post(
      endPoint,
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
  }
}

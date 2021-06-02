import 'dart:convert';

import 'package:algorithms_task/account.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> login(String email, String password) async {
  final response = await http.post(
    Uri.parse('https://royalazad.herokuapp.com/api/auth/signin'),
    headers: <String, String>{"Accept": "application/json"},
    body: <String, String>{"email": email, "password": password},
  );

  if (response.statusCode == 200) {
    var _recievedData = jsonDecode(response.body);
    var _data = _recievedData['data'];
    print(_data);
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    prefs.setBool('logged_in', true);
    prefs.setString('name', _data['name']);
    prefs.setString('email', _data['email']);
    prefs.setString('phone', _data['phone']);
    prefs.setString('access_token', _data['access_token']);
    prefs.setString('expires_at', _data['expires_at']);
    prefs.setString('address', _data['address']);
  } else {
    throw Exception('Failed to login');
  }
}

Future<void> register(Account account) async {
  final response = await http.post(
    Uri.parse('https://royalazad.herokuapp.com/api/auth/signup'),
    headers: <String, String>{"Accept": "application/json"},
    body: account.toJson(),
  );

  print(response.body);

  if (response.statusCode == 200) {
    var _recievedData = jsonDecode(response.body);
    var _data = _recievedData['data'];
    print(_data);
    var _userData = _data['user'];
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('logged_in', true);
    prefs.setString('name', _userData['name']);
    prefs.setString('email', _userData['email']);
    prefs.setString('phone', _userData['phone']);
    prefs.setString('access_token', _userData['access_token']);
    prefs.setString('expires_at', _userData['expires_at']);
    prefs.setString('address', _userData['address']);
  } else {
    print(response.body);
    throw Exception('Failed to register');
  }
}

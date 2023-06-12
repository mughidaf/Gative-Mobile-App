import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  late String nama;
  late int id;
  late String username;
  late String email;

  Future<void> setData(
      int id, String name, String username, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userID', id);
    prefs.setString('name', name);
    prefs.setString('username', username);
    prefs.setString('email', email);
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nama = prefs.getString('name').toString();
    username = prefs.getString('username').toString();
    email = prefs.getString('email').toString();
    id = int.parse(prefs.getInt('userID').toString());
  }
}

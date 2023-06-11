import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  late String nama;

  Future<void> setData(
      int id, String name, String username, String profile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userID', id);
    prefs.setString('name', name);
    prefs.setString('username', username);
    prefs.setString('profile', profile);
  }

  Future<void> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nama = prefs.getString('name').toString();
  }
}

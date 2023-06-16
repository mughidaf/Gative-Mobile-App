import 'package:flutter/material.dart';
import 'package:gative_mobile_ver/Models/LoggedinUser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = LoggedinUser.username;
  String email = LoggedinUser.email;

  Future<void> updateUser(String username, String email) async {
    try {
      var url = Uri.parse(
          'http://192.168.61.198:8000/api/editProfile/${LoggedinUser.id}');
      final respon =
          await http.post(url, body: {'username': username, 'email': email});
      if (respon.statusCode == 200) {
        // Berhasil mengedit data username
        print('Username updated');
      } else {
        // Gagal mengedit data username
        print('Failed to update username');
      }
    } catch (error) {
      // Penanganan kesalahan saat mengirim permintaan ke API
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController =
        TextEditingController(text: username);
    TextEditingController emailController = TextEditingController(text: email);

    return Scaffold(
      backgroundColor: Color(0xFF333333),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1A1A),
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'http://192.168.61.198:8000/api/avatar/${LoggedinUser.id}')),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     // Logika untuk mengedit foto
            //     // Tambahkan kode di sini
            //     print('Edit Photo');
            //   },
            //   child: Text('Edit Photo'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Color(0xFFFFAC42),
            //   ),
            // ),
            SizedBox(height: 20),
            Container(
              width: 350,
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: username,
                  labelStyle: TextStyle(
                      color:
                          Color(0xFFFFFDFD)), // Set label text color to white
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFFFFDFD)), // Set border color to white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(
                            0xFFFFFDFD)), // Set focused border color to white
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              child: TextField(
                controller: emailController,
                style: TextStyle(color: Color(0xFFFFFDFD)),
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: email,
                  labelStyle: TextStyle(
                      color:
                          Color(0xFFFFFDFD)), // Set label text color to white
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFFFFDFD)), // Set border color to white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(
                            0xFFFFFDFD)), // Set focused border color to white
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 275,
              child: ElevatedButton(
                onPressed: () {
                  // Logika untuk menyimpan data
                  // Tambahkan kode di sini
                  setState(() {
                    username = usernameController.text;
                    email = emailController.text;
                    LoggedinUser.username = username;
                    LoggedinUser.email = email;
                    updateUser(username, email);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFAC42),
                ),
                child: Text('Save'),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gative_mobile_ver/Models/LoggedinUser.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
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
                    'http://192.168.0.11:8000/api/avatar/${LoggedinUser.id}')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika untuk mengedit foto
                // Tambahkan kode di sini
                print('Edit Photo');
              },
              child: Text('Edit Photo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFAC42),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
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
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              child: TextField(
                style: TextStyle(color: Color(0xFFFFFDFD)),
                decoration: InputDecoration(
                  labelText: 'Email',
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
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 275,
              child: ElevatedButton(
                onPressed: () {
                  // Logika untuk menyimpan data
                  // Tambahkan kode di sini
                  print('Username: $username');
                  print('Email: $email');
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gative_mobile_ver/Home/Component/CarouselDetailItem.dart';
import 'package:gative_mobile_ver/Home/pages/DetailItemPage.dart';
import 'package:gative_mobile_ver/Home/pages/WishlistPage.dart';
import 'package:gative_mobile_ver/Home/pages/cartpage.dart';
import 'package:gative_mobile_ver/Home/Component/drawer.dart';
import 'package:gative_mobile_ver/Models/UserController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nama = 'Loading...';
  String email = 'Loading...';
  String username = 'Loading...';
  int userid = 1;
  void tampilNama() async {
    UserController UC = UserController();
    await UC.getData();
    setState(() {
      nama = UC.nama;
      email = UC.email;
      username = UC.username;
      userid = UC.id;
    });
  }

  @override
  void initState() {
    super.initState();
    tampilNama();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF1A1A1A),
        appBar: AppBar(
          backgroundColor: Color(0xFF1A1A1A),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'http://192.168.0.11:8000/api/avatar/$userid'), //buat foto profil
            ),
            SizedBox(width: 10),
          ],
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              // ignore: prefer_interpolation_to_compose_strings
              ('Hello, ' + nama),
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(nama),
                accountEmail: Text(email),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'http://192.168.0.11:8000/api/avatar/$userid'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/slide/bacl.png')),
                ),
              ),
              ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text("Shopping Cart"),
                onTap: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite_rounded),
                title: Text("WishList"),
                onTap: () {
                  Navigator.pushNamed(context, '/wishlist');
                },
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text("Settings"),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () async {
                  // Menghapus data dari SharedPreferences
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.clear();
                  // Mengarahkan pengguna kembali ke halaman login
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200.0,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    viewportFraction: 0.9,
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                  ),
                  items: [
                    //gambar banner
                    "assets/slide/banner1.jpg",
                    "assets/slide/banner1.jpg",
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: Image.asset(i, fit: BoxFit.contain),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'New Deals',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 330,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      height: 200,
                      width: 150,
                      color: Color(0xFF333333),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 200,
                              width: 150,
                              child: Image.asset("assets/slide/ryujin2.jpg",
                                  fit: BoxFit.cover)), //gambar produk
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text("my gf",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: Text("Headset",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: Text("Rp 69696969",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                          Center(
                            child: Container(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text("Add To Cart",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white)),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  backgroundColor: Color(0xFFFFFAC42),
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      height: 200,
                      width: 150,
                      color: Color(0xFF333333),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 200,
                              width: 150,
                              child: Image.asset("assets/slide/haerin1.jpg",
                                  fit: BoxFit.cover)),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text("my gf",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: Text("Headset",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: Text("Rp 69696969",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                          Center(
                            child: Container(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text("Add To Cart",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white)),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  backgroundColor: Color(0xFFFFFAC42),
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      height: 250,
                      width: 150,
                      color: Color(0xFF333333),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 200,
                              width: 150,
                              child: Image.asset("assets/slide/yeji1.jpg",
                                  fit: BoxFit.cover)),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text("my gf",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: Text("Headset",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              child: Text("Rp 69696969",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'New Deals',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 330,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      height: 200,
                      width: 150,
                      color: Color(0xFF333333),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 200,
                              width: 150,
                              child: Image.asset("assets/slide/ryujin1.jpg",
                                  fit: BoxFit.cover)), //gambar produk
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text("my gf",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: Text("Headset",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: Text("Rp 69696969",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                          Center(
                            child: Container(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text("Add To Cart",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white)),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  backgroundColor: Color(0xFFFFFAC42),
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      height: 200,
                      width: 150,
                      color: Color(0xFF333333),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 200,
                              width: 150,
                              child: Image.asset("assets/slide/yeji1.jpg",
                                  fit: BoxFit.cover)), //gambar produk
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text("my gf",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: Text("Headset",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: Text("Rp 69696969",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                          Center(
                            child: Container(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text("Add To Cart",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white)),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  backgroundColor: Color(0xFFFFFAC42),
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      height: 200,
                      width: 150,
                      color: Color(0xFF333333),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 200,
                              width: 150,
                              child: Image.asset("assets/slide/aa.jpg",
                                  fit: BoxFit.cover)), //gambar produk
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text("my gf",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: Text("Headset",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: Text("Rp 69696969",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                          Center(
                            child: Container(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text("Add To Cart",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white)),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  backgroundColor: Color(0xFFFFFAC42),
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

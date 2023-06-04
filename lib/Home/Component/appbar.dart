import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              backgroundImage: AssetImage('assets/do.webp'), //buat foto profil
            ),
            SizedBox(width: 10),
          ],
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'hello user',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text('Sidebar'),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                title: Text('Category'),
                onTap: () {
                  // Handle item 
                },
              ),
              ListTile(
                title: Text('Shopping Cart'),
                onTap: () {
                  // Handle item 
                },
              ),
              ListTile(
                title: Text('Wishlist'),
                onTap: () {
                  // Handle item 
                },
              ),
              ListTile(
                title: Text('Forum'),
                onTap: () {
                  // Handle item 
                },
              ),
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
                  items: [ //gambar banner
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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
                          Container(height: 200, width: 150, child: Image.asset("assets/slide/ryujin2.jpg", fit: BoxFit.cover)), //gambar produk
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),child: Text("my gf",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.white))),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),child: Text("Headset",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color: Colors.white))),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),child: Text("Rp 69696969",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.white))),
                          Container(
                            width: 170,
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.plus,
                                size: 24.0,
                              ),
                              label: const Text("Wishlist"),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  width: 1.0,
                                  color: Color(0xFFFF1F57),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.all(15),
                                foregroundColor: Color(0xFFFF1F57),
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
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
                          Container(height: 200, width: 150, child: Image.asset("assets/slide/haerin1.jpg", fit: BoxFit.cover)),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),child: Text("my gf",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.white))),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),child: Text("Headset",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color: Colors.white))),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),child: Text("Rp 69696969",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.white))),
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
                          Container(height: 200, width: 150, child: Image.asset("assets/slide/yeji1.jpg", fit: BoxFit.cover)),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),child: Text("my gf",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.white))),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),child: Text("Headset",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color: Colors.white))),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),child: Text("Rp 69696969",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.white))),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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
                          Container(height: 200, width: 150, child: Image.asset("assets/slide/yeji1.jpg", fit: BoxFit.cover)),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),child: Text("my gf",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.white))),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),child: Text("Headset",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color: Colors.white))),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),child: Text("Rp 69696969",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.white))),
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
                          Container(height: 200, width: 150, child: Image.asset("assets/slide/ryujin1.jpg", fit: BoxFit.cover)),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),child: Text("my gf",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.white))),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),child: Text("Headset",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color: Colors.white))),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),child: Text("Rp 69696969",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.white))),
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
                          Container(height: 200, width: 150, child: Image.asset("assets/slide/pp.jpg", fit: BoxFit.cover)),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),child: Text("my gf",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.white))),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),child: Text("Headset",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color: Colors.white))),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),child: Text("Rp 69696969",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.white))),
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
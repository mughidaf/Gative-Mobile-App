import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
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
              backgroundImage: AssetImage('assets/do.webp'),
            ),
            SizedBox(width: 10),
          ],
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'hello user',
              style: TextStyle(fontSize: 16),
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
                  // Handle item 1 press
                },
              ),
              ListTile(
                title: Text('Shopping Cart'),
                onTap: () {
                  // Handle item 2 press
                },
              ),
              ListTile(
                title: Text('Wishlist'),
                onTap: () {
                  // Handle item 3 press
                },
              ),
              ListTile(
                title: Text('Forum'),
                onTap: () {
                  // Handle item 4 press
                },
              ),
            ],
          ),
        ),
        body: Container(
          height: 200.0,
          child: CarouselSlider(
            options: CarouselOptions(height: 200.0, viewportFraction: 0.9, aspectRatio: 16/9, autoPlay: true),
            items: [
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
                        child: Image.asset(i, fit: BoxFit.contain,)),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gative_mobile_ver/Home/pages/WishlistPage.dart';
import 'package:gative_mobile_ver/Home/pages/cartpage.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Color(0xFF1A1A1A),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30,),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage("assets/slide/ryujin2.jpg"), fit: BoxFit.fill),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,),
                    child: Text("Pari", style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Text("Ur gae", style: TextStyle(fontSize: 16, color: Colors.white),),
                  )
                ],
              ),
            ),
          ),     
          ListTile(
            leading: Icon(Icons.shopping_bag, color: Color(0xFFFFAC42),),
            title: Text("Shopping Cart"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_rounded, color: Color(0xFFFFAC42),),
            title: Text("WishList"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WishlistPage()),
              );
            },
          ),
          Divider(thickness: 1,),
          ListTile(
            leading: Icon(Icons.settings_accessibility, color: Color(0xFFFFAC42),),
            title: Text("Settings"),
          ),
          ListTile(
            leading: Icon(Icons.logout_sharp, color: Color(0xFFFFAC42),),
            title: Text("Logout"),
          )
        ],
      ),
    );


  }
}
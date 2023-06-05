import 'package:flutter/material.dart';
import 'package:gative_mobile_ver/Home/pages/WishlistPage.dart';
import 'package:gative_mobile_ver/Home/pages/cartpage.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Pari gf'),
            accountEmail: Text('pari@gmail.com'),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/slide/ryujin1.jpg"),fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      'assets/slide/bacl.png')
                      ),
            ),
          ),
          
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text("Shopping Cart"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_rounded),
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
            leading: Icon(Icons.account_box),
            title: Text("Settings"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
          )
        ],
      ),
    );


  }
}
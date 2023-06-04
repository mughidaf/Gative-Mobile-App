import 'package:flutter/material.dart';

import '../Component/CartBottomNavbar.dart';
import '../Component/CartItem.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Color(0xFF333333),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Color(0xFFFFFDFD),
          ),
        ),
      ),
      body: ListView(
        children: [
          // const CartAppBar(),
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFF1A1A1A),
            ),
            child: Column(
              children: [
                CartItem(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CartBottomNavbar(),
    );
  }
}

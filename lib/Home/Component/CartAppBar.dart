import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF333333),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Color(0xFFFFFDFD),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Cart",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFDFD),
                ),
              )),
        ],
      ),
    );
  }
}

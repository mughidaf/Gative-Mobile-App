import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailItemBottomNavbar extends StatelessWidget {
  const DetailItemBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 130,
        decoration: BoxDecoration(
          color: Color(0xFF333333),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Harga : ",
                  style: TextStyle(
                    color: Color(0xFFFFFDFD),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Rp150.000,00 ",
                  style: TextStyle(
                    color: Color(0xFFFF1F57),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 170,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFAC42),
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(15),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gative_mobile_ver/Home/pages/WishlistPage.dart';
import 'package:gative_mobile_ver/Home/pages/cartpage.dart';
import 'package:gative_mobile_ver/Models/LoggedinUser.dart';
import 'package:gative_mobile_ver/Models/SelectedItem.dart';
import 'package:http/http.dart' as http;

class DetailItemBottomNavbar extends StatefulWidget {
  const DetailItemBottomNavbar({super.key});

  @override
  State<DetailItemBottomNavbar> createState() => _DetailItemBottomNavbarState();
}

class _DetailItemBottomNavbarState extends State<DetailItemBottomNavbar> {
  Future<bool> addCart(int id, int userid) async {
    var url =
        Uri.parse('http://192.168.0.104:8000/api/addCart/${id}/${userid}');
    var response = await http.post(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addWishlist(int id, int userid) async {
    var url =
        Uri.parse('http://192.168.0.104:8000/api/addWishlist/${id}/${userid}');
    await http.post(url);
  }

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
                  "Rp${SelectedItem.harga.toInt()},00 ",
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
                    onPressed: () async {
                      var respon =
                          await addCart(SelectedItem.id, LoggedinUser.id);
                      if (respon == true) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartPage()),
                        );
                      }
                    },
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
                    onPressed: () async {
                      await addWishlist(SelectedItem.id, LoggedinUser.id);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WishlistPage()),
                      );
                    },
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

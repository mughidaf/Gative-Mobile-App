import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i < 4; i++)
          Container(
            height: 110,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF333333),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.only(right: 15),
                  child: Image.asset("assets/slide/yeji1.jpg"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Spongebob",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFDFD),
                        ),
                      ),
                      Text(
                        "Rp50.000,00",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFFFFDFD),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint('Coba');
                        },
                        child: Row(
                          children: const [
                            Text(
                              'Pindahkan ke wishlist',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFFFFAC42),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 19,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  // padding: EdgeInsets.only(
                  //   left: 80,
                  // ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.delete_outline,
                          color: Color(0xFFFF1F57),
                        ),
                        onTap: () {},
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              CupertinoIcons.minus,
                              size: 14,
                              color: Color(0xFFFFFDFD),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFFFFFDFD),
                              ),
                            ),
                          ),
                          Container(
                            child: Icon(
                              CupertinoIcons.plus,
                              size: 14,
                              color: Color(0xFFFFFDFD),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

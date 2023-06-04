import 'package:flutter/material.dart';

import '../Component/CarouselDetailItem.dart';
import '../Component/DetailItem.dart';
import '../Component/DetailItemBottomNavbar.dart';

class DetailItemPage extends StatelessWidget {
  const DetailItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                CarouselDetailItem(),
                DetailItem(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: DetailItemBottomNavbar(),
    );
  }
}

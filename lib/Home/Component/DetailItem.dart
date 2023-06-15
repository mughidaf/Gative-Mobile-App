import 'package:flutter/material.dart';
import 'package:gative_mobile_ver/Models/SelectedItem.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 10,
              ),
              child: Row(
                children: [
                  Text(
                    SelectedItem.nama,
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFFFFFDFD),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFF333333),
              height: 20,
              thickness: 0.5,
            ),
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.grid_view,
                    color: Color(0xFFFFFDFD),
                  ),
                  Text(
                    'Category : ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFFFDFD),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(SelectedItem.kategori),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF333333),
                      padding: EdgeInsets.all(5),
                      textStyle: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFF333333),
              height: 20,
              thickness: 0.5,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Deskripsi Produk',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFFFFDFD),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      textAlign: TextAlign.justify,
                      '${SelectedItem.deskripsi}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFFFFDFD),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

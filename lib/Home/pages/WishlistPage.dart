import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gative_mobile_ver/Models/Item.dart';
import 'package:gative_mobile_ver/Models/LoggedinUser.dart';
import 'package:http/http.dart' as http;
import '../Component/WishlistItem.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<Item> items = [];
  List<String> kategori = ['', 'Video Games', 'Gaming gear', 'Others'];
  List<int> cartId = [];

  Future<List<Item>> fetchItems(int id) async {
    final response = await http
        .get(Uri.parse('http://192.168.0.104:8000/api/wishlistPage/${id}'));

    if (response.statusCode == 200) {
      // Jika respons API sukses (status code 200), proses data yang diterima
      final jsonData = jsonDecode(response.body);
      final itemsData = jsonData['wishes'];
      List<Item> fetchedItems = [];

      for (var itemData in itemsData) {
        Item item = Item(
          id: itemData['item']['id'],
          categoryId: itemData['item']['Category_id'],
          name: itemData['item']['name'],
          description: itemData['item']['description'],
          price: double.parse(itemData['item']['price']),
          image: itemData['item']['image'],
        );
        cartId.add(itemData['id']);
        fetchedItems.add(item);
      }
      print('Berhasil fetching');
      return fetchedItems;
    } else {
      // Jika respons API gagal, lempar exception atau lakukan penanganan error sesuai kebutuhan
      throw Exception('Failed to fetch data from API');
    }
  }

  Future<void> loadItems(int id) async {
    try {
      List<Item> fetchedItems = await fetchItems(id);
      setState(() {
        items = fetchedItems;
      });
      print('berhasil item');
    } catch (e) {
      // Penanganan error ketika gagal memuat data
      print('Error : $e');
    }
  }

  void deleteWishItem(int id) async {
    String apiUrl = 'http://192.168.0.104:8000/api/deleteWish/$id';

    var response = await http.delete(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Berhasil menghapus item dari Cart
      print('Item berhasil dihapus');
    } else {
      // Gagal menghapus item dari Cart
      print('Gagal menghapus item');
    }
  }

  @override
  void initState() {
    super.initState();
    loadItems(LoggedinUser.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
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
                Column(
                  children: [
                    Container(
                      height: 500,
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          Item itemT = items[index];
                          return Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                margin: EdgeInsets.only(right: 15),
                                child: Image.network(
                                    "http://192.168.0.104:8000/api/gambarBarang/${items[index].id}"),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      itemT
                                          .name, // Mengambil nama item dari objek Item
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFFDFD),
                                      ),
                                    ),
                                    Text(
                                      "Rp${itemT.price.toStringAsFixed(2)}", // Mengambil harga item dari objek Item
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFFFFFDFD),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      child: Icon(
                                        Icons.delete_outline,
                                        color: Color(0xFFFF1F57),
                                      ),
                                      onTap: () {
                                        deleteWishItem(cartId[index]);
                                        setState(() {
                                          bool isFound =
                                              false; // Variabel untuk melacak apakah item dengan ID yang sama sudah ditemukan
                                          items.removeWhere((item) {
                                            if (!isFound &&
                                                item.id == itemT.id) {
                                              isFound =
                                                  true; // Mengatur isFound menjadi true saat item ditemukan
                                              return true; // Menghapus item dengan ID yang sama
                                            } else {
                                              return false; // Tetap mempertahankan item lainnya
                                            }
                                          });
                                          cartId.removeAt(index);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

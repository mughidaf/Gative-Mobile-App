import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gative_mobile_ver/Home/pages/WishlistPage.dart';
import 'package:gative_mobile_ver/Models/LoggedinUser.dart';
import 'package:gative_mobile_ver/Models/UserController.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gative_mobile_ver/Models/Item.dart';
import '../Component/CartBottomNavbar.dart';
import '../Component/CartItem.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String nama = 'Loading...';
  String email = 'Loading...';
  String username = 'Loading...';
  int userid = 0;
  double totalPrice = 0;
  List<Item> items = [];
  List<String> kategori = ['', 'Video Games', 'Gaming gear', 'Others'];
  List<int> cartId = [];

  void tampilNama() async {
    UserController UC = UserController();
    await UC.getData();
    setState(() {
      nama = UC.nama;
      email = UC.email;
      username = UC.username;
      userid = UC.id;
    });
  }

  Future<List<Item>> fetchItems(int id) async {
    final response = await http
        .get(Uri.parse('http://192.168.61.198:8000/api/cartPage/${id}'));

    if (response.statusCode == 200) {
      // Jika respons API sukses (status code 200), proses data yang diterima
      final jsonData = jsonDecode(response.body);
      final itemsData = jsonData['carts'];
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
        for (var item in items) {
          totalPrice = totalPrice + item.price;
        }
      });
      print('berhasil item');
    } catch (e) {
      // Penanganan error ketika gagal memuat data
      print('Error : $e');
    }
  }

  void deleteCartItem(int id) async {
    String apiUrl = 'http://192.168.61.198:8000/api/deleteCart/$id';

    var response = await http.delete(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Berhasil menghapus item dari Cart
      print('Item berhasil dihapus');
    } else {
      // Gagal menghapus item dari Cart
      print('Gagal menghapus item');
    }
  }

  Future<void> addWishlist(int id, int userid) async {
    var url =
        Uri.parse('http://192.168.61.198:8000/api/addWishlist/${id}/${userid}');
    await http.post(url);
  }

  Future<void> deleteAllCarts(int userId) async {
    final url =
        Uri.parse('http://192.168.61.198:8000/api/deleteAllCart/$userId');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        // Penghapusan berhasil
        print('Semua data cart berhasil dihapus');
      } else {
        // Gagal menghapus data cart
        print('Gagal menghapus data cart');
      }
    } catch (e) {
      // Terjadi kesalahan pada permintaan HTTP
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    tampilNama();
    loadItems(LoggedinUser.id);
  }

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
                                    "http://192.168.61.198:8000/api/gambarBarang/${items[index].id}"),
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
                                    GestureDetector(
                                      onTap: () async {
                                        await addWishlist(
                                            items[index].id, userid);
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const WishlistPage()),
                                        );
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      child: Icon(
                                        Icons.delete_outline,
                                        color: Color(0xFFFF1F57),
                                      ),
                                      onTap: () {
                                        deleteCartItem(cartId[index]);
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
      bottomNavigationBar: BottomAppBar(
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
                    "Total : ",
                    style: TextStyle(
                      color: Color(0xFFFFFDFD),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Rp${totalPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Color(0xFFFF1F57),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFAC42),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFDFD),
                    ),
                  ),
                ),
                onTap: () async {
                  await deleteAllCarts(LoggedinUser.id);
                  setState(() {
                    totalPrice = 0;
                    items = [];
                    cartId = [];
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

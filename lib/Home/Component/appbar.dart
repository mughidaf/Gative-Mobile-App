import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gative_mobile_ver/Home/Component/CarouselDetailItem.dart';
import 'package:gative_mobile_ver/Home/pages/DetailItemPage.dart';
import 'package:gative_mobile_ver/Home/pages/WishlistPage.dart';
import 'package:gative_mobile_ver/Home/pages/cartpage.dart';
import 'package:gative_mobile_ver/Home/Component/drawer.dart';
import 'package:gative_mobile_ver/Models/Item.dart';
import 'package:gative_mobile_ver/Models/LoggedinUser.dart';
import 'package:gative_mobile_ver/Models/SelectedItem.dart';
import 'package:gative_mobile_ver/Models/UserController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gative_mobile_ver/Home/pages/cartpage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nama = 'Loading...';
  String email = 'Loading...';
  String username = 'Loading...';
  int userid = 0;
  List<Item> items = [];
  List<String> kategori = ['', 'Video Games', 'Gaming gear', 'Others'];

  void tampilNama() async {
    UserController UC = UserController();
    await UC.getData();
    setState(() {
      nama = UC.nama;
      email = UC.email;
      username = UC.username;
      userid = UC.id;
      LoggedinUser.id = userid;
      LoggedinUser.username = username;
      LoggedinUser.email = email;
    });
  }

  Future<List<Item>> fetchItems() async {
    final response =
        await http.get(Uri.parse('http://192.168.61.198:8000/api/items'));

    if (response.statusCode == 200) {
      // Jika respons API sukses (status code 200), proses data yang diterima
      final jsonData = jsonDecode(response.body);
      final itemsData = jsonData['items'];
      List<Item> fetchedItems = [];

      for (var itemData in itemsData) {
        Item item = Item(
          id: itemData['id'],
          categoryId: itemData['Category_id'],
          name: itemData['name'],
          description: itemData['description'],
          price: double.parse(itemData['price']),
          image: itemData['image'],
        );
        fetchedItems.add(item);
      }
      print('Berhasil fetching');
      return fetchedItems;
    } else {
      // Jika respons API gagal, lempar exception atau lakukan penanganan error sesuai kebutuhan
      throw Exception('Failed to fetch data from API');
    }
  }

  Future<void> loadItems() async {
    try {
      List<Item> fetchedItems = await fetchItems();
      setState(() {
        items = fetchedItems;
      });
      print('berhasil item');
    } catch (e) {
      // Penanganan error ketika gagal memuat data
      print('Error : $e');
    }
  }

  Future<bool> addCart(int id, int userid) async {
    var url =
        Uri.parse('http://192.168.61.198:8000/api/addCart/${id}/${userid}');
    var response = await http.post(url);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    tampilNama();
    loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF1A1A1A),
        appBar: AppBar(
          backgroundColor: Color(0xFF1A1A1A),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'http://192.168.61.198:8000/api/avatar/$userid'), //buat foto profil
            ),
            SizedBox(width: 10),
          ],
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              // ignore: prefer_interpolation_to_compose_strings
              ('Hello, ' + nama),
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(LoggedinUser.username),
                accountEmail: Text(LoggedinUser.email),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'http://192.168.61.198:8000/api/avatar/$userid'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/slide/bacl.png')),
                ),
              ),
              ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text("Shopping Cart"),
                onTap: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite_rounded),
                title: Text("WishList"),
                onTap: () {
                  Navigator.pushNamed(context, '/wishlist');
                },
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text("Settings"),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              ListTile(
                leading: Icon(Icons.chat_rounded),
                title: Text("Forum"),
                onTap: () {
                  Navigator.pushNamed(context, '/forum');
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () async {
                  // Menghapus data dari SharedPreferences
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.clear();
                  LoggedinUser.id = 0;
                  // Mengarahkan pengguna kembali ke halaman login
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200.0,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    viewportFraction: 0.9,
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                  ),
                  items: [
                    //gambar banner
                    "assets/slide/banner1.jpg",
                    "assets/slide/banner1.jpg",
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: Image.asset(i, fit: BoxFit.contain),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'New Deals',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 330,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      height: 200,
                      width: 150,
                      color: Color(0xFF333333),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              SelectedItem.id = items[index].id;
                              SelectedItem.nama = items[index].name;
                              SelectedItem.deskripsi = items[index].description;
                              SelectedItem.harga = items[index].price;
                              SelectedItem.kategori =
                                  kategori[items[index].categoryId];
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DetailItemPage()),
                              );
                            },
                            child: Container(
                              height: 200,
                              width: 150,
                              child: Image.network(
                                "http://192.168.61.198:8000/api/gambarBarang/${items[index].id}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              items[index].name,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: Text(
                              kategori[items[index].categoryId],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: Text(
                              "Rp ${items[index].price}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: OutlinedButton(
                                onPressed: () async {
                                  var respon =
                                      await addCart(items[index].id, userid);
                                  if (respon == true) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CartPage()),
                                    );
                                  }
                                },
                                child: Text(
                                  "Add To Cart",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  backgroundColor: Color(0xFFFFFAC42),
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

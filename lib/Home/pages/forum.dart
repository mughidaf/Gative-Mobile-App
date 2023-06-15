import 'package:flutter/material.dart';
import 'package:gative_mobile_ver/Home/pages/incomment.dart';
import 'package:gative_mobile_ver/Models/LoggedinUser.dart';

class forum extends StatefulWidget {
  const forum({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<forum> createState() => _forum();
}

class _forum extends State<forum> {
  String username = LoggedinUser.username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1A1A),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: Border(bottom: BorderSide(color: Color(0xff555555), width: 2)),
        elevation: 4,
        backgroundColor: Color(0xff1A1A1A),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              children: [
                Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(3.14),
                    child: Icon(Icons.segment)),
                const SizedBox(
                  width: 10,
                ),
                Text("Forum")
              ],
            ),
            Wrap(
              children: [
                Text(('Hello, $username')),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/a/ac/Camila_Cabello_Vogue_4.jpg"),
                  backgroundColor: Colors.transparent,
                  radius: 15,
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: GestureDetector(
                onTap: () {
                  // Add your gesture detector logic here
                  Navigator.pop(context);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Set the border radius of the Card
                ),
                color: Color(0xff333333),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/a/ac/Camila_Cabello_Vogue_4.jpg"),
                                backgroundColor: Colors.transparent,
                                radius: 25,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Anissa27",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors
                                      .white, // Specify your desired text color
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              // Add your gesture detector logic here
                              print('Gesture detected!');
                            },
                            child: PopupMenuButton(
                              icon: Icon(
                                size: 36,
                                Icons.more_horiz,
                                color: Color(0xffD9D9D9),
                              ),
                              onSelected: (value) {
                                // Handle menu item selection
                                print('Selected: $value');
                              },
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    value: 'edit',
                                    child: Text('edit'),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Text('delete'),
                                  ),
                                ];
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('Tapped 1');
                            },
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              // children: [
                              //   Icon(
                              //     Icons.favorite,
                              //     color: Color(0xffCD1818),
                              //     size: 35,
                              //   ),
                              //   SizedBox(
                              //     width: 5,
                              //   ),
                              //   Text(
                              //     "12",
                              //     style: TextStyle(color: Colors.white),
                              //   ),
                              // ],
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => incomment()),
                              );
                            },
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: const [
                                Icon(Icons.comment,
                                    color: Color(0xffD9D9D9), size: 30),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "2",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

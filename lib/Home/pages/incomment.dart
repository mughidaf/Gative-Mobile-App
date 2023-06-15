import 'package:flutter/material.dart';

class incomment extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<incomment> createState() => _incomment();
}

class _incomment extends State<incomment> {
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
              children: const [
                Text("Hello, User"),
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
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff333333),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://upload.wikimedia.org/wikipedia/commons/a/ac/Camila_Cabello_Vogue_4.jpg"),
                                    backgroundColor: Colors.transparent,
                                    radius: 25,
                                  ),
                                  SizedBox(
                                    width: 10,
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
                              PopupMenuButton(
                                icon: const Icon(
                                  size: 36,
                                  Icons.more_horiz,
                                  color: Color(0xffD9D9D9),
                                ),
                                onSelected: (value) {
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 15),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print('Tapped 1');
                                },
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: const [],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff686868),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: Wrap(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 40,
                                      child: VerticalDivider(
                                        color: Colors.black,
                                        thickness: 2.0,
                                      )),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://upload.wikimedia.org/wikipedia/commons/a/ac/Camila_Cabello_Vogue_4.jpg"),
                                    backgroundColor: Colors.transparent,
                                    radius: 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "anissa27",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight
                                                .bold, // Specify your desired text color
                                          ),
                                        ),
                                        Text(
                                          "@anissa27 comment testing!",
                                          style: TextStyle(
                                            color: Colors
                                                .white, // Specify your desired text color
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  PopupMenuButton(
                                    icon: const Icon(
                                      size: 36,
                                      Icons.more_vert,
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
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color(0xff555555),
                          thickness: 1.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: Wrap(
                            children: [
                              Row(
                                children: const [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://upload.wikimedia.org/wikipedia/commons/a/ac/Camila_Cabello_Vogue_4.jpg"),
                                    backgroundColor: Colors.transparent,
                                    radius: 15,
                                  ),
                                  Expanded(
                                    child: Card(
                                      color: Color(0xff333333),
                                      child: SizedBox(
                                        height: 35,
                                        child: TextField(
                                          style: TextStyle(
                                            color: Colors
                                                .white, // Specify your desired text color
                                          ),
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 8,
                                                    horizontal: 12),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            hintText: 'Enter Reply',
                                            hintStyle: TextStyle(
                                              color: Colors
                                                  .white, // Specify your desired hint text color
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
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

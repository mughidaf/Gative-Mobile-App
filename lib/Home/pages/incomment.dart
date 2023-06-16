import 'package:flutter/material.dart';
import 'package:gative_mobile_ver/Models/LoggedinUser.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class incomment extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final int post_id;
  const incomment({required this.post_id, Key? key}) : super(key: key);
  @override
  State<incomment> createState() => _incomment();
}

class _incomment extends State<incomment> {
  List<dynamic> replies = [];
  int forumuser = 0;
  String forumname = '';
  String forumquestion = '';

  @override
  void initState() {
    super.initState();
    fetchRepliesData();
    fetchForumData();
  }

  Future<void> fetchForumData() async {
    final response = await http.get(
        Uri.parse('http://192.168.0.104:8000/api/forum/${widget.post_id}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        forumuser = data['User_id'];
        forumname = data['user']['username'];
        forumquestion = data['question'];
      });
    } else {
      // Handle error case
      print('Failed to fetch forum data');
    }
  }

  Future<void> fetchRepliesData() async {
    final response = await http.get(Uri.parse(
        'http://192.168.0.104:8000/api/forum/reply/${widget.post_id}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        replies = data;
      });
    } else {
      // Handle error case
      print('Failed to fetch replies data');
    }
  }

  int userid = LoggedinUser.id;
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
                Text('Hello, ${LoggedinUser.username}'),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "http://192.168.0.104:8000/api/avatar/$userid"),
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
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'http://192.168.0.104:8000/api/avatar/$forumuser'),
                                    backgroundColor: Colors.transparent,
                                    radius: 25,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    forumname,
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
                                      value: 'delete',
                                      child: Text('delete'),
                                    ),
                                  ];
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              forumquestion,
                              style: TextStyle(color: Colors.white),
                            ),
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
                      children: replies.map((reply) {
                        return Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 40,
                                          child: VerticalDivider(
                                            color: Colors.black,
                                            thickness: 2.0,
                                          ),
                                        ),
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'http://192.168.0.104:8000/api/avatar/${reply['user_id']}'),
                                          backgroundColor: Colors.transparent,
                                          radius: 15,
                                        ),
                                        SizedBox(width: 5),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                reply['username'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                reply['answers'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        PopupMenuButton(
                                          icon: const Icon(
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
                            ],
                          ),
                        );
                      }).toList(),
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

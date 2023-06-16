import 'package:flutter/material.dart';
import 'package:gative_mobile_ver/Home/pages/incomment.dart';
import 'package:gative_mobile_ver/Models/LoggedinUser.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class forum extends StatefulWidget {
  const forum({Key? key}) : super(key: key);

  @override
  State<forum> createState() => _forum();
}

class _forum extends State<forum> {
  List<dynamic> forums = [];
  int userid = LoggedinUser.id;

  @override
  void initState() {
    super.initState();
    fetchForumData();
  }

  Future<void> fetchForumData() async {
    final response =
        await http.get(Uri.parse('http://192.168.0.104:8000/api/forum'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        forums = data;
      });
    } else {
      // Handle error case
      print('Failed to fetch forum data');
    }
  }

  Future<void> deleteForum(int id) async {
    final response = await http.delete(
      Uri.parse('http://192.168.0.104:8000/api/deleteForum/$id'),
    );
    if (response.statusCode == 200) {
      // Forum deleted successfully
      print('Forum deleted successfully');
      // Refresh the forum data
      await fetchForumData();
    } else {
      // Handle error case
      print('Failed to delete forum');
    }
  }

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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      Text(
                        "",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                Text("Forum"),
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
      body: ListView.builder(
        itemCount: forums.length,
        itemBuilder: (BuildContext context, int index) {
          final forum = forums[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
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
                                  "http://192.168.0.104:8000/api/avatar/${forum['User_id']}"),
                              backgroundColor: Colors.transparent,
                              radius: 25,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              forum['user']['username'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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
                              Icons.more_horiz,
                              color: Color(0xffD9D9D9),
                            ),
                            onSelected: (value) {
                              if (value == 'delete') {
                                final forumId = forum['id'];
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Delete Forum'),
                                      content: Text(
                                          'Are you sure you want to delete this forum?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            deleteForum(forumId);
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  value: 'delete',
                                  child: Text('Delete'),
                                ),
                              ];
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          forum['question'] ?? '',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    incomment(post_id: forum['id']),
                              ),
                            );
                          },
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(
                                Icons.comment,
                                color: Color(0xffD9D9D9),
                                size: 30,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Comment",
                                style: TextStyle(color: Colors.white),
                              ),
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
        },
      ),
    );
  }
}

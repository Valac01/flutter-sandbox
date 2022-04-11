import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:json_rest_api/views/post_detail.dart';

import '../models/post.dart';
import '../widgets/posts_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    posts = await getPost();
    if (posts!.isNotEmpty) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  Future<List<Post>?> getPost() async {
    var client = Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    Response response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
              itemCount: posts?.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PostDetail(post: posts![index])));
                  },
                  key: Key(posts![index].id.toString()),
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PostAvatar(title: posts![index].title),
                        PostTitle(title: posts![index].title),
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 231, 231, 231)),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  ),
                );
              })),
          replacement: Center(child: const CircularProgressIndicator()),
        ));
  }
}

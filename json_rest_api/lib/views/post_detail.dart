import 'package:flutter/material.dart';

import '../models/post.dart';
import '../widgets/posts_widgets.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 22.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              PostAvatar(title: post.title),
              PostTitle(title: post.title),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Expanded(
              child: Text(
            post.body!,
            style: TextStyle(fontSize: 18),
          ))
        ]),
      ),
    );
  }
}

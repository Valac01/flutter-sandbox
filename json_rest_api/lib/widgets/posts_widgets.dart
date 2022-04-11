import 'dart:math';

import 'package:flutter/material.dart';

class PostTitle extends StatelessWidget {
  const PostTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        title,
        style: TextStyle(fontSize: 18, color: Color(0xff13596B)),
      ),
    );
  }
}

class PostAvatar extends StatelessWidget {
  PostAvatar({Key? key, required this.title}) : super(key: key);
  final String title;
  double size = 80.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      margin: EdgeInsets.only(right: 12.0),
      child: Center(
        child: Text(
          title[0].toUpperCase(),
          style: TextStyle(
              fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
    );
  }
}

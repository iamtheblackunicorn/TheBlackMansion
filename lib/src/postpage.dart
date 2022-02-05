/*
The Black Mansion App by Alexander Abraham.
Licensed under the MIT license.
*/

import 'vars.dart';
import 'preview.dart';
import 'package:flutter/material.dart';

/// This is the "page" on which the post's content
/// is rendered.
class PostPage extends StatelessWidget{
  final String postTitle;
  final String postDate;
  final String postBannerUrl;
  final String postDescription;
  final String postContent;
  PostPage({
    @required this.postTitle,
    @required this.postDate,
    @required this.postBannerUrl,
    @required this.postDescription,
    @required this.postContent
  });
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: accentColor,
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget> [
            new PostCard(
              postTitle:postTitle,
              postBannerUrl: postBannerUrl,
              postDescription: postDescription,
              postContent:postContent,
              postDate:postDate
            ),
            new Padding(
              padding: EdgeInsets.all(20),
              child: new Text(
                postContent,
                style: new TextStyle(
                  color: mainColor,
                  fontSize: 25,
                  fontFamily: stdFont
                )
              )
            )
          ]
        )
      )
    );
  }
}

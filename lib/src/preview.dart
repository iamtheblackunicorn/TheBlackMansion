/*
The Black Mansion App by Alexander Abraham.
Licensed under the MIT license.
*/

import 'vars.dart';
import 'postpage.dart';
import 'package:flutter/material.dart';

/// This is the post preview card.
/// We pass parameters in and then
/// use them in the layout in the [build]
/// method.
class PostCard extends StatelessWidget{
  final String postTitle;
  final String postDate;
  final String postBannerUrl;
  final String postDescription;
  final String postContent;
  PostCard({
    @required this.postTitle,
    @required this.postBannerUrl,
    @required this.postDescription,
    @required this.postContent,
    @required this.postDate
  });
  /// Main [build] method to return a widget
  /// tree.
  @override
  Widget build(BuildContext context){
    return new Padding(
      padding: EdgeInsets.all(20),
      /// Main container where all the magic
      /// happens.
      child:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/2,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          image: DecorationImage(
            image: NetworkImage(postBannerUrl),
            fit: BoxFit.cover
          )
        ),
        child: new InkWell(
          radius: 2,
          splashColor: Color(0xFF808080),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostPage(
                  postTitle: postTitle,
                  postBannerUrl: postBannerUrl,
                  postDescription: postDescription,
                  postContent:postContent,
                  postDate:postDate
                )
              ),
            );
          },
          child: new Stack(
            children: <Widget> [
              new Positioned(
                bottom: 0.2,
                left: 0.2,
                child: Align(
                  alignment: Alignment(
                    -0.8,
                    0.8
                  ),
                  child: new Container(
                    width: MediaQuery.of(context).size.width,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget> [
                        new Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            bottom: 0,
                            right: 0
                          ),
                          child:new Align(
                            alignment: Alignment.bottomLeft,
                            child:new Text(
                              postTitle,
                              style: TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: stdFont
                              )
                            )
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            bottom: 0,
                            right: 0
                          ),
                          child:new Align(
                            alignment: Alignment.bottomLeft,
                            child:new Text(
                              postDate,
                              style: TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: stdFont
                              )
                            )
                          )
                        ),
                        new Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            bottom: 10,
                            right: 0
                          ),
                          child:new Align(
                            alignment: Alignment.bottomLeft,
                            child:new Text(
                              postDescription,
                              style: TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: stdFont
                              )
                            )
                          )
                        )
                      ]
                    )
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}

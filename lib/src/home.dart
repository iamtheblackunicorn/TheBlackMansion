/*
The Black Mansion App by Alexander Abraham.
Licensed under the MIT license.
*/

import 'vars.dart';
import 'data.dart';
import 'error.dart';
import 'loading.dart';
import 'dart:convert';
import 'preview.dart';
import 'postpage.dart';
import 'package:flutter/material.dart';

/// Main class that holds the app together.
class TheBlackMansion extends StatefulWidget{
  /// Need an instance of the data handler.
  final APIStorage apiStorage;
  TheBlackMansion({
    Key key,
    @required this.apiStorage
  }) : super(key: key);
  @override
  TheBlackMansionState createState() => TheBlackMansionState();
}
class TheBlackMansionState extends State<TheBlackMansion> {
  /// We will be updating this
  /// once the data is loaded.
  Future<String> blogData;
  @override
  void initState(){
    super.initState();
    /// Setting [blogData] to what it is supposed
    /// to be. (The loaded data fromt the API server.)
    blogData = widget.apiStorage.readData();
  }
  @override
  Widget build(BuildContext context){
    return FutureBuilder<String>(
      future: blogData,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          /// If the content is loading, display the loading screen.
          return Loading();
        }
        else {
          if (snapshot.hasError) {
            /// If there is an error, display the error screen.
            return Error();
          }
          else {
            /// If everything is A-OK, parse the data and
            /// render it.
            Map<String, dynamic> data = jsonDecode(snapshot.data);
            return new Scaffold(
              backgroundColor: mainColor,
              body:new SingleChildScrollView(
                child:new ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    String key = data.keys.elementAt(index);
                    return PostCard(
                      postTitle: key,
                      postBannerUrl: data[key][2],
                      postDescription: data[key][1],
                      postContent:data[key][3],
                      postDate:data[key][0]
                    );
                  }
                )
              )
            );
          }
        }
      }
    );
  }
}

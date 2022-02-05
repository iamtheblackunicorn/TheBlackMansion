import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:loading_animations/loading_animations.dart';

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TheBlackMansion(
        apiStorage: APIStorage()
      )
    )
  );
}

String apiUrl = 'https://blckunicorn.art/content/api';
Dio dio = new Dio();

class APIStorage {
  Future<String> fetchData() async {
    try {
      Response response = await dio.get(
        apiUrl,
        options: Options(
          responseType: ResponseType.json,
          followRedirects: true,
          validateStatus: (status) { return status < 500; }
        ),
      );
      return response.data;
    } catch (e) {
      Response response = await dio.get(
        apiUrl,
        options: Options(
          responseType: ResponseType.json,
          followRedirects: true,
          validateStatus: (status) { return status < 500; }
        ),
      );
      return response.data;
    }
  }
  Future<String> readData() async {
    Future<String> data = fetchData();
    return data;
  }
}


class TheBlackMansion extends StatefulWidget{
  final APIStorage apiStorage;
  TheBlackMansion({
    Key key,
    @required this.apiStorage
  }) : super(key: key);
  @override
  TheBlackMansionState createState() => TheBlackMansionState();
}
class TheBlackMansionState extends State<TheBlackMansion> {
  Future<String> blogData;
  @override
  void initState(){
    super.initState();
    blogData = widget.apiStorage.readData();
  }
  @override
  Widget build(BuildContext context){
    return FutureBuilder<String>(
      future: blogData,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return Loading();
        }
        else {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Error();
          }
          else {
            //print(jsonDecode(snapshot.data).runtimeType);
            Map<String, dynamic> data = jsonDecode(snapshot.data);
            return new Scaffold(
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

class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            new LoadingBumpingLine.circle(
              size: 150,
              backgroundColor: Color(0xFF000000),
              duration: Duration(
                milliseconds: 20
              )
            )
          ]
        )
      )
    );
  }
}

class Error extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            new Icon(
              Icons.warning,
              color: Color(0xFF000000),
              size: 150,
            ),
          ]
        )
      )
    );
  }
}

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
  @override
  Widget build(BuildContext context){
    return new Padding(
      padding: EdgeInsets.all(20),
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
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
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
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
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
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
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
                  color: Color(0xFFFFFFFF),
                  fontSize: 25
                )
              )
            )
          ]
        )
      )
    );
  }
}

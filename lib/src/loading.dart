/*
The Black Mansion App by Alexander Abraham.
Licensed under the MIT license.
*/

import 'vars.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

/// Widget to return a loading animation
/// when the content is still loading.
class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            new LoadingBumpingLine.circle(
              size: 150,
              backgroundColor: accentColor,
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

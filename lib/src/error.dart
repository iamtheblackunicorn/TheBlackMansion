/*
The Black Mansion App by Alexander Abraham.
Licensed under the MIT license.
*/

import 'vars.dart';
import 'package:flutter/material.dart';

/// Widget to return an error symbol
/// when the content can't be loaded.
class Error extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            new Icon(
              Icons.warning,
              color: accentColor,
              size: 150,
            ),
          ]
        )
      )
    );
  }
}

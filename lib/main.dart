/*
The Black Mansion App by Alexander Abraham.
Licensed under the MIT license.
*/

import 'src/home.dart';
import 'src/data.dart';
import 'package:flutter/material.dart';

/// Main entry-point
/// for the Dart VM.
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

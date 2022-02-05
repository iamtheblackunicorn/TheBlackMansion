/*
The Black Mansion App by Alexander Abraham.
Licensed under the MIT license.
*/

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// URL for the blog's API.
String apiUrl = 'https://blckunicorn.art/content/api';
/// Instance of [Dio].
Dio dio = new Dio();
/// Main color.
Color mainColor = Color(0xFFFFFFFF);
/// Accent color.
Color accentColor = Color(0xFF000000);
/// Main font.
String stdFont = 'PSB';

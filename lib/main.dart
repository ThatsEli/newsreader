import 'package:flutter/material.dart';
import 'package:newsreader/classes/Article.dart';
import 'package:newsreader/pages/Home.dart';

void main() => runApp(MaterialApp(
  title: 'Newsreader',
  home: MaterialApp(
    title: 'Newsreader',
    home: Home(),
    theme: ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Colors.black
    ),
  )
));
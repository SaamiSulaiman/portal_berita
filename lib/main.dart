import 'package:flutter/material.dart';
import 'package:portalberita/ui/constants/colors.dart';
import 'package:portalberita/ui/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kScaffoldBackground),
      home: HomePage(),
    );
  }
}
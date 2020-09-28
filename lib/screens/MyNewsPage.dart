import 'package:flutter/material.dart';
import 'package:virtusa_assignment2/screens/NewsPage.dart';

class MyNewsPage extends StatefulWidget {
  MyNewsPage({Key key}) : super(key: key);

  @override
  _MyNewsPageState createState() => _MyNewsPageState();
}

class _MyNewsPageState extends State<MyNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsPage(),
    );
  }
}

import 'package:flutter/material.dart';

class SearchController extends StatefulWidget {
  SearchController({Key? key}) : super(key: key);

  @override
  _SearchControllerState createState() => _SearchControllerState();
}

class _SearchControllerState extends State<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Search"),
          ),
        ),
        body: Container());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_app/features/articles/article_export/articl_export.dart';

class SearchController extends StatefulWidget {
  SearchController({Key? key}) : super(key: key);

  @override
  _SearchControllerState createState() => _SearchControllerState();
}

class _SearchControllerState extends State<SearchController> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Search"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              maxLines: 1,
              onSubmitted: (value) {
                _dishpatchSearchEvent();
              },
              decoration: InputDecoration(
                isDense: true,
                labelText: "search Articles here..",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                fillColor: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _dishpatchSearchEvent();
            },
            child: Text("Search"),
          ),
        ],
      ),
    );
  }

  void _dishpatchSearchEvent() {
    BlocProvider.of<ArticlesBloc>(this.context).add(
      SearchArticleEvent(
        params: SearchArticleParams(query: controller.text),
      ),
    );
  }
}

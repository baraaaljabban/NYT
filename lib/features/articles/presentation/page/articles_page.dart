import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles_bloc.dart';
import 'package:nyt_app/features/articles/presentation/page/artcile_page_navigation.dart';
import 'package:nyt_app/features/common/snack_bar.dart';

class ArticalesPage extends StatefulWidget {
  ArticalesPage({Key? key}) : super(key: key);

  @override
  _ArticalesPageState createState() => _ArticalesPageState();
}

class _ArticalesPageState extends State<ArticalesPage>
    with ArticlePageNavigation {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ArticlesBloc, ArticlesState>(
        listener: (context, state) {
          if (state is Loading)
            SnackBarHelper.showLoadingSnackBar(context);
          else if (state is Error)
            SnackBarHelper.showErrorSnackBar(context, message: state.message);
          else if (state is ArticleListState) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            moveToArticleListController(
              articles: state.articles,
              context: context,
            );
          }
        },
        builder: (context, state) {
          return Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 1),
                  Text(
                    "search ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Card(
                    borderOnForeground: true,
                    clipBehavior: Clip.hardEdge,
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.search),
                      title: Text("search"),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                  Spacer(flex: 1),
                  Text(
                    "Popular ",
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      getTheMost("emailed", context);
                    },
                    child: Card(
                      borderOnForeground: true,
                      clipBehavior: Clip.hardEdge,
                      elevation: 5,
                      child: ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Most Emailed"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      getTheMost("viewed", context);
                    },
                    child: Card(
                      borderOnForeground: true,
                      clipBehavior: Clip.hardEdge,
                      elevation: 5,
                      child: ListTile(
                        leading: Icon(Icons.remove_red_eye),
                        title: Text("Most Viewed"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      getTheMost("shared", context);
                    },
                    child: Card(
                      borderOnForeground: true,
                      clipBehavior: Clip.hardEdge,
                      elevation: 5,
                      child: ListTile(
                        leading: Icon(Icons.share_rounded),
                        title: Text("Most Shared"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              ));
        },
      ),
    );
  }
}

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
                    "Search",
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      goToSearchController(context);
                    },
                    child: MyCard(
                      icon: Icon(Icons.search),
                      title: ("Search Articles"),
                    ),
                  ),
                  Spacer(flex: 1),
                  Text(
                    "Popular ",
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      getTheMostPopular("emailed", context);
                    },
                    child: MyCard(
                      title: "Most Emailed",
                      icon: Icon(Icons.email),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      getTheMostPopular("viewed", context);
                    },
                    child: MyCard(
                      title: "Most Viewed",
                      icon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      getTheMostPopular("shared", context);
                    },
                    child: MyCard(
                      title: "Most Shared",
                      icon: Icon(Icons.share),
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

class MyCard extends StatelessWidget {
  final String title;
  final Icon icon;
  MyCard({
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      child: ListTile(
        leading: icon,
        title: Text(title),
        trailing: Icon(Icons.navigate_next),
      ),
    );
  }
}

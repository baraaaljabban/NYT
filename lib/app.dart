import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles_bloc.dart';
import 'package:nyt_app/features/articles/presentation/page/articles_page.dart';

import 'core/Service/injection_service.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArticlesBloc>(
          create: (BuildContext context) => sl<ArticlesBloc>(),
          child: ArticalesPage(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Center(child: Text("NYT")),
          ),
          body: Builder(
            builder: (builtContext) {
              return ArticalesPage();
            },
          ),
        ),
      ),
    );
  }
}

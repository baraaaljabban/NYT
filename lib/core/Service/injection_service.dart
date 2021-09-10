import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:nyt_app/core/Network/http_client.dart';
import 'package:nyt_app/core/Network/network_info.dart';
import 'package:nyt_app/features/articles/article_export/articl_export.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'articls.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => DataConnectionChecker());
  sl.registerFactory(() => Connectivity());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
        connectivity: sl(),
        dataConnectionChecker: sl(),
      ));
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => HttpHelper());
   articlDependencyIncection();
}

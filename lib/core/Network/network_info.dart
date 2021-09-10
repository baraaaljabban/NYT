import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';


abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;
  final Connectivity connectivity;
  NetworkInfoImpl({
    required this.dataConnectionChecker,
    required this.connectivity,
  });

  Future<bool> isConnected() async {
    var hasConnection = await dataConnectionChecker.hasConnection;
    var connectivityResult = await (connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return hasConnection;
    } else {
      return false;
    }
  }
}

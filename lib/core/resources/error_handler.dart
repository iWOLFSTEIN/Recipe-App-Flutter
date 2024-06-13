import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';
import 'package:recipes_app/core/resources/data_state.dart';

class ErrorHandler {
  static Future<DataState<T>> onNetworkRequest<T>(
      {required Future<T> Function() fetch}) async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (!(connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi))) {
        const noInternet = 'No Internet';
        showErrorInConsole(noInternet);
        return DataFailed(Exception(noInternet));
      }
      final serializedResponse = await fetch();
      return DataSuccess<T>(serializedResponse);
    } catch (e, s) {
      showErrorInConsole(e, s);
      return DataFailed<T>(Exception(e));
    }
  }

  static void showErrorInConsole(e, [s]) {
    Logger().e(e.toString(), time: DateTime.now(), error: e, stackTrace: s);
  }
}

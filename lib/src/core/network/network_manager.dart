import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:etiya/src/core/constants/application_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// It's a Dio class that has a retry interceptor
/// and a pretty logger interceptor
class CoreDio with DioMixin implements Dio {
  @override
  // ignore: overridden_fields
  final BaseOptions options;

  CoreDio(this.options) {
    options = options;
    interceptors.add(PrettyDioLogger());
    interceptors.add(
      RetryInterceptor(
        dio: this,
        logPrint: print,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 2),
          Duration(seconds: 4),
          Duration(seconds: 10),
        ],
      ),
    );
    httpClientAdapter = DefaultHttpClientAdapter();
  }
}

/// It's a singleton class that provides a Dio instance with a baseUrl
class NetworkManager {
  /// It's creating a Dio instance with a baseUrl.
  final Dio dio = CoreDio(
    BaseOptions(
      baseUrl: ApplicationConstants.baseUrl,
      headers: {
        'X-RapidAPI-Key': ApplicationConstants.apiKey,
        'X-RapidAPI-Host': ApplicationConstants.apiHost,
      },
    ),
  );
}

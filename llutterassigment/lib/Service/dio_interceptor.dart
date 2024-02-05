import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioInterceptor {
  static Interceptor getInterceptor() {
    final Logger logger = Logger();

    return InterceptorsWrapper(
      onRequest: (options, handler) {
        logger.d('Request: ${options.method} ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        logger.d(
            'Response: ${response.statusCode} ${response.requestOptions.uri}');
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        logger.e('Error: ${e.message}');
        return handler.next(e);
      },
    );
  }
}

import 'package:dio/dio.dart';

import '../core/data/models/base_response.dart';

class DioClient {
  DioClient() {
    _dio = Dio(options);
  }

  static final options = BaseOptions(
    baseUrl: 'http://hit-test.b-office.ru:44343/api/',
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 30),
  );

  late Dio _dio;

  Dio get dio => _dio;

  Future<BaseResponse<T>> post<T>({required String path, dynamic data}) async {
    final result = await _dio.post(path, data: data);

    final error = (result.data['ErrorCode'] as int?) ?? 0;
    if (error > 0) throw Exception();

    final object = result.data['Data'];
    if (object == null) throw Exception();

    return BaseResponse<T>(data: object);
  }

  Future<BaseResponse<T>> get<T>({required String path}) async {
    final result = await _dio.get(path);

    final error = (result.data['ErrorCode'] as int?) ?? 0;
    if (error > 0) throw Exception();

    final object = result.data['Data'];
    if (object == null) throw Exception();

    return BaseResponse<T>(data: object);
  }
}

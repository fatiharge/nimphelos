import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nimphelos/enum/error_type_enum.dart';
import 'package:nimphelos/model/dio_exception_handler_model.dart';
import 'package:nimphelos/extension/get_dio_exception_handler.dart';
import 'package:nimphelos/model/nimphelos_model.dart';
import 'package:nimphelos/nimphelos.dart';

void main() {
  group("GetDioExceptionHandlerExtension", () {
    Nimphelos nimphelos = Nimphelos();
    late Dio dio;

    setUpAll(() {
      dio = Dio(BaseOptions(baseUrl: "https://fatiharge.com/"));
    });

    test('Test GetDioExceptionHandlerExtension', () async {
      // Execute fetchData method with a response that throws a custom Exception
      NimphelosModel res = await nimphelos.fetchData<dynamic>(
        response: () async {
          return dio.get("/welcome/test300");
        },
      );

      print(res.success);
      print(res.object.runtimeType);
      print(res.exception.runtimeType);

      print((res.exception as DioException).type);
      print((res.exception as DioException).response.toString());



      // Check if the exception type is Exception
      expect(res.exception, isNotNull);

      // Check if the operation was not successful (since an error occurred)
      expect(res.success, false);

      // Check if the error type enum is set to unhandled
      expect(res.errorTypeEnum, ErrorTypeEnum.dio);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:nimphelos/enum/error_type_enum.dart';
import 'package:nimphelos/model/nimphelos_model.dart';
import 'package:nimphelos/nimphelos.dart';

void main() {
  test('Test GetExceptionHandlerExtension', () async {
    // Create an instance of Nimphelos
    Nimphelos nimphelos = Nimphelos();

    // Execute fetchData method with a response that throws a custom Exception
    NimphelosModel res = await nimphelos.fetchData<bool?>(
      response: () async {
        // Simulate a delay, as if it's making an asynchronous network request
        await Future.delayed(const Duration(microseconds: 100));

        // Throw a custom Exception
        throw Exception('Custom Exception');
      },
    );

    Exception exception = res.exception;

    // Check if the exception type is Exception
    expect(exception, isNotNull);

    // Check if the operation was not successful (since an error occurred)
    expect(res.success, false);

    // Check if the error type enum is set to unhandled
    expect(res.errorTypeEnum, ErrorTypeEnum.unhandled);
  });
}

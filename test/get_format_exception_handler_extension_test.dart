import 'package:flutter_test/flutter_test.dart';
import 'package:nimphelos/enum/error_type_enum.dart';
import 'package:nimphelos/model/nimphelos_model.dart';
import 'package:nimphelos/nimphelos.dart';

void main() {
  test('Test GetFormatExceptionHandlerExtension', () async {
    // Create an instance of Nimphelos
    Nimphelos nimphelos = Nimphelos();

    // Execute fetchData method with a response that throws a FormatException
    NimphelosModel res = await nimphelos.fetchData<bool?>(
      response: () async {
        // Simulate a delay, as if it's making an asynchronous network request
        await Future.delayed(const Duration(microseconds: 100));

        // Throw a FormatException with a message
        throw const FormatException('Invalid format');
      },
    );

    // Check if the exception type is FormatException
    expect(res.exception.runtimeType, FormatException);

    // Check if the operation was not successful (since an error occurred)
    expect(res.success, false);

    // Check if the error type enum is set to formatException
    expect(res.errorTypeEnum, ErrorTypeEnum.formatException);
  });
}

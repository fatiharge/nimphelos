import 'dart:convert'; // Library for JSON operations

import 'package:dio/dio.dart'; // Library for HTTP requests
import 'package:flutter_test/flutter_test.dart'; // Library for Flutter tests
import 'package:nimphelos/model/nimphelos_model.dart'; // Importing the NimphelosModel class
import 'package:nimphelos/nimphelos.dart'; // File containing the Nimphelos class

void main() {
  group("Nimphelos", () {
    Nimphelos nimphelos =
        Nimphelos(); // Creating an instance of the Nimphelos class
    late Dio
        dio; // Creating an instance of the Dio class (to be assigned later)

    setUpAll(() {
      dio = Dio(BaseOptions(
          baseUrl:
              "https://fatiharge.com/")); // Assigning a baseUrl to the Dio instance
    });

    test('Test Nimphelos', () async {
      NimphelosModel res = await nimphelos.fetchData<String>(
        response: () async {
          return (await dio.get("/welcome/test200"))
              .data; // Making an HTTP GET request and returning the data
        },
      );

      Map<String, dynamic> responseJson =
          jsonDecode(res.object); // Converting the received data to JSON

      // The following lines print various variables and their values.
      // These lines can be uncommented and executed.

      // print(responseJson['success']);
      // print(res.success);
      // print(res.object.runtimeType);
      // print(res.exception.runtimeType);
      //
      // print((res.exception as DioException).type);
      // print((res.exception as DioException).response.toString());

      expect(res.success,
          true); // Checking if the 'success' value of the 'res' object is equal to the expected value
      expect(responseJson['success'],
          true); // Checking if the 'success' value from the JSON matches the expected value
    });
  });
}

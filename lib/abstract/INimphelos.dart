import 'package:flutter/material.dart';
import 'package:nimphelos/model/format_exception_handler_model.dart';
import 'package:nimphelos/model/nimphelos_model.dart';
import 'package:nimphelos/model/dio_exception_handler_model.dart';
import 'package:nimphelos/model/exception_handler_model.dart';
import 'package:nimphelos/model/json_exception_handler_model.dart';

/// An abstract class for managing service calls and handling exceptions.
abstract class IAbstract {
  /// Fetches data from a service and returns a [NimphelosModel] containing the result.
  ///
  /// * [response] is a required function that returns a Future containing the response data.
  /// * [context] is an optional parameter representing the current build context.
  /// * [activeAlert] determines if an alert should be shown in case of an error (default is true).
  /// * [activeWillAlwaysWork] determines if the exception handler should be activated (default is true).
  /// * [generalFunction] is a function to handle exceptions of type [E], when a specific function is not provided,
  /// and [context] is null. It is only invoked in this case.
  /// * [willAlwaysWork] is a function to handle specific exceptions and will always be invoked.
  /// * [exceptionDioHandlers] contains a set of custom Dio exception handling functions.
  /// * [exceptionJsonHandlers] contains a set of custom JSON exception handling functions.
  /// * [exceptionFormatHandlers] contains a set of custom JSON format exception handling functions.
  /// * [exceptionHandlers] contains a set of custom exception handling functions.
  ///
  /// Returns a [NimphelosModel] with the result of the service call.
  Future<NimphelosModel<T, dynamic>> fetchData<T>({
    required Future<T> Function() response,
    BuildContext? context,
    bool activeAlert = true,
    bool activeWillAlwaysWork = true,
    bool Function<E>(E? exception)? generalFunction,
    Function<E>(E exception)? willAlwaysWork,
    DioExceptionHandlerModel? exceptionDioHandlers,
    JsonExceptionHandlerModel? exceptionJsonHandlers,
    FormatExceptionHandlerModel? exceptionFormatHandlers,
    ExceptionHandlerModel? exceptionHandlers,
  });
}

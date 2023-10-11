/*
 * All rights reserved © 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Email   : fatih@fatiharge.com
 */

import 'package:dio/dio.dart';
import 'package:nimphelos/model/dio_exception_handler_model.dart';
import 'package:nimphelos/nimphelos.dart';

/// An extension providing methods for handling DioExceptions in ServiceManager.
extension GetDioExceptionHandlerExtension on Nimphelos {
  /// Retrieves the Dio exception handling function based on the provided DioException.
  ///
  /// * [e] is the DioException to handle.
  /// * [exceptionHandlers] contains a set of custom Dio exception handling functions.
  ///
  /// Returns a function to handle the specific DioException, if available.
  bool? Function(DioException exception)? getDioExceptionHandler({
    required DioException e,
    required DioExceptionHandlerModel? exceptionHandlers,
  }) {
    bool? Function(DioException exception)? function;

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        function = exceptionHandlers?.connectionTimeout;
        break;
      case DioExceptionType.sendTimeout:
        function = exceptionHandlers?.sendTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        function = exceptionHandlers?.receiveTimeout;
        break;
      case DioExceptionType.badCertificate:
        function = exceptionHandlers?.badCertificate;
        break;
      case DioExceptionType.badResponse:
        function = exceptionHandlers?.badResponse;
        break;
      case DioExceptionType.cancel:
        function = exceptionHandlers?.cancel;
        break;
      case DioExceptionType.connectionError:
        function = exceptionHandlers?.connectionError;
        break;
      case DioExceptionType.unknown:
        function = exceptionHandlers?.unknown;
        break;
    }
    return function;
  }
}

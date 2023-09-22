/*
 * All rights reserved © 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Email   : fatih@fatiharge.com
 */


import 'package:nimphelos/model/exception_handler_model.dart';
import 'package:nimphelos/nimphelos.dart';

/// An extension providing a method for handling general Exceptions in ServiceManager.
extension GetExceptionHandlerExtension on Nimphelos {
  /// Returns the general exception handler function.
  ///
  /// * [exceptionHandlers] contains a set of custom general exception handling functions.
  ///
  /// Returns a function that can handle general Exceptions, or null if none is found.
  bool? Function(Exception exception)? getExceptionHandler({
    required ExceptionHandlerModel? exceptionHandlers,
  }) {
    return exceptionHandlers?.exceptionParseHandle;
  }
}

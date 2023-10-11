/*
 * All rights reserved © 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Email   : fatih@fatiharge.com
 */

import 'dart:convert';

import 'package:nimphelos/model/json_exception_handler_model.dart';
import 'package:nimphelos/nimphelos.dart';

/// Extension methods for retrieving JSON exception handling functions.
extension GetJsonExceptionHandlerExtension on Nimphelos {
  /// Retrieves the JSON exception handling function for JsonUnsupportedObjectError.
  ///
  /// * [exceptionHandlers] contains a set of custom JSON exception handling functions.
  ///
  /// Returns a function to handle JsonUnsupportedObjectError.
  bool? Function(JsonUnsupportedObjectError exception)?
      getJsonExceptionHandler({
    required JsonExceptionHandlerModel? exceptionHandlers,
  }) {
    return exceptionHandlers?.jsonParseHandle;
  }
}

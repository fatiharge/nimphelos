/*
 * All rights reserved © 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Email   : fatih@fatiharge.com
 */

import 'package:nimphelos/model/format_exception_handler_model.dart';
import 'package:nimphelos/nimphelos.dart';

/// Extension methods for retrieving JSON Format exception handling functions.
extension GetFormatExceptionHandlerExtension on Nimphelos {
  /// Retrieves the JSON Format exception handling function for FormatException.
  ///
  /// * [exceptionHandlers] contains a set of custom JSON Format exception handling functions.
  ///
  /// Returns a function to handle FormatException.
  bool? Function(FormatException exception)? getFormatExceptionHandler({
    required FormatExceptionHandlerModel? exceptionHandlers,
  }) {
    return exceptionHandlers?.formatExceptionHandle;
  }
}

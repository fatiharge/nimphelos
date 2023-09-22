/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:nimphelos/enum/error_type_enum.dart';

/// The `BaseResponseModel` class represents the response model for API requests.
/// It contains the response object, error handling function, exception information,
/// error type, and a flag indicating whether the request was successful.
class NimphelosModel<T, E> {
  /// The object containing the response data.
  T? object;

  /// The function to handle exceptions in case of an error.
  bool? Function(E exception)? function;

  /// The exception information in case of an error.
  E? exception;

  /// The type of error encountered (e.g., Dio error, unhandled exception).
  ErrorTypeEnum errorTypeEnum;

  /// A flag indicating whether the request was successful.
  bool success;

  /// Constructs a BaseResponseModel instance.
  ///
  /// * [object] is the response data.
  /// * [function] is the function to handle exceptions.
  /// * [success] indicates whether the request was successful.
  /// * [exception] is the exception information.
  /// * [errorTypeEnum] represents the type of error encountered.
  NimphelosModel({
    this.object,
    this.function,
    required this.success,
    required this.errorTypeEnum,
    this.exception,
  });
}

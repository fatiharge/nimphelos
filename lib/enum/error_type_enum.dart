/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

/// Enum representing different types of errors.
enum ErrorTypeEnum {
  /// Indicates a successful operation.
  success,

  /// Indicates a Dio-related error.
  dio,

  /// Indicates an unhandled error.
  unhandled,

  /// Indicates an error related to JSON object parsing.
  jsonUnsupportedObjectError,

  /// Format Exception
  formatException,
}

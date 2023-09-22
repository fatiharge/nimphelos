/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:nimphelos/model/exception_explanation_model.dart';

/// A model class for handling JSON FormatException exceptions.
class FormatExceptionHandlerModel {
  /// A function that can handle exceptions of type [FormatException].
  bool? Function(FormatException exception)? formatExceptionHandle;

  /// An explanation model for handling exceptions.
  ExceptionExplanationModel? formatExceptionHandleModel;

  /// Creates a [FormatExceptionHandlerModel] instance.
  ///
  /// * [formatExceptionHandle]: A function that can handle exceptions of type [FormatException].
  /// * [formatExceptionHandleModel]: An explanation model for handling exceptions.
  FormatExceptionHandlerModel({
    this.formatExceptionHandle,
    this.formatExceptionHandleModel,
  });
}

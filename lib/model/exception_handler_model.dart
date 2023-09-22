/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:nimphelos/model/exception_explanation_model.dart';

/// A model class for handling exceptions.
class ExceptionHandlerModel {
  /// A function that can handle exceptions of type [Exception].
  bool? Function(Exception exception)? exceptionParseHandle;

  /// An explanation model for handling exceptions.
  ExceptionExplanationModel? exceptionParseHandleModel;

  /// Creates an [ExceptionHandlerModel] instance.
  ///
  /// * [exceptionParseHandle]: A function that can handle exceptions of type [Exception].
  /// * [exceptionParseHandleModel]: An explanation model for handling exceptions.
  ExceptionHandlerModel({
    this.exceptionParseHandle,
    this.exceptionParseHandleModel,
  });
}

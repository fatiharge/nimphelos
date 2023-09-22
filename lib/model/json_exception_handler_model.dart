/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'dart:convert';

import 'package:nimphelos/model/exception_explanation_model.dart';

/// A model class for handling JSON exceptions.
class JsonExceptionHandlerModel {
  /// A function that can handle exceptions of type [JsonUnsupportedObjectError].
  bool? Function(JsonUnsupportedObjectError exception)? jsonParseHandle;

  /// An explanation model for handling exceptions.
  ExceptionExplanationModel? jsonParseHandleModel;

  /// Creates a [JsonExceptionHandlerModel] instance.
  ///
  /// * [jsonParseHandle]: A function that can handle exceptions of type [JsonUnsupportedObjectError].
  /// * [jsonParseHandleModel]: An explanation model for handling exceptions.
  JsonExceptionHandlerModel({
    this.jsonParseHandle,
    this.jsonParseHandleModel,
  });
}

/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:dio/dio.dart';
import 'package:nimphelos/model/exception_explanation_model.dart';

/// [DioExceptionHandlerModel]  class for handling specific Dio exceptions with custom behavior.
class DioExceptionHandlerModel {
  /// Handler function for Dio connection timeout exception.
  bool? Function(DioException exception)? connectionTimeout;

  /// Handler function for Dio send timeout exception.
  bool? Function(DioException exception)? sendTimeout;

  /// Handler function for Dio receive timeout exception.
  bool? Function(DioException exception)? receiveTimeout;

  /// Handler function for Dio bad certificate exception.
  bool? Function(DioException exception)? badCertificate;

  /// Handler function for Dio bad response exception.
  bool? Function(DioException exception)? badResponse;

  /// Handler function for Dio cancel exception.
  bool? Function(DioException exception)? cancel;

  /// Handler function for Dio connection error exception.
  bool? Function(DioException exception)? connectionError;

  /// Handler function for unknown Dio exceptions.
  bool? Function(DioException exception)? unknown;

  /// Explanation model for connection timeout exception.
  ExceptionExplanationModel? connectionTimeoutModel;

  /// Explanation model for send timeout exception.
  ExceptionExplanationModel? sendTimeoutModel;

  /// Explanation model for receive timeout exception.
  ExceptionExplanationModel? receiveTimeoutModel;

  /// Explanation model for bad certificate exception.
  ExceptionExplanationModel? badCertificateModel;

  /// Explanation model for bad response exception.
  ExceptionExplanationModel? badResponseModel;

  /// Explanation model for cancel exception.
  ExceptionExplanationModel? cancelModel;

  /// Explanation model for connection error exception.
  ExceptionExplanationModel? connectionErrorModel;

  /// Explanation model for unknown exceptions.
  ExceptionExplanationModel? unknownModel;

  DioExceptionHandlerModel({
    this.connectionTimeout,
    this.sendTimeout,
    this.receiveTimeout,
    this.badCertificate,
    this.badResponse,
    this.cancel,
    this.connectionError,
    this.unknown,
    this.connectionTimeoutModel,
    this.sendTimeoutModel,
    this.receiveTimeoutModel,
    this.badCertificateModel,
    this.badResponseModel,
    this.cancelModel,
    this.connectionErrorModel,
    this.unknownModel,
  });
}

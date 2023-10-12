/*
 * Copyright (c) 2023. Fatih Çetin
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nimphelos/model/dio_exception_handler_model.dart';
import 'package:nimphelos/model/exception_explanation_model.dart';
import 'package:nimphelos/nimphelos.dart';

/// Extension methods for preparing DioException handling functions.
extension PrepareDioExceptionExtension on Nimphelos {
  /// Prepares a DioException handling function based on the provided context and exception type.
  ///
  /// * [context] is the current build context.
  /// * [type] is the type of DioException.
  /// * [exceptionHandlers] contains a set of custom Dio exception handling functions.
  /// * [generalFunction] is a function to handle exceptions when a specific function is not provided,
  /// and [context] is null. It is only invoked in this case.
  ///
  /// Returns a function to handle the specific DioException.
  bool Function(DioException exception)? prepareDioFunction({
    BuildContext? context,
    required DioExceptionType type,
    required DioExceptionHandlerModel? exceptionHandlers,
  }) {
    if (context == null) {
      return (DioException exception) {
        debugPrint(exception.message);
        return true;
      };
    }

    switch (type) {
      // Handle connection timeout exception.
      case DioExceptionType.connectionTimeout:
        return (DioException exception) => showAlertDialog(
              context,
              exceptionHandlers?.connectionTimeoutModel?.title ??
                  "Connection Timeout",
              exceptionHandlers?.connectionTimeoutModel?.content ??
                  "The connection timed out. Please try again.",
              exceptionHandlers?.connectionTimeoutModel?.buttonContent ??
                  "Close",
            );

      // Handle send timeout exception.
      case DioExceptionType.sendTimeout:
        return (DioException exception) => showAlertDialog(
              context,
              exceptionHandlers?.sendTimeoutModel?.title ?? "Send Timeout",
              exceptionHandlers?.sendTimeoutModel?.content ??
                  "Sending data timed out. Please try again.",
              exceptionHandlers?.sendTimeoutModel?.buttonContent ?? "Close",
            );

      // Handle receive timeout exception.
      case DioExceptionType.receiveTimeout:
        return (DioException exception) => showAlertDialog(
              context,
              exceptionHandlers?.receiveTimeoutModel?.title ??
                  "Receive Timeout",
              exceptionHandlers?.receiveTimeoutModel?.content ??
                  "Receiving data timed out. Please try again.",
              exceptionHandlers?.receiveTimeoutModel?.buttonContent ?? "Close",
            );

      // Handle invalid certificate exception.
      case DioExceptionType.badCertificate:
        return (DioException exception) => showAlertDialog(
              context,
              exceptionHandlers?.badCertificateModel?.title ??
                  "Invalid Certificate",
              exceptionHandlers?.badCertificateModel?.content ??
                  "The server's certificate is invalid. Please connect to a secure network for communication.",
              exceptionHandlers?.badCertificateModel?.buttonContent ?? "Close",
            );

      // Handle bad response exception.
      case DioExceptionType.badResponse:
        return (DioException exception) => showAlertDialog(
              context,
              exceptionHandlers?.badResponseModel?.title ?? "Bad Response",
              exceptionHandlers?.badResponseModel?.content ??
                  "A bad response was received from the server.",
              exceptionHandlers?.badResponseModel?.buttonContent ?? "Close",
            );

      // Handle cancelled exception.
      case DioExceptionType.cancel:
        return (DioException exception) => showAlertDialog(
              context,
              exceptionHandlers?.cancelModel?.title ?? "Cancelled",
              exceptionHandlers?.cancelModel?.content ??
                  "The operation was cancelled.",
              exceptionHandlers?.cancelModel?.buttonContent ?? "Close",
            );

      // Handle connection error exception.
      case DioExceptionType.connectionError:
        return (DioException exception) => showAlertDialog(
              context,
              exceptionHandlers?.connectionErrorModel?.title ??
                  "Connection Error",
              exceptionHandlers?.connectionErrorModel?.content ??
                  "A connection error occurred. Please check your network connection.",
              exceptionHandlers?.connectionErrorModel?.buttonContent ?? "Close",
            );

      // Handle unknown exception.
      case DioExceptionType.unknown:
        return (DioException exception) => showAlertDialog(
              context,
              exceptionHandlers?.unknownModel?.title ?? "Unknown Error",
              exceptionHandlers?.unknownModel?.content ??
                  "An unexpected error occurred.",
              exceptionHandlers?.unknownModel?.buttonContent ?? "Close",
            );
    }
  }

  /// Prepares a general Exception handling function based on the provided context and exception model.
  ///
  /// * [exceptionExplanationModel] contains information about the exception for displaying in the alert dialog.
  /// * [context] is the current build context.
  /// * [generalFunction] is a function to handle exceptions when a specific function is not provided,
  /// and [context] is null. It is only invoked in this case.
  ///
  /// Returns a function to handle the general Exception.
  bool Function(Exception exception)? prepareExceptionFunction({
    ExceptionExplanationModel? exceptionExplanationModel,
    BuildContext? context,
  }) {
    if (context == null) {
      return (Exception exception) {
        debugPrint(exception.toString());
        return true;
      };
    }

    return (Exception exception) => showAlertDialog(
          context,
          exceptionExplanationModel?.title ?? "Unknown Error",
          exceptionExplanationModel?.content ?? "An unexpected error occurred.",
          exceptionExplanationModel?.buttonContent ?? "Close",
        );
  }

  /// Prepares a JsonUnsupportedObjectError handling function based on the provided context and exception model.
  ///
  /// * [exceptionExplanationModel] contains information about the exception for displaying in the alert dialog.
  /// * [context] is the current build context.
  /// * [generalFunction] is a function to handle exceptions when a specific function is not provided,
  /// and [context] is null. It is only invoked in this case.
  ///
  /// Returns a function to handle the JsonUnsupportedObjectError.
  bool Function(JsonUnsupportedObjectError exception)?
      prepareJsonExceptionFunction({
    ExceptionExplanationModel? exceptionExplanationModel,
    BuildContext? context,
  }) {
    if (context == null) {
      return (JsonUnsupportedObjectError exception) {
        debugPrint(exception.toString());
        return true;
      };
    }

    return (JsonUnsupportedObjectError exception) => showAlertDialog(
          context,
          "UnsupportedObject Error",
          "An UnsupportedObject error occurred.",
          "Close",
        );
  }

  /// Prepares a FormatException handling function based on the provided context and exception model.
  ///
  /// * [exceptionExplanationModel] contains information about the exception for displaying in the alert dialog.
  /// * [context] is the current build context.
  /// * [generalFunction] is a function to handle exceptions when a specific function is not provided,
  /// and [context] is null. It is only invoked in this case.
  ///
  /// Returns a function to handle the FormatException.
  bool Function(FormatException exception)? prepareFormatExceptionFunction({
    ExceptionExplanationModel? exceptionExplanationModel,
    BuildContext? context,
  }) {
    if (context == null) {
      return (FormatException exception) {
        debugPrint(exception.toString());
        return true;
      };
    }

    return (FormatException exception) => showAlertDialog(
          context,
          "FormatException Error",
          "An FormatException error occurred.",
          "Close",
        );
  }
}

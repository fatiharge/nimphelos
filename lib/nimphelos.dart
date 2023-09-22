/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

library nimphelos;

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nimphelos/extension/get_format_exception_handler.dart';
import 'package:nimphelos/model/format_exception_handler_model.dart';
import 'package:nimphelos/model/nimphelos_model.dart';
import 'package:nimphelos/enum/error_type_enum.dart';
import 'package:nimphelos/extension/get_dio_exception_handler.dart';
import 'package:nimphelos/extension/get_exception_handler.dart';
import 'package:nimphelos/extension/get_json_exception_handler.dart';
import 'package:nimphelos/extension/prepare_function_extension.dart';
import 'package:nimphelos/mixin/show_dialog_mixin.dart';
import 'package:nimphelos/model/dio_exception_handler_model.dart';
import 'package:nimphelos/model/exception_handler_model.dart';
import 'package:nimphelos/model/json_exception_handler_model.dart';
import 'package:nimphelos/abstract/INimphelos.dart';

/// A class providing methods for managing service calls and handling exceptions.
class Nimphelos extends IAbstract with ShowDialogMixin {
  /// Fetches data from a service and returns a [NimphelosModel] containing the result.
  ///
  /// * [response] is a required function that returns a Future containing the response data.
  /// * [context] is an optional parameter representing the current build context.
  /// * [activeAlert] determines if an alert should be shown in case of an error (default is true).
  /// * [activeWillAlwaysWork] determines if the exception handler should be activated (default is true).
  /// * [generalFunction] is a function to handle exceptions of type [E], when a specific function is not provided,
  /// and [context] is null. It is only invoked in this case.
  /// * [willAlwaysWork] is a function to handle specific exceptions and will always be invoked.
  /// * [exceptionDioHandlers] contains a set of custom Dio exception handling functions.
  /// * [exceptionJsonHandlers] contains a set of custom JSON exception handling functions.
  /// * [exceptionFormatHandlers] contains a set of custom JSON format exception handling functions.
  /// * [exceptionHandlers] contains a set of custom exception handling functions.
  ///
  /// Returns a [NimphelosModel] with the result of the service call.
  @override
  Future<NimphelosModel<T, dynamic>> fetchData<T>({
    required Future<T> Function() response,
    BuildContext? context,
    bool activeAlert = true,
    bool activeWillAlwaysWork = true,
    bool Function<E>(E? exception)? generalFunction,
    Function<E>(E exception)? willAlwaysWork,
    DioExceptionHandlerModel? exceptionDioHandlers,
    JsonExceptionHandlerModel? exceptionJsonHandlers,
    FormatExceptionHandlerModel? exceptionFormatHandlers,
    ExceptionHandlerModel? exceptionHandlers,
  }) async {
    // The addition of this delay is made to address potential `context` access issues,
    // especially when this method is called from lifecycle functions like `initState`.
    // Functions like `initState` are executed when the component is being created, and
    // at this point, the widget tree might not be fully constructed yet. Consequently,
    // the `context` variable might be null, indicating that the `BuildContext` is not
    // yet ready. Therefore, by adding this delay, we ensure that the creation of the
    // `context` is awaited in such cases. This ensures the smooth functioning of the app.
    //
    // However, it's important to note that this delay addition is a temporary workaround,
    // and the actual solution lies in refraining from using `context` within lifecycle
    // functions like `initState`. We do not want to strictly enforce this rule, as there
    // might be situations where accessing `context` is necessary. Hence, this delay
    // addition serves as a temporary measure. Nevertheless, if encountering this situation
    // frequently or relying on this delay consistently, it may indicate the need for a
    // design review.
    await Future.delayed(const Duration(microseconds: 1));
    try {
      return NimphelosModel(
        // Retrieve the response data using the provided response function.
        object: await response(),

        // Indicate that the operation was successful.
        success: true,

        // Specify that the error type is a success (no error).
        errorTypeEnum: ErrorTypeEnum.success,
      );
    } on DioException catch (e) {
      // Create an object to call the prepareDioFunction.
      bool Function(DioException)? prepareDioFunctionInstance;

      // If there is a context and the widget is in "mounted" state, prepare the function.
      if (context?.mounted ?? false) {
        // ignore: use_build_context_synchronously
        prepareDioFunctionInstance = prepareDioFunction(
          context: context,
          type: e.type,
          generalFunction: generalFunction,
          exceptionHandlers: exceptionDioHandlers,
        );
      }

      // Create a BaseResponseModel object for DioException.
      NimphelosModel<T, DioException> baseResponseModel = NimphelosModel(
        errorTypeEnum: ErrorTypeEnum.dio,
        exception: e,
        success: false,
        function: getDioExceptionHandler(
              e: e,
              exceptionHandlers: exceptionDioHandlers,
            ) ??
            prepareDioFunctionInstance,
      );

      // If activeAlert is true and baseResponseModel.function returns false, call prepareDioFunction.
      if (activeAlert) {
        if (baseResponseModel.function?.call(e) == false) {
          prepareDioFunctionInstance?.call(e);
        }
      }

      // If activeWillAlwaysWork is true, call the willAlwaysWork function for DioException.
      if (activeWillAlwaysWork) {
        willAlwaysWork?.call<DioException>(e);
      }

      // Return the created BaseResponseModel object for DioException.
      return baseResponseModel;
    } on JsonUnsupportedObjectError catch (e) {
      // If a JsonUnsupportedObjectError occurs, this block will be executed.

      // Create an object to call the prepareJsonExceptionFunction.
      bool Function(JsonUnsupportedObjectError)? prepareJsonExceptionFunctionInstance;

      // If there is a context and the widget is in "mounted" state, prepare the function.
      if (context?.mounted ?? false) {
        // ignore: use_build_context_synchronously
        prepareJsonExceptionFunctionInstance = prepareJsonExceptionFunction(
          context: context!,
          generalFunction: generalFunction,
        );
      }

      // Create a BaseResponseModel object for JsonUnsupportedObjectError.
      NimphelosModel<T, JsonUnsupportedObjectError> baseResponseModel = NimphelosModel<T, JsonUnsupportedObjectError>(
        errorTypeEnum: ErrorTypeEnum.jsonUnsupportedObjectError,
        success: false,
        function: getJsonExceptionHandler(
              exceptionHandlers: exceptionJsonHandlers,
            ) ??
            prepareJsonExceptionFunctionInstance,
        exception: e,
      );

      // If activeAlert is true and baseResponseModel.function returns false, call prepareJsonExceptionFunction.
      if (activeAlert) {
        if (baseResponseModel.function?.call(e) == false) {
          prepareJsonExceptionFunctionInstance?.call(e);
        }
      }

      // If activeWillAlwaysWork is true, call the willAlwaysWork function for JsonUnsupportedObjectError.
      if (activeWillAlwaysWork) {
        willAlwaysWork?.call<JsonUnsupportedObjectError>(e);
      }

      // Return the created BaseResponseModel object for JsonUnsupportedObjectError.
      return baseResponseModel;
    } on FormatException catch (e) {

      bool Function(FormatException)? prepareFormatExceptionFunctionInstance;

      // If there is a context and the widget is in "mounted" state, prepare the function.
      if (context?.mounted ?? false) {
        // ignore: use_build_context_synchronously
        prepareFormatExceptionFunctionInstance = prepareFormatExceptionFunction(
          context: context!,
          generalFunction: generalFunction,
        );
      }

      // Create a BaseResponseModel object for FormatException.
      NimphelosModel<T, FormatException> baseResponseModel = NimphelosModel<T, FormatException>(
        errorTypeEnum: ErrorTypeEnum.formatException,
        success: false,
        function: getFormatExceptionHandler(
              exceptionHandlers: exceptionFormatHandlers,
            ) ??
            prepareFormatExceptionFunctionInstance,
        exception: e,
      );

      // If activeAlert is true and baseResponseModel.function returns false, call prepareFormatExceptionFunction.
      if (activeAlert) {
        if (baseResponseModel.function?.call(e) == false) {
          prepareFormatExceptionFunctionInstance?.call(e);
        }
      }

      // If activeWillAlwaysWork is true, call the willAlwaysWork function for FormatException.
      if (activeWillAlwaysWork) {
        willAlwaysWork?.call<FormatException>(e);
      }

      // Return the created BaseResponseModel object for FormatException.
      return baseResponseModel;
    } on Exception catch (e) {
      // If an error of type Exception occurs, this block will be executed.

      // Create an object to call the prepareExceptionFunction.
      bool Function(Exception)? prepareExceptionFunctionInstance;

      // If there is a context and the widget is in "mounted" state, prepare the function.
      if (context?.mounted ?? false) {
        // ignore: use_build_context_synchronously
        prepareExceptionFunctionInstance = prepareExceptionFunction(
          context: context!,
          generalFunction: generalFunction,
        );
      }

      // Create a BaseResponseModel object.
      NimphelosModel<T, Exception> baseResponseModel = NimphelosModel<T, Exception>(
        errorTypeEnum: ErrorTypeEnum.unhandled,
        success: false,
        function: getExceptionHandler(
              exceptionHandlers: exceptionHandlers,
            ) ??
            prepareExceptionFunctionInstance,
        exception: e,
      );

      // If activeAlert is true and baseResponseModel.function returns false, call prepareExceptionFunction.
      if (activeAlert) {
        if (baseResponseModel.function?.call(e) == false) {
          prepareExceptionFunctionInstance?.call(e);
        }
      }

      // If activeWillAlwaysWork is true, call the willAlwaysWork function.
      if (activeWillAlwaysWork) {
        willAlwaysWork?.call<Exception>(e);
      }

      // Return the created BaseResponseModel object.
      return baseResponseModel;
    }
  }
}

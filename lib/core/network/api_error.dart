import 'package:dio/dio.dart';
import '../helper/configs/instances.dart';
import 'laravel_error_model.dart';

import 'api_error_model.dart';

/// Helper class for converting [DioError] into readable formats
class ApiError {
  int? errorType = 0;
  ApiErrorModel? apiErrorModel;

  /// description of error generated this is similar to convention [Error.message]
  String? errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  /// sets value of class properties from [error]
  void _handleError(Object error) {
    if (error is DioError) {
      DioError dioError = error; // as DioError;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout";
          break;
        case DioErrorType.other:
          errorDescription = "Internet connection failed";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout";
          break;
        case DioErrorType.response:
          errorDescription = extractDescriptionFromResponse(dioError.response);
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Connection timeout";
          break;
      }
    } else {
      errorDescription = "Oops an error occurred, we are fixing it";
    }
  }

  /// Handle error responses from statusCode
  String extractDescriptionFromResponse(Response<dynamic>? response) {
    String message = "";
    errorType = response?.statusCode;
    log.e(response!.data);
    switch (errorType) {
      case 400:
      case 404:
        message = ApiErrorModel.fromJson(response.data).message!;
        break;
      case 401:
        message = ApiErrorModel.fromJson(response.data).message!;
        // eventBus.fire(UserLoggedInEvent(logUserOut: true, message: message));
        break;
      case 422:
        final _response = LaravelError.fromJson(response.data);
        if (_response.errors!.email!.isNotEmpty) {
          message = _response.errors!.email!.first;
        }
        if (_response.errors!.username!.isNotEmpty) {
          message = _response.errors!.username!.first;
        }
        if (_response.errors!.picture!.isNotEmpty) {
          message = _response.errors!.picture!.first;
        }
        if (_response.errors!.receiverPhoneNo!.isNotEmpty) {
          message = _response.errors!.receiverPhoneNo!.first;
        }
        break;
      default:
        message = 'An unknown error occured!';
    }
    return message;
  }

  @override
  String toString() => '$errorDescription';
}

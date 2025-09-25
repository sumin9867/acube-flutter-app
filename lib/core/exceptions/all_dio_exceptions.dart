import 'package:dio/dio.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/exceptions/app_exceptions.dart';
import 'package:gpspro/router/route_helper.dart';

AppException handleServerException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return ConnectionTimeout();
    case DioExceptionType.receiveTimeout:
      return ReceiveTimeout();
    case DioExceptionType.sendTimeout:
      return SendTimeout();
    case DioExceptionType.connectionError:
      if (e.error == NoInternetException) {
        return NoInternetException(message: 'Check your internet connection.');
      } else {
        return AppException(message: 'Server Exception Occured! ${e.error}');
      }
    case DioExceptionType.badResponse:
      final response = e.response;
      if (response == null) {
        return AppException(message: 'Bad response received with no details');
      }
      final int? statusCode = response.statusCode;
      final statusMessage = response.data?['response']?['message'] ?? response.statusMessage ?? 'Unknown error';
      switch (statusCode) {
        case 400:
          return BadRequestException(message: statusMessage);
        case 401:
          // check if logged in, then log out
          // if already logout, then might be error from login api,
          // // show message: context.locale.loginFailed
          if (locator.get<AuthCubit>().isAuthenticated) {
            locator.get<AuthCubit>().requestUnAuthentication();
            RouteHelper.pushReplaceSignInPage();
          }
          return UnauthorizedException(message: statusMessage);
        case 403:
          return ForbiddenException(message: statusMessage);
        case 404:
          return ResourceNotFoundException(message: statusMessage);
        case 405:
          return MethodNotAllowedException(message: statusMessage);
        case 409:
          return ConflictException(message: statusMessage);
        case 415:
          return UnsupportedMediaTypeException(message: statusMessage);
        case 500:
          return InternalServerErrorException(message: statusMessage);
        case 502:
          return BadGatewayException(message: statusMessage);
        default:
          return AppException(
            statusCode: statusCode,
            message: statusMessage,
          );
      }
    case DioExceptionType.unknown:
      if (e.toString().contains('HTTP 401 Unauthorized') && locator.get<AuthCubit>().isAuthenticated) {
        locator.get<AuthCubit>().requestUnAuthentication();
        RouteHelper.pushReplaceSignInPage();
        return UnauthorizedException(message: 'Unauthorized');
      } else {
        return const AppException();
      }
    default:
      return AppException(message: e.error.toString());
  }
}

extension AppExceptionConverter on AppException {
  AppException fromDioError(DioException e) => handleServerException(e);
}

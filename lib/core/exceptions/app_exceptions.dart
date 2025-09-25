class AppException implements Exception {
  final String message;
  final Map<String, dynamic>? errors;
  final int? statusCode;

  const AppException({
    this.message = 'An error occurred',
    this.errors,
    this.statusCode,
  });

  @override
  String toString() {
    return message;
  }
}

class UnknownException extends AppException {
  const UnknownException({String? message, dynamic error, super.statusCode})
      : super(message: message ?? 'Unknown Exception');
}

class ConnectionTimeout extends AppException {
  ConnectionTimeout() : super(message: 'Connection Timeout');
}

class ReceiveTimeout extends AppException {
  ReceiveTimeout() : super(message: 'Receive Timeout');
}

class SendTimeout extends AppException {
  SendTimeout() : super(message: 'Send Timeout');
}

class NoInternetException extends AppException {
  NoInternetException({String? message, dynamic error, int? statusCode})
      : super(message: message ?? 'No Internet Connection');
}

// Status Code Exceptions
class BadRequestException extends AppException {
  BadRequestException({String? message, dynamic error, super.statusCode})
      : super(
          message: message ?? 'Bad Request',
          errors: error,
        );
}

class UnauthorizedException extends AppException {
  UnauthorizedException({String? message, dynamic error, super.statusCode})
      : super(
          message: message ?? 'Unauthorized Access',
          errors: error,
        );
}

class ForbiddenException extends AppException {
  ForbiddenException({String? message, dynamic error, super.statusCode})
      : super(
          message: message ?? 'Forbidden Request',
          errors: error,
        );
}

class ResourceNotFoundException extends AppException {
  ResourceNotFoundException({String? message, dynamic error, super.statusCode})
      : super(
          message: message ?? 'Resource Not Found',
          errors: error,
        );
}

class MethodNotAllowedException extends AppException {
  MethodNotAllowedException({String? message, dynamic error, super.statusCode})
      : super(
          message: message ?? 'Method Not Allowed',
          errors: error,
        );
}

class ConflictException extends AppException {
  ConflictException({String? message, dynamic error, super.statusCode})
      : super(
          message: message ?? 'Conflict Error',
          errors: error,
        );
}

class UnsupportedMediaTypeException extends AppException {
  UnsupportedMediaTypeException({String? message, dynamic error, super.statusCode})
      : super(
          message: message ?? 'Unsupported Media Type',
          errors: error,
        );
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException({String? message, dynamic error, super.statusCode})
      : super(
          message: message ?? 'Internal Server Error',
          errors: error,
        );
}

class BadGatewayException extends AppException {
  BadGatewayException({String? message, dynamic error, super.statusCode})
      : super(
          message: message ?? 'Bad Gateway',
          errors: error,
        );
}

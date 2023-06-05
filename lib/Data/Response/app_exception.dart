class AppException implements Exception {
  final String? _message;
  final String? _prifix;

  AppException([this._message, this._prifix]);

  @override
  String toString() {
    return '$_prifix$_message';
  }
}

class FetchExceptionData extends AppException {
  FetchExceptionData([String? message])
      : super(message, '');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorized Request');
}

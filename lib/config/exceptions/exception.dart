class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class NointernetException extends AppException {
  NointernetException([String? message])
      : super(message, 'No internet connection');
}

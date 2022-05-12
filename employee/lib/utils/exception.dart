class HttpException implements Exception {
  final String message;
  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}

class HttpExceptionWithStatus implements Exception {
  final String message;
  final String status;
  final bool apiStatus;

  HttpExceptionWithStatus({
    required this.message,
    required this.status,
    required this.apiStatus,
  });
}

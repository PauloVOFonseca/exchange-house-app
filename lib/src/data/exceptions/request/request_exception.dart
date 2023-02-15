class RequestException {
  final int? statusCode;
  final String? message;

  RequestException({
    this.statusCode,
    this.message,
  });
}

class RequestFailure {
  final RequestFailureType requestFailureType;
  final String? message;

  RequestFailure({
    required this.requestFailureType,
    this.message,
  });
}

enum RequestFailureType {
  badRequest,
  unauthorized,
  notFound,
  tooManyRequests,
  serverError,
}

RequestFailureType convertToRequestFailure(int? code) {
  switch (code) {
    case 400:
      return RequestFailureType.badRequest;
    case 401:
      return RequestFailureType.unauthorized;
    case 404:
      return RequestFailureType.notFound;
    case 429:
      return RequestFailureType.tooManyRequests;
    default:
      return RequestFailureType.serverError;
  }
}

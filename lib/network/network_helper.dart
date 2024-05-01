import 'status_code.dart';

void handleExceptionCase(final int? statusCode, {final String? message}) {
  // Do something with response data
  switch (statusCode) {
    case StatusCode.tokenExpired:
      {
        break;
      }
    default:
      break;
  }
}

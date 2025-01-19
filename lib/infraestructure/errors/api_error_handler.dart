import 'dart:io';

class ApiErrorHandler {
  static String handleError(dynamic error) {
    if (error is SocketException) {
      return 'Network error: No internet connection.';
    } else if (error is HttpException) {
      return 'HTTP error: Failed to fetch data from the server.';
    } else if (error is FormatException) {
      return 'Data format error: Invalid response format.';
    } else {
      return 'Unexpected error: ${error.toString()}';
    }
  }
}

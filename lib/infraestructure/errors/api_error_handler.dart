import 'package:dartz/dartz.dart';
import 'dart:io';

class ApiErrorHandler {
  /// Maneja errores y retorna un mensaje descriptivo como un `Either`.
  static Either<String, T> handle<T>(dynamic error) {
    if (error is SocketException) {
      return Left('Network error: No internet connection.');
    } else if (error is HttpException) {
      return Left('HTTP error: Failed to fetch data from the server.');
    } else if (error is FormatException) {
      return Left('Data format error: Invalid response format.');
    } else {
      return Left('Unexpected error: ${error.toString()}');
    }
  }

  /// Evalúa una función asíncrona y encapsula el resultado en un `Either`.
  static Future<Either<String, T>> execute<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return Right(result);
    } catch (error) {
      return handle<T>(error);
    }
  }
}

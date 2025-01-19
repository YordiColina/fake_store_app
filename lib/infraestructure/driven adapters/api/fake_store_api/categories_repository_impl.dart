import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../domain/models/fake_product_categories/categories.dart';
import '../../../../domain/models/fake_product_categories/repository/categories_repository.dart';
import '../../../errors/api_error_handler.dart';
import '../../../helpers/log_printer/log_printer.dart';
import '../../../helpers/services/product_service/product_service.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRepositoryImpl();

  final ProductService _productService = ProductService.create();
  final LoggerService _loggerService = LoggerService();

  @override
  Future<Either<String, Categories>> getCategories() async {
    return await ApiErrorHandler.execute(() async {
      final response = await _productService.getCategories();
      if (response.isSuccessful) {
        final data = response.body as List<dynamic>;
        final Categories categories = Categories.fromJson(data);
        _loggerService.logInfo(
            'Categorías obtenidas correctamente\n ${response.statusCode}\n'
                ' ${categories.categories}');

        return categories;
      } else {
        throw HttpException(
            'API Error: ${response.statusCode} - ${response.error ??
                "Unknown error"}');
      }
    });
        }
        }





import 'package:dartz/dartz.dart';
import 'package:fake_store_app/domain/models/fake_product_categories/categories.dart';
import '../../../../domain/models/fake_product_categories/repository/categories_repository.dart';
import '../../../helpers/log_printer/log_printer.dart';
import '../../../helpers/services/product_service/product_service.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {

  CategoriesRepositoryImpl();

  final ProductService _productService = ProductService.create();
  final LoggerService _loggerService = LoggerService();

  @override
  Future<Either<String, Categories>> getCategories() async {
    try {
      final response = await _productService.getCategories();
      if (response.isSuccessful) {
        final dynamic data = response.body;
        final Categories categories = data;
        _loggerService.logInfo('Categorías obtenidas correctamente\n ${response.statusCode}\n'
            ' ${categories.categories}');

        return Right(categories);
      } else {
        _loggerService.logError('Error: ${response.statusCode} - ${response.error}');
        return Left('Error: ${response.statusCode} - ${response.error}');
      }
    } catch (e) {
      _loggerService.logError('Error: $e');
      return Left('Error: $e');
    }
  }
}
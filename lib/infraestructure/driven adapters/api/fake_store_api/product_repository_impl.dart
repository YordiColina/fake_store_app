import 'package:dartz/dartz.dart';
import 'package:fake_store_app/domain/models/fake_product_data/product.dart';
import 'package:fake_store_app/domain/models/fake_product_data/repository/product_repository.dart';
import '../../../errors/api_error_handler.dart';
import '../../../helpers/log_printer/log_printer.dart';
import '../../../helpers/services/product_service/product_service.dart';


class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl();

  final ProductService _productService = ProductService.create();
  final LoggerService _loggerService = LoggerService();

  @override
  Future<Either<String, List<Product>>> getAllProducts() async {
    try {
      final response = await _productService.getAllProducts();

      if (response.isSuccessful) {
        if (response.body is List<dynamic>) {
          final List<Product> products =
          (response.body as List).map((e) => Product.fromJson(e)).toList();

          for (var product in products) {
            _loggerService.logProductDetails(product, response.statusCode);
          }

          return Right(products);
        } else {
          final errorMessage = 'Unexpected response format: ${response.body}';
          _loggerService.logError(errorMessage);
          return Left(errorMessage);
        }
      } else {
        final errorMessage =
            'API Error: ${response.statusCode} - ${response.error ?? "Unknown error"}';
        _loggerService.logError(errorMessage);
        return Left(errorMessage);
      }
    } catch (e) {
      final errorMessage = ApiErrorHandler.handleError(e);
      _loggerService.logError(errorMessage);
      return Left(errorMessage);
    }
  }
}

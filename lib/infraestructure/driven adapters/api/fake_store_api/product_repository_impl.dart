import 'package:dartz/dartz.dart';
import 'package:fake_store_app/domain/models/fake_product_data/product.dart';
import 'package:fake_store_app/domain/models/fake_product_data/repository/product_repository.dart';
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
        final List<dynamic> data = response.body;
        final List<Product> products = data.map((e) => Product.fromJson(e)).toList();
        for (var product in products) {
         _loggerService.logProductDetails(product, response.statusCode);
      }
        return Right(products);
      } else {
        _loggerService.logError(Left('Error: ${response.statusCode} - ${response.error}').fold((l) => l, (r) => r));
        return Left('Error: ${response.statusCode} - ${response.error}');
      }
    } catch (e) {
      _loggerService.logError('Error: $e');
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, Product>> getProduct(int id) async {
    try {
      final response = await _productService.getProduct(id);
      if (response.isSuccessful) {
        final dynamic data = response.body;
        final Product product = Product.fromJson(data);
        _loggerService.logProductDetails(product, response.statusCode);
        return Right(product);
      } else {
        _loggerService.logError(Left('Error: ${response.statusCode} - ${response.error}').fold((l) => l, (r) => r));
        return Left('Error: ${response.statusCode} - ${response.error}');
      }
    } catch (e) {
      _loggerService.logError('Error: $e');
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, List<Product>>> getProductsByCategory(String category) async {
    try {
      final response = await _productService.getProductByCategory(category);
      if (response.isSuccessful) {
        final List<dynamic> data = response.body;
        final List<Product> products = data.map((e) => Product.fromJson(e)).toList();
        for (var product in products) {
          _loggerService.logProductDetails(product, response.statusCode);
        }
        return Right(products);
      } else {
        _loggerService.logError(Left('Error: ${response.statusCode} - ${response.error}').fold((l) => l, (r) => r));
        return Left('Error: ${response.statusCode} - ${response.error}');
      }
    } catch (e) {
      _loggerService.logError('Error: $e');
      return Left('Error: $e');
    }
  }
}

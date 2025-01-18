import 'package:dartz/dartz.dart';

import '../product.dart';

abstract class ProductRepository {
  Future<Either<String, List<Product>>> getAllProducts();
  Future<Either<String, Product>> getProduct(int id);
  Future<Either<String, List<Product>>> getProductsByCategory(String category);
}
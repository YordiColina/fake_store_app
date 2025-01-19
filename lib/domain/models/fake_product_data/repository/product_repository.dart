import 'package:dartz/dartz.dart';

import '../product.dart';

abstract class ProductRepository {
  Future<Either<String, List<Product>>> getAllProducts();
}
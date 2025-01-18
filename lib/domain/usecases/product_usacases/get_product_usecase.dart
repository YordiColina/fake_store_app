import 'package:dartz/dartz.dart';

import '../../models/fake_product_data/product.dart';
import '../../models/fake_product_data/repository/product_repository.dart';

class GetProductUseCase {
  final ProductRepository _productRepository;

  GetProductUseCase(this._productRepository);

  Future<Either<String, Product>> execute(int id) {
    return _productRepository.getProduct(id);
  }
}
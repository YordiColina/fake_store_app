import 'package:dartz/dartz.dart';

import '../../models/fake_product_data/product.dart';
import '../../models/fake_product_data/repository/product_repository.dart';

class GetAllProductsUseCase {
  final ProductRepository _productRepository;

  GetAllProductsUseCase(this._productRepository);

  Future<Either<String, List<Product>>> execute() {
    return _productRepository.getAllProducts();
  }
}
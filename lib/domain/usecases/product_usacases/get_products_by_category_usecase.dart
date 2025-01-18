import 'package:dartz/dartz.dart';

import '../../models/fake_product_data/product.dart';
import '../../models/fake_product_data/repository/product_repository.dart';

class GetProductsByCategoryUseCase {
  final ProductRepository _productRepository;

  GetProductsByCategoryUseCase (this._productRepository);

  Future<Either<String, List<Product>>> execute(String category) {
    return _productRepository.getProductsByCategory(category);
  }
}
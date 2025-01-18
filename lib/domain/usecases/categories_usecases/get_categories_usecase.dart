import 'package:dartz/dartz.dart';

import '../../models/fake_product_categories/categories.dart';
import '../../models/fake_product_categories/repository/categories_repository.dart';

class GetCategoriesUseCase {
  final CategoriesRepository _categoriesRepository;

  GetCategoriesUseCase(this._categoriesRepository);

  Future<Either<String, Categories>> execute() {
    return _categoriesRepository.getCategories();
  }
}
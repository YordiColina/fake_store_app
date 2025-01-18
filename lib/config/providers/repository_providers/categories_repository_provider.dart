import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/fake_product_categories/repository/categories_repository.dart';
import '../../../infraestructure/driven adapters/api/fake_store_api/categories_repository_impl.dart';

final categoriesRepositoryProvider = Provider<CategoriesRepository>(
      (ref) => CategoriesRepositoryImpl(),
);

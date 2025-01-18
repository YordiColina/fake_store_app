import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/fake_product_data/repository/product_repository.dart';
import '../../../infraestructure/driven adapters/api/fake_store_api/product_repository_impl.dart';

final productRepositoryProvider = Provider<ProductRepository>(
      (ref) => ProductRepositoryImpl(),
);
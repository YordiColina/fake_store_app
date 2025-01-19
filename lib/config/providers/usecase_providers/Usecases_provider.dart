import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/cart_usecases/get_cart_usecase.dart';
import '../../../domain/usecases/categories_usecases/get_categories_usecase.dart';
import '../../../domain/usecases/product_usacases/get_all_products_usecase.dart';
import '../repository_providers/cart_repository_provider.dart';
import '../repository_providers/categories_repository_provider.dart';
import '../repository_providers/product_repository_provider.dart';

final getAllProductsUseCaseProvider = Provider<GetAllProductsUseCase>(
      (ref) => GetAllProductsUseCase(ref.read(productRepositoryProvider)),
);

final getCategoriesUseCaseProvider = Provider<GetCategoriesUseCase>(
      (ref) => GetCategoriesUseCase(ref.read(categoriesRepositoryProvider)),
);

final getCartUseCaseProvider = Provider<GetCartUseCase>(
      (ref) => GetCartUseCase(ref.read(cartRepositoryProvider)),
);
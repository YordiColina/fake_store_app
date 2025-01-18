import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/models/fake_product_data/product.dart';
import '../../../domain/usecases/product_usacases/get_products_by_category_usecase.dart';
import '../../providers/usecase_providers/Usecases_provider.dart';

class ProductsByCategoryState {
  const ProductsByCategoryState();
}

class ProductsByCategoryLoading extends ProductsByCategoryState {}

class ProductsByCategoryLoaded extends ProductsByCategoryState {
  final List<Product> products;
  ProductsByCategoryLoaded(this.products);
}

class ProductsByCategoryError extends ProductsByCategoryState {
  final String message;
  ProductsByCategoryError(this.message);
}

class ProductsByCategoryNotifier extends StateNotifier<ProductsByCategoryState> {
  final GetProductsByCategoryUseCase getProductsByCategoryUseCase;

  ProductsByCategoryNotifier(this.getProductsByCategoryUseCase)
      : super(ProductsByCategoryLoading());

  Future<void> getProductsForCategory(String category) async {
    state = ProductsByCategoryLoading();
    try {
      final result = await getProductsByCategoryUseCase.execute(category);
      state = result.fold(
            (failure) => ProductsByCategoryError(failure),
            (products) => ProductsByCategoryLoaded(products),
      );
    } catch (e) {
      state = ProductsByCategoryError('Error al cargar los productos por categoría: $e');
    }
  }
}



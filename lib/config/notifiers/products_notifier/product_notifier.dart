import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/fake_product_data/product.dart';
import '../../../domain/usecases/product_usacases/get_product_usecase.dart';


class ProductState {
  const ProductState();
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Product product;
  ProductLoaded(this.product);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}

class ProductNotifier extends StateNotifier<ProductState> {
  final GetProductUseCase getProductUseCase;

  ProductNotifier(this.getProductUseCase)
      : super(ProductLoading());

  Future<void> getProduct(int id) async {
    state = ProductLoading();
    try {
      final result = await getProductUseCase.execute(id);
      state = result.fold(
            (failure) => ProductError(failure),
            (product) => ProductLoaded(product),
      );
    } catch (e) {
      state = ProductError('Error al cargar el producto : $e');
    }
  }
}



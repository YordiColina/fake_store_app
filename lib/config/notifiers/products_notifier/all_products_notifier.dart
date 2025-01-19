import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/fake_product_data/product.dart';
import '../../../domain/usecases/product_usacases/get_all_products_usecase.dart';

class AllProductsState {
  const AllProductsState();
}

class AllProductsLoading extends AllProductsState {}

class AllProductsLoaded extends AllProductsState {
  final List<Product> products;
  AllProductsLoaded(this.products);
}

class AllProductsError extends AllProductsState {
  final String message;
  AllProductsError(this.message);
}

class AllProductsNotifier extends StateNotifier<AllProductsState> {
  final GetAllProductsUseCase getAllProductsUseCase;

  AllProductsNotifier(this.getAllProductsUseCase) : super(AllProductsLoading()) {
    _getAllProducts();
  }

  Future<void> _getAllProducts() async {
    try {
      final products = await getAllProductsUseCase.execute();
      state = products.fold(
            (failure) => AllProductsError(failure),
            (data) => AllProductsLoaded(data),
      );
    } catch (e) {
      state = AllProductsError('Error al cargar los productos: $e');
    }
  }
}



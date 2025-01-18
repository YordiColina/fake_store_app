import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/fake_cart_data/cart.dart';
import '../../../domain/usecases/cart_usecases/get_cart_usecase.dart';

class CartState {
  const CartState();
}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final Cart cart;
  CartLoaded(this.cart);
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}

class CartNotifier extends StateNotifier<CartState> {
  final GetCartUseCase getCartUseCase;

  CartNotifier(this.getCartUseCase)
      : super(CartLoading());

  Future<void> getCart(int id) async {
    state = CartLoading();
    try {
      final result = await getCartUseCase.execute(id);
      state = result.fold(
            (failure) => CartError(failure),
            (cart) => CartLoaded(cart),
      );
    } catch (e) {
      state = CartError('Error al cargar el carrito de compras : $e');
    }
  }
}



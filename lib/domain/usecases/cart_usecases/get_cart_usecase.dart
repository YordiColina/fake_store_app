import 'package:dartz/dartz.dart';

import '../../models/fake_cart_data/cart.dart';
import '../../models/fake_cart_data/repository/cart_repository.dart';


class GetCartUseCase {
  final CartRepository _cartRepository;

  GetCartUseCase(this._cartRepository);

  Future<Either<String, Cart>> execute(int cartId) {
    return _cartRepository.getCart(cartId);
  }
}
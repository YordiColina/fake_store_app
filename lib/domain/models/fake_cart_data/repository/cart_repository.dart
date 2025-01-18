import 'package:dartz/dartz.dart';

import '../cart.dart';

abstract class CartRepository {
  Future<Either<String, Cart>> getCart(int cartId);

}
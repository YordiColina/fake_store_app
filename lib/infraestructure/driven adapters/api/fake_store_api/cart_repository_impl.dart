import 'package:dartz/dartz.dart';
import 'package:fake_store_app/domain/models/fake_cart_data/cart.dart';
import 'package:fake_store_app/domain/models/fake_cart_data/repository/cart_repository.dart';
import '../../../helpers/log_printer/log_printer.dart';
import '../../../helpers/services/cart_service/cart_service.dart';


class CartRepositoryImpl implements CartRepository {

  CartRepositoryImpl();

  final CartService _cartService = CartService.create();
  final LoggerService _loggerService = LoggerService();

  @override
  Future<Either<String, Cart>> getCart(int cartId) async {
    try {
      final response = await _cartService.getCart(cartId);
      if (response.isSuccessful) {
        final dynamic data = response.body;
        final Cart cart = data;
        _loggerService.logInfo('Cart obtained correctly\n ${response.statusCode}\n'
            ' ${cart.products}');
        return Right(cart);
      } else {
        _loggerService.logError('Error: ${response.statusCode} - ${response.error}');
        return Left('Error: ${response.statusCode} - ${response.error}');
      }
    } catch (e) {
      _loggerService.logError('Error: $e');
      return Left('Error: $e');
    }
  }
  }



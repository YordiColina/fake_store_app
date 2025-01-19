import 'package:dartz/dartz.dart';
import 'package:fake_store_app/domain/models/fake_cart_data/cart.dart';
import 'package:fake_store_app/domain/models/fake_cart_data/repository/cart_repository.dart';
import '../../../errors/api_error_handler.dart';
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
        final data = response.body as Map<String, dynamic>;
        final Cart cart = Cart.fromJson(data);
        for(var carts in cart.products) {
          _loggerService.logInfo('Carrito  obtenido correctamente\n ${response.statusCode}\n'
              'carrito nro ${cart.id}\n'
              'id de producto ${carts.productId}\n'
              'cantidad de ese producto ${carts.quantity}');
        }
        return Right(cart);
      } else {
        final errorMessage =
            'API Error: ${response.statusCode} - ${response.error ?? "Unknown error"}';
        _loggerService.logError(errorMessage);
        return Left(errorMessage);
      }
    } catch (e) {
      final errorMessage = ApiErrorHandler.handleError(e);
      _loggerService.logError(errorMessage);
      return Left(errorMessage);
    }
  }
  }



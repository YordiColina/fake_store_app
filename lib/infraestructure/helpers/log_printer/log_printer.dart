import 'package:logger/logger.dart';
import 'package:fake_store_app/domain/models/fake_product_data/product.dart';

class LoggerService {
  final Logger _logger;

  LoggerService()
      : _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  void logProductDetails(Product product, int statusCode) {
    _logger.i(
      '''
--- Producto ---
Status: $statusCode
Título: ${product.title}
Descripción: ${product.description}
Precio: \$${product.price}
''',
    );
  }

  void logError(String message) {
    _logger.e('Error: $message');
  }

  void logInfo(String message) {
    _logger.i(message);
  }

  void logWarning(String message) {
    _logger.w(message);
  }
}
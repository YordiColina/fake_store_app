import 'package:chopper/chopper.dart';


part 'cart_service.chopper.dart';

@ChopperApi()
abstract class CartService extends ChopperService {
  @Get(path: '/carts/{id}')
  Future<Response> getCart(@Path('id') int id);

  static CartService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://fakestoreapi.com'),
      services: [
        _$CartService(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: JsonConverter(),
    );
    return _$CartService(client);
  }
}



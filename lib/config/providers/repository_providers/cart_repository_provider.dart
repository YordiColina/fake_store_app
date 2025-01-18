import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/fake_cart_data/repository/cart_repository.dart';
import '../../../infraestructure/driven adapters/api/fake_store_api/cart_repository_impl.dart';

final cartRepositoryProvider = Provider<CartRepository>(
      (ref) => CartRepositoryImpl(),
);
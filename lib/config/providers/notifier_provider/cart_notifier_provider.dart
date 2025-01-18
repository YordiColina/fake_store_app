import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../notifiers/cart_notifier/cart_notifier.dart';
import '../usecase_providers/Usecases_provider.dart';

final cartNotifierProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  final getCartUseCase = ref.watch(getCartUseCaseProvider);

  return CartNotifier(
      getCartUseCase
  );
});

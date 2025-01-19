import 'package:fake_store_app/config/notifiers/products_notifier/all_products_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../usecase_providers/Usecases_provider.dart';



final allProductsNotifierProvider =
StateNotifierProvider<AllProductsNotifier, AllProductsState>((ref) {
  final getAllProductsUseCase = ref.watch(getAllProductsUseCaseProvider);

  return AllProductsNotifier(getAllProductsUseCase);
});

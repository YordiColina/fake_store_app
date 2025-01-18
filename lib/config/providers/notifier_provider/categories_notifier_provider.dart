import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../notifiers/categories_notifier/categories_notifier.dart';
import '../usecase_providers/Usecases_provider.dart';

final categoriesNotifierProvider = StateNotifierProvider<CategoriesNotifier, CategoriesState>((ref) {
  final getCategoriesUseCase = ref.watch(getCategoriesUseCaseProvider);

  return CategoriesNotifier(
      getCategoriesUseCase
  );
});

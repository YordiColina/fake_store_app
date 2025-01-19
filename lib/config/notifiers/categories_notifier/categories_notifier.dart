import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/fake_product_categories/categories.dart';
import '../../../domain/usecases/categories_usecases/get_categories_usecase.dart';

class CategoriesState {
  const CategoriesState();
}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final Categories categories;
  CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoriesState {
  final String message;
  CategoriesError(this.message);
}

class CategoriesNotifier extends StateNotifier<CategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoriesNotifier(this.getCategoriesUseCase) : super(CategoriesLoading()) {
    getCategories();
  }

  Future<void> getCategories() async {
    state = CategoriesLoading();
    try {
      final result = await getCategoriesUseCase.execute();
      state = result.fold(
            (failure) => CategoriesError(failure),
            (categories) => CategoriesLoaded(categories),
      );
    } catch (e) {
      state = CategoriesError('Error al cargar las categorías: $e');
    }
  }
}
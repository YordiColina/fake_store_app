import 'package:dartz/dartz.dart';
import 'package:fake_store_app/config/notifiers/products_notifier/products_by_category_notifier.dart';
import 'package:fake_store_app/domain/models/fake_product_data/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../usecase_providers/Usecases_provider.dart';

final productsByCategoryNotifierProvider = StateNotifierProvider<ProductsByCategoryNotifier, ProductsByCategoryState>(
      (ref) => ProductsByCategoryNotifier(ref.watch(getProductsByCategoryUseCaseProvider)),
);


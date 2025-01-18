import 'package:dartz/dartz.dart';
import 'package:fake_store_app/domain/models/fake_product_data/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../notifiers/products_notifier/product_notifier.dart';
import '../usecase_providers/Usecases_provider.dart';

final allProductsNotifierProvider = StateNotifierProvider<ProductNotifier, ProductState>(
      (ref) => ProductNotifier(ref.watch(getProductUseCaseProvider)),
);

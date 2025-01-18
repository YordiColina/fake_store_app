import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/notifiers/products_notifier/all_products_notifier.dart';
import '../common/card_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(allProductsNotifierProvider);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                child: Icon(Icons.home_outlined,
                    size: 50, color: Color.fromRGBO(158, 123, 187, 1.0)),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: state is AllProductsLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state is AllProductsError
                    ? Center(
                  child: Text(
                    'Error: ${state.message}',
                    style: const TextStyle(color: Colors.red),
                  ),
                )
                    : state is AllProductsLoaded
                    ? ListView.separated(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return CardWidget(product: product);
                  },
                  separatorBuilder: (context, index) =>
                  const SizedBox(height: 20),
                )
                    : const SizedBox.shrink(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

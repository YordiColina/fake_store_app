import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/notifiers/cart_notifier/cart_notifier.dart';
import '../../config/providers/notifier_provider/cart_notifier_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(cartNotifierProvider.notifier).getCart(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cartNotifierProvider);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(158, 123, 187, 1.0),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: state is CartLoading
            ? const Center(child: CircularProgressIndicator())
            : state is CartError
            ? Center(
          child: Text(
            'Error: ${state.message}',
            style: const TextStyle(color: Colors.red),
          ),
        )
            : state is CartLoaded
            ? Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
            color: const Color.fromRGBO(240, 240, 240, 1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color.fromRGBO(158, 123, 187, 1.0),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ],
          ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                  Text(
                    "Total items in cart: ${state.cart.products.length}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "product ID: ${state.cart.products.first.productId}",
                    style: const TextStyle(fontSize: 16),
                  ),
                            ],
                          ),
                ),
              ),
            )
            : const SizedBox.shrink(),
      ),
    );
  }
}

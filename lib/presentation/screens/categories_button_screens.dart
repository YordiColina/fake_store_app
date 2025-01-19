import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/notifiers/categories_notifier/categories_notifier.dart';
import '../../config/providers/notifier_provider/categories_notifier_provider.dart';


class CategoryButton extends ConsumerWidget {
  const CategoryButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categoriesNotifierProvider);

    return state is CategoriesLoading
        ? const Center(child: CircularProgressIndicator())
        : state is CategoriesError
        ? Center(
      child: Text(
        state.message,
        style: const TextStyle(color: Colors.red),
      ),
    )
        : state is CategoriesLoaded
        ? ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: state.categories.categories.length,
      itemBuilder: (context, index) {
        final category = state.categories.categories[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:  const Color.fromRGBO(158, 123, 187, 1.0),
            ) ,
            child: Text(category, style: TextStyle(
              color: Colors.white
            ),),
          ),
        );
      },
    )
        : const SizedBox.shrink();
  }
}

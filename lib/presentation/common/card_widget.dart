import 'package:flutter/material.dart';


import '../../domain/models/fake_product_data/product.dart';

class CardWidget extends StatefulWidget {
  final Product product;
  const CardWidget({super.key, required this.product});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.product.title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(51, 51, 51, 1)
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price:\n${widget.product.price}\$",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(102, 102, 102, 1)
                  ),
                ),
                Center(
                  child: SizedBox(
                     width: 155,
                     height: 100,
                      child: Image.network(widget.product.image))
                ),
                Text(
                  "Category:\n${widget.product.category}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(102, 102, 102, 1)
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                widget.product.description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(102, 102, 102, 1)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

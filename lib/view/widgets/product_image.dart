import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  final String url;
  const ProductImageWidget({
    super.key, required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
              fit: BoxFit.cover,
              url,
              ),
        ),
      ),
    );
  }
}

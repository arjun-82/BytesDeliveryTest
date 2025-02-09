import 'package:category_product_list/utils/index.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl,
      productName,
      offerPersentage,
      offerPrice,
      originalPrice,
      quantity;
  final String? use;
  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.offerPersentage,
    required this.offerPrice,
    required this.originalPrice,
    required this.quantity,
    this.use,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ProductImageWidget(
                url: imageUrl,
              ),
              const Positioned(bottom: 0, right: 0, child: AddButton())
            ],
          ),
          Wrap(spacing: 30, children: [
            CustomText(
              size: 11,
              weight: FontWeight.bold,
              data: "$quantity g",
              color: Colors.deepPurple,
            ),
            CustomText(
              size: 11,
              weight: FontWeight.bold,
              data: use ?? "Energy Booster",
              color: Colors.deepPurple,
            ),
          ]),
          CustomText(data: productName, size: 18, weight: FontWeight.bold),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                size: 12,
                Icons.timelapse_rounded,
                color: Colors.green,
              ),
              CustomText(
                data: "8 MINS",
                size: 13,
                color: Colors.green,
              )
            ],
          ),
          CustomText(
            data: "$offerPersentage OFF",
            size: 13,
            color: Colors.blue,
            weight: FontWeight.w700,
          ),
          Row(
            children: [
              CustomText(
                data: "₹ $offerPrice",
                size: 16,
                weight: FontWeight.bold,
              ),
              const SizedBox(
                width: 5,
              ),
              const CustomText(
                data: "MRP",
                size: 12,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomText(
                data: "₹ $originalPrice",
                size: 12,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 20,
            decoration: BoxDecoration(
                color: Colors.green.withOpacity(.2),
                borderRadius: BorderRadius.circular(5)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  data: "See 19 recipies",
                  size: 10,
                  color: Colors.green,
                  weight: FontWeight.bold,
                ),
                Icon(
                  Icons.play_arrow_sharp,
                  color: Colors.green,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

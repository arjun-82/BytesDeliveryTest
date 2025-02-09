import 'package:category_product_list/utils/index.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListState = ref.watch(productListControllerProvider);
    final productListController =
        ref.read(productListControllerProvider.notifier);
    String? selectedCategoryId = ref.watch(selectedCategoryProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade50,
        title: const Text(
          "Vegetables & Fruits",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Row(
        children: [
          Expanded(
  flex: 2,
  child: Material(
    elevation: 5,
    child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: productListState.categories.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final category = productListState.categories[index];
          final isSelected = selectedCategoryId == category.id;
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () async {
                ref.read(selectedCategoryProvider.notifier).state = category.id;
                await productListController.fetchProducts(categoryId: category.id);
              },
              child: Column(
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? Colors.blue
                          : Colors.blueGrey.shade100.withOpacity(0.5),
                    ),
                    child: category.image != null
                        ? Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(category.image!),
                              ),
                            ),
                          )
                        : const Icon(Icons.image_not_supported),
                  ),
                  CustomText(data: category.title.toString(), size: 10)
                ],
              ),
            ),
          );
        },
      ),
    ),
  ),
),

          Expanded(
            flex: 8,
            child: productListState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : productListState.hasError
                    ? Center(
                        child: Text('Error: ${productListState.errorMessage}'))
                    : productListState.products.isEmpty
                        ? const Center(child: Text('No products available'))
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              mainAxisExtent: 290,
                            ),
                            itemCount: productListState.products.length,
                            itemBuilder: (context, index) {
                              final product = productListState.products[index];

                              return ProductCard(
                                imageUrl: (product.image?.isNotEmpty ?? false)
                                    ? product.image!.first.url.toString()
                                    : "https://via.placeholder.com/150",
                                productName: product.title.toString(),
                                offerPersentage:
                                    (product.discounts?.isNotEmpty ?? false)
                                        ? product.discounts!.first.toString()
                                        : "0%",
                                offerPrice:
                                    product.discountPrice?.toString() ?? "0",
                                originalPrice: product.price?.toString() ?? "0",
                                quantity: product.maxQuantity!.toString(),
                                use: product.type.toString(),
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }
}

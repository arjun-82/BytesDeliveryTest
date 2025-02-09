import 'package:category_product_list/utils/index.dart';

class ProductListController extends StateNotifier<ProductListState> {
  final Ref ref;
  final Dio _dio = Dio();
  String? selectedCategoryId;
  int page = 1;
  static const int value = 123;

  ProductListController(this.ref, {this.selectedCategoryId})
      : super(ProductListState.initial()) {
    fetchProducts();
  }
  Future<void> fetchProducts({String? categoryId}) async {
    state = state.copyWith(isLoading: true, hasError: false, errorMessage: '');

    selectedCategoryId = categoryId;
    page = 1; // Reset to the first page when loading a new category

    final String apiUrl =
        "https://alpha.bytesdelivery.com/api/v3/product/category-products/$value/$selectedCategoryId/$page";

    try {
      final response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        final GroceryModel groceryModel = GroceryModel.fromJson(response.data);

        if (groceryModel.success == true && groceryModel.data != null) {
          state = state.copyWith(
            isLoading: false,
            products: groceryModel.data!.products ?? [],
            // Ensure categories are not reset
            categories: state.categories.isNotEmpty
                ? state.categories
                : groceryModel.data!.categories ?? [],
            selectedCategoryId: selectedCategoryId,
          );
        } else {
          state = state.copyWith(
            isLoading: false,
            hasError: true,
            errorMessage: groceryModel.msg ?? 'Failed to load data.',
          );
        }
      } else {
        state = state.copyWith(
          isLoading: false,
          hasError: true,
          errorMessage:
              'Failed to load products. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: 'An error occurred: $e',
      );
    }
  }
}

class ProductListState {
  final List<Product> products;
  final List<Category> categories;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;
  final String? selectedCategoryId;

  ProductListState({
    required this.products,
    required this.categories,
    required this.isLoading,
    required this.hasError,
    required this.errorMessage,
    this.selectedCategoryId,
  });

  factory ProductListState.initial() {
    return ProductListState(
      products: [],
      categories: [],
      isLoading: true,
      hasError: false,
      errorMessage: '',
      selectedCategoryId: null,
    );
  }

  ProductListState copyWith({
    List<Product>? products,
    List<Category>? categories,
    bool? isLoading,
    bool? hasError,
    String? errorMessage,
    String? selectedCategoryId,
  }) {
    return ProductListState(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
    );
  }
}

// Provider
final productListControllerProvider =
    StateNotifierProvider<ProductListController, ProductListState>((ref) {
  return ProductListController(ref);
});
final selectedCategoryProvider = StateProvider<String?>((ref) {
  final productListState = ref.watch(productListControllerProvider);
  return productListState.selectedCategoryId;
});

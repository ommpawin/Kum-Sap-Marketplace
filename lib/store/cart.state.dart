import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kumsap_marketplace/store/product.state.dart';
import 'package:kumsap_marketplace/widgets/core/ksToast.dart';

part 'cart.state.freezed.dart';

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    @Default([]) List cartProductIds,
    @Default([]) List cartProductNodes,
    @Default(0) int cartProductCount,
    @Default(0.0) double total,
  }) = _CartState;
}

class CartStateNotifier extends StateNotifier<CartState> {
  // Use productState for get all product is already loaded
  ProductState productState;

  CartStateNotifier({required this.productState}) : super(const CartState());

  void cleanState() {
    state = state.copyWith(
      cartProductIds: [],
      cartProductNodes: [],
      cartProductCount: 0,
      total: 0.0,
    );
  }

  Future<void> addProductToCart(int id) async {
    // Check Product id contains in cart
    if (!state.cartProductIds.contains(id)) {
      // Find Index of Product Array in All Product List by Id
      int productIndex =
          productState.productNodes!.indexWhere((e) => e['id'] == id);

      // Duplicate data in state
      List productIdsList = state.cartProductIds.toList();
      List productNodesList = state.cartProductNodes.toList();
      double total = state.total.toDouble();
      int productCount = productNodesList.length;
      Map productData = productState.productNodes![productIndex];

      // Add id and product item to temp array
      productIdsList.add(id);
      productNodesList.add(productData);
      productNodesList[productCount]['itemCount'] = 1;

      // Set state with new data
      state = state.copyWith(
        cartProductIds: productIdsList,
        cartProductNodes: productNodesList,
        cartProductCount: productCount + 1,
        total: (total += productData['price'] ?? 0).toDouble(),
      );

      // Show Toast dialog
      KsToast.show(
          message: 'This Product placed in Cart', type: ToastType.SUCCESS);
    } else {
      increaseProductItemCount(id);
      // Show Toast dialog
      KsToast.show(
          message: 'This Product placed more in Cart', type: ToastType.SUCCESS);
    }
  }

  Future<void> increaseProductItemCount(int id) async {
    // Duplicate data in state
    List productNodesList = state.cartProductNodes.toList();
    double total = state.total.toDouble();

    // Find Index of Product Id
    int productIndex = state.cartProductNodes.indexWhere((e) => e['id'] == id);
    Map productData = state.cartProductNodes[productIndex];

    // Increase count of Product
    productNodesList[productIndex]['itemCount']++;

    // Set state
    state = state.copyWith(
      cartProductNodes: productNodesList,
      total: (total += productData['price'] ?? 0).toDouble(),
    );
  }

  Future<void> decreaseProductItemCount(int id) async {
    // Duplicate data in state
    List productNodesList = state.cartProductNodes.toList();
    double total = state.total.toDouble();

    // Find Index of Product Id
    int productIndex = state.cartProductNodes.indexWhere((e) => e['id'] == id);
    Map productData = state.cartProductNodes[productIndex];

    // Increase count of Product
    productNodesList[productIndex]['itemCount']--;

    // Set state
    state = state.copyWith(
      cartProductNodes: productNodesList,
      total: (total -= productData['price'] ?? 0).toDouble(),
    );
  }

  Future<void> removeProductToCart(int id) async {
    // Find Index of Product Id
    int productIndex = state.cartProductNodes.indexWhere((e) => e['id'] == id);

    // Duplicate data in state
    List productIdsList = state.cartProductIds.toList();
    List productNodesList = state.cartProductNodes.toList();
    Map productData = productNodesList[productIndex];

    // Calculate minus price
    double price =
        productData['price'] != null ? productData['price'].toDouble() : 0.0;
    double sumTotal =
        (state.total.toDouble() - (productData['itemCount'].toInt() * price))
            .toDouble();

    // Remove product object in temp array
    productIdsList.removeWhere((e) => e == id);
    productNodesList.removeAt(productIndex);

    // Set state with new data
    state = state.copyWith(
      cartProductIds: productIdsList,
      cartProductNodes: productNodesList,
      cartProductCount: productNodesList.length,
      total: sumTotal,
    );
  }

  int getProductItemCount(int id) {
    int productIndex = state.cartProductNodes.indexWhere((e) => e['id'] == id);
    if (productIndex > -1) {
      return state.cartProductNodes[productIndex]['itemCount'];
    } else {
      return 0;
    }
  }
}

final cartStateProvider = StateNotifierProvider<CartStateNotifier, CartState>(
  (ref) => CartStateNotifier(productState: ref.watch(productStateProvider)),
);

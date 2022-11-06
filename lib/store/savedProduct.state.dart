import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kumsap_marketplace/store/product.state.dart';
import 'package:kumsap_marketplace/widgets/core/ksToast.dart';

part 'savedProduct.state.freezed.dart';

@freezed
class SavedProductState with _$SavedProductState {
  const SavedProductState._();

  const factory SavedProductState({
    @Default([]) List savedProductIds,
    @Default([]) List savedProductNodes,
    @Default(0) int savedProductCount,
  }) = _SavedProductState;
}

class SavedProductStateNotifier extends StateNotifier<SavedProductState> {
  // Use productState for get all product is already loaded
  ProductState productState;

  SavedProductStateNotifier({required this.productState})
      : super(const SavedProductState());

  // Function for toggle product saved
  Future<void> setSavedProduct(int id) async {
    // Check if this Id Product is Saved?
    if (!state.savedProductIds.contains(id)) {
      _addSavedProduct(id);
    } else {
      _removeSavedProduct(id);
    }
  }

  void cleanState() {
    state = state.copyWith(
      savedProductIds: [],
      savedProductNodes: [],
      savedProductCount: 0,
    );
  }

  Future<void> _addSavedProduct(int id) async {
    // Find Index of Product Array in All Product List by Id
    int productIndex =
        productState.productNodes!.indexWhere((e) => e['id'] == id);

    // Duplicate data in state because the value cannot be directly updated
    List productIdsList = state.savedProductIds.toList();
    List productNodesList = state.savedProductNodes.toList();

    // Add id and product item to temp array
    productIdsList.add(id);
    productNodesList.add(productState.productNodes![productIndex]);

    // Set state with new data
    state = state.copyWith(
      savedProductIds: productIdsList,
      savedProductNodes: productNodesList,
      savedProductCount: productNodesList.length,
    );

    // Show Toast dialog
    KsToast.show(message: 'Saved this Product');
  }

  Future<void> _removeSavedProduct(int id) async {
    // Find Index of Product Array in Saved Product List by Id
    int productIndex = state.savedProductNodes.indexWhere((e) => e['id'] == id);

    // Duplicate data in state
    List productIdsList = state.savedProductIds.toList();
    List productNodesList = state.savedProductNodes.toList();

    // Remove product object in temp array
    productIdsList.removeWhere((e) => e == id);
    productNodesList.removeAt(productIndex);

    // Set state with new data
    state = state.copyWith(
      savedProductIds: productIdsList,
      savedProductNodes: productNodesList,
      savedProductCount: productNodesList.length,
    );

    // Show Toast dialog
    KsToast.show(message: 'Unsaved this Product');
  }
}

final savedProductStateProvider =
    StateNotifierProvider<SavedProductStateNotifier, SavedProductState>(
  (ref) =>
      SavedProductStateNotifier(productState: ref.watch(productStateProvider)),
);

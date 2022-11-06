import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'product.state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const ProductState._();

  const factory ProductState({
    @Default(null) List? productNodes,
    @Default(null) int? productCount,
    @Default(false) bool isStateError,
  }) = _ProductState;
}

class ProductStateNotifier extends StateNotifier<ProductState> {
  ProductStateNotifier() : super(const ProductState());

  // Simulate Fetch Product data from API
  Future<void> fetchData() async {
    // Fetch Data from Json asset and convert string json to Native data type
    String data = await rootBundle.loadString('assets/mock/product.json');
    Map<String, dynamic> mappedJson = jsonDecode(data);

    // Convert Array(List) to Map (product[index][id] is Key of Map object)
    // Map productMap = {
    //   for (var e in mappedJson['product_items'])
    //     e['id'].toString(): {
    //       'name': e['name'],
    //       'image_url': e['image_url'],
    //       'price': double.parse(e['price'].toString()),
    //     }
    // };

    // #I hope that you will be interested in the app logo
    await Future.delayed(const Duration(seconds: 5));

    // Make sure Product data is not Null or Empty
    try {
      // # On product not used if else
      if (mappedJson.isNotEmpty && mappedJson['product_items'].isNotEmpty) {
        // Set all product data to State of Product and set count
        state = state.copyWith(
          productNodes: mappedJson['product_items'].toList(),
          productCount: mappedJson['product_items'].length,
          isStateError: false,
        );
      } else {
        // Set error state
        state = state.copyWith(isStateError: true);
      }
    } catch (_) {
      // Set error state
      state = state.copyWith(isStateError: true);
    }
  }
}

final productStateProvider =
    StateNotifierProvider<ProductStateNotifier, ProductState>(
  (ref) => ProductStateNotifier(),
);

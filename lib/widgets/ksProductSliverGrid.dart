import 'package:flutter/material.dart';
import 'package:kumsap_marketplace/widgets/ksProductCard.dart';

class KsProductSliverGrid extends StatelessWidget {
  final List productNodes;
  final int productCount;
  final List savedProductIds;
  final void Function(int)? onTapSavedButton;

  const KsProductSliverGrid({
    super.key,
    required this.productNodes,
    required this.productCount,
    required this.savedProductIds,
    this.onTapSavedButton,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        mainAxisExtent: 228,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final productData = productNodes[index];
          final id = productData['id'];

          // Display Product Card
          return KsProductCard(
            id: id,
            imageUrl: productData['image_url'],
            title: productData['name'],
            price: productData['price'] != null
                ? productData['price'].toDouble()
                : 0,
            isSaved: savedProductIds.contains(id),
            onTapSavedButton:
                onTapSavedButton != null ? () => onTapSavedButton!(id) : null,
          );
        },
        childCount: productCount,
      ),
    );
  }
}

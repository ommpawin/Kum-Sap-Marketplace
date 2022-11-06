import 'package:flutter/material.dart';
import 'package:kumsap_marketplace/widgets/ksProductCartCard.dart';

class KsProductCartSliverFixedExtentList extends StatelessWidget {
  final List cartProductNodes;
  final int cartProductCount;
  final void Function(int)? onTapDecrease;
  final void Function(int)? onTapIncrease;
  final void Function(int)? onTapDelete;

  const KsProductCartSliverFixedExtentList({
    super.key,
    required this.cartProductNodes,
    required this.cartProductCount,
    this.onTapDecrease,
    this.onTapIncrease,
    this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 150,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          Map cartProductData = cartProductNodes[index];
          int id = cartProductData['id'];

          return KsProductCartCard(
            id: id,
            imageUrl: cartProductData['image_url'],
            title: cartProductData['name'],
            price: cartProductData['price'] != null
                ? cartProductData['price'].toDouble()
                : 0,
            itemCount: cartProductData['itemCount'],
            onTapDecrease:
                onTapDecrease != null ? () => onTapDecrease!(id) : null,
            onTapIncrease:
                onTapIncrease != null ? () => onTapIncrease!(id) : null,
            onTapDelete: onTapDelete != null ? (_) => onTapDelete!(id) : null,
          );
        },
        childCount: cartProductCount,
      ),
    );
  }
}

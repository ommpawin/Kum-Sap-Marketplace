import 'package:flutter/material.dart';
import 'package:kumsap_marketplace/constants/format.dart';
import 'package:kumsap_marketplace/pages/product/productPage.dart';
import 'package:kumsap_marketplace/style/ksFonts.dart';
import 'package:kumsap_marketplace/widgets/core/ksImage.dart';
import 'package:kumsap_marketplace/widgets/ksSavedButton.dart';

class KsProductCard extends StatelessWidget {
  final int id;
  final String imageUrl;
  final String title;
  final double? price;
  final bool isSaved;
  final VoidCallback? onTapSavedButton;

  const KsProductCard({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    this.price,
    this.isSaved = false,
    this.onTapSavedButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // Main InkWell for User tap on card and interact or action
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(ProductPage(
                id: id,
                imageUrl: imageUrl,
                title: title,
                price: price,
              ).asRoute(id.toString()));
            },
            borderRadius: BorderRadius.circular(8),
            splashColor: Colors.black.withOpacity(0.04),
            highlightColor: Colors.black.withOpacity(0.08),
            // Body of Card
            child: Container(
              height: 228,
              width: 180,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              // Skeleton of Card
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 180,
                    height: 150,
                    child: KsImage.networkImage(
                      imageUrl,
                      fit: BoxFit.cover,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  // Product Name
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: KsFontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Spacer(),
                  // Product Price
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      price == null || price == 0.0
                          ? 'Free'
                          : '฿ ${Format.numberWithDigit.format(price)}',
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Saved Button and set position in Stack Widget
          Positioned(
            top: 8,
            right: 8,
            child: KsSavedButton(
              onTap: onTapSavedButton,
              isSaved: isSaved,
            ),
          ),
        ],
      ),
    );
  }
}

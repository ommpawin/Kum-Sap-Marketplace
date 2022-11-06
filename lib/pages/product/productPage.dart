import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kumsap_marketplace/constants/format.dart';
import 'package:kumsap_marketplace/constants/router.dart';
import 'package:kumsap_marketplace/store/cart.state.dart';
import 'package:kumsap_marketplace/store/savedProduct.state.dart';
import 'package:kumsap_marketplace/style/ksFonts.dart';
import 'package:kumsap_marketplace/widgets/core/ksImage.dart';
import 'package:kumsap_marketplace/widgets/ksAppBar.dart';
import 'package:kumsap_marketplace/widgets/ksBarButton.dart';
import 'package:kumsap_marketplace/widgets/ksSavedButton.dart';

class ProductPage extends HookConsumerWidget {
  final int id;
  final String imageUrl;
  final String title;
  final double? price;

  const ProductPage({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    this.price,
  });

  PageRoute<void> asRoute(String id) {
    return MaterialPageRoute(
      builder: (context) => this,
      settings: RouteSettings(
        name: '${AppRoutePath.productPage}/$id',
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(cartStateProvider.notifier);
    final savedProductState = ref.watch(savedProductStateProvider);
    final savedProductNotifier = ref.watch(savedProductStateProvider.notifier);

    final imageSize = (MediaQuery.of(context).size.width - 32);

    const limitCount = 10;
    final itemCount = useState(cartNotifier.getProductItemCount(id));

    return Scaffold(
      appBar: const KsAppBar(title: 'Product',),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display Product Image
            Container(
              height: imageSize,
              width: imageSize,
              margin: const EdgeInsets.all(16),
              alignment: Alignment.center,
              constraints: const BoxConstraints(maxHeight: 378, maxWidth: 378),
              child: KsImage.networkImage(
                imageUrl,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            // Display Product Name
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: KsFontWeight.bold),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Display Product Price
                  Text(
                    price == null || price == 0.0
                        ? 'Free'
                        : '฿ ${Format.numberWithDigit.format(price)}',
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  // Saved Button
                  Container(
                    alignment: Alignment.center,
                    child: KsSavedButton(
                      size: 22,
                      isSaved: savedProductState.savedProductIds.contains(id),
                      onTap: () => savedProductNotifier.setSavedProduct(id),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            // Add to Cart Button
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: KsBarButton(
                disable: price == 0.0 && itemCount.value > 0 ||
                    itemCount.value >= limitCount,
                onPressed: () {
                  itemCount.value++;
                  cartNotifier.addProductToCart(id);
                },
                child: Text(
                  'Add to Cart',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: KsFontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

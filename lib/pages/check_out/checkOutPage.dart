import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kumsap_marketplace/constants/format.dart';
import 'package:kumsap_marketplace/constants/router.dart';
import 'package:kumsap_marketplace/store/cart.state.dart';
import 'package:kumsap_marketplace/style/ksFonts.dart';
import 'package:kumsap_marketplace/widgets/core/ksImage.dart';
import 'package:kumsap_marketplace/widgets/ksAppBar.dart';
import 'package:kumsap_marketplace/widgets/ksBarButton.dart';

class CheckoutPage extends HookConsumerWidget {
  final double total;

  const CheckoutPage({
    super.key,
    required this.total,
  });

  PageRoute<void> asRoute() {
    return MaterialPageRoute(
      builder: (context) => this,
      settings: const RouteSettings(
        name: AppRoutePath.checkoutPage,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartStateProvider);
    final cartStateNotifier = ref.watch(cartStateProvider.notifier);

    const double imageSize = 250;

    final String price = Format.numberWithDigit.format(total);
    const String apiGenerateQRCode =
        'https://api.qrserver.com/v1/create-qr-code/?size=${imageSize}x${imageSize}&data=';
    final String qrCodeData =
        'https://payment.spw.challenge/checkout?price=$total';

    return Scaffold(
      appBar: const KsAppBar(
        title: 'Checkout',
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display when total not free
            if (total > 0.0) ...[
              //Display Payment QRCode Image
              Center(
                child: Container(
                  height: imageSize,
                  width: imageSize,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  constraints:
                      const BoxConstraints(maxHeight: 378, maxWidth: 378),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: total > 0.0 ?  KsImage.networkImage(
                    apiGenerateQRCode + qrCodeData,
                    fit: BoxFit.cover,
                  ) : const SizedBox(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Scan & Pay',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: KsFontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            //Display total price
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                total == 0.0 ? 'Total : All Free' : 'Total : ฿ $price',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: KsFontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            //Display all product in cart
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: _ProductList(
                  imageSize: imageSize,
                  cartProductNodes: cartState.cartProductNodes,
                  cartProductCount: cartState.cartProductCount,
                ),
              ),
            ),
            // Paid Button
            Container(
              margin: const EdgeInsets.all(16),
              child: KsBarButton(
                onPressed: () {
                  cartStateNotifier.cleanState();
                  Navigator.of(context).pop();
                },
                child: Text(
                  total == 0.0 ? 'All Free' : 'Paid',
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

class _ProductList extends StatelessWidget {
  final double imageSize;
  final List cartProductNodes;
  final int cartProductCount;

  const _ProductList({
    super.key,
    required this.imageSize,
    required this.cartProductNodes,
    required this.cartProductCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      constraints: BoxConstraints(maxWidth: imageSize + 70),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 16),
        physics: const ClampingScrollPhysics(),
        itemBuilder: (_, index) {
          final productData = cartProductNodes[index];

          return Text(
            '(${productData['itemCount']}x) ${productData['name']}',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: KsFontWeight.bold,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
        },
        separatorBuilder: (_, __) {
          return const Divider(
            thickness: 2,
            height: 24,
          );
        },
        itemCount: cartProductCount,
      ),
    );
  }
}

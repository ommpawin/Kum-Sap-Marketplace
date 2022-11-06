import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kumsap_marketplace/constants/format.dart';
import 'package:kumsap_marketplace/constants/router.dart';
import 'package:kumsap_marketplace/store/cart.state.dart';
import 'package:kumsap_marketplace/widgets/ksEmptyState.dart';
import 'package:kumsap_marketplace/widgets/ksProductCartSliverFixedExtentList.dart';
import 'package:kumsap_marketplace/widgets/ksSliverAppbar.dart';
import 'package:kumsap_marketplace/widgets/ksTotalBar.dart';

class CartPage extends HookConsumerWidget {
  const CartPage({super.key});

  PageRoute<void> asRoute() {
    return MaterialPageRoute(
      builder: (context) => this,
      settings: const RouteSettings(
        name: AppRoutePath.cartPage,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartStateProvider);
    final cartNotifier = ref.watch(cartStateProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // App bar
                  const KsSliverAppBar(
                    title: 'Cart',
                  ),
                  // Display Product Items in cart if Cart not null
                  if (cartState.cartProductCount > 0)
                    SliverPadding(
                        padding: const EdgeInsets.only(bottom: 16),
                        sliver: KsProductCartSliverFixedExtentList(
                          cartProductNodes: cartState.cartProductNodes,
                          cartProductCount: cartState.cartProductCount,
                          onTapDecrease: (id) =>
                              cartNotifier.decreaseProductItemCount(id),
                          onTapIncrease: (id) =>
                              cartNotifier.increaseProductItemCount(id),
                          onTapDelete: (id) =>
                              cartNotifier.removeProductToCart(id),
                        )),
                  // Display Empty State screen if item is null
                  if (cartState.cartProductCount < 1)
                    const SliverFillRemaining(
                      child: KsEmptyState(
                        icon: FontAwesomeIcons.cartShopping,
                        title: 'Cart is Empty',
                      ),
                    ),
                ],
              ),
            ),
            // Display total bar if Cart not null
            if (cartState.cartProductCount > 0)
              KsTotalBar(
                total: cartState.total,
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kumsap_marketplace/constants/router.dart';
import 'package:kumsap_marketplace/store/product.state.dart';
import 'package:kumsap_marketplace/store/savedProduct.state.dart';
import 'package:kumsap_marketplace/widgets/ksProductSliverGrid.dart';
import 'package:kumsap_marketplace/widgets/ksSliverAppbar.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  PageRoute<void> asRoute() {
    return MaterialPageRoute(
      builder: (context) => this,
      settings: const RouteSettings(
        name: AppRoutePath.homePage,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productStateProvider);
    final savedProductState = ref.watch(savedProductStateProvider);
    final savedProductNotifier = ref.watch(savedProductStateProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App bar
            const KsSliverAppBar(
              title: 'For You',
            ),
            // Display Product Items
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              sliver: KsProductSliverGrid(
                productNodes: productState.productNodes!,
                productCount: productState.productCount!,
                savedProductIds: savedProductState.savedProductIds,
                onTapSavedButton: (id) {
                  savedProductNotifier.setSavedProduct(id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kumsap_marketplace/store/savedProduct.state.dart';
import 'package:kumsap_marketplace/widgets/ksEmptyState.dart';
import 'package:kumsap_marketplace/widgets/ksProductSliverGrid.dart';
import 'package:kumsap_marketplace/widgets/ksSliverAppbar.dart';

class SavedPage extends HookConsumerWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedProductState = ref.watch(savedProductStateProvider);
    final savedProductNotifier = ref.watch(savedProductStateProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          // Lock Scroll When item null
          physics: savedProductState.savedProductCount < 1
              ? const NeverScrollableScrollPhysics()
              : null,
          slivers: [
            // App bar
            const KsSliverAppBar(
              title: 'Saved',
            ),
            // Display Saved Product Items if item not null
            if (savedProductState.savedProductCount > 0) ...[
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                sliver: KsProductSliverGrid(
                  productNodes: savedProductState.savedProductNodes,
                  productCount: savedProductState.savedProductCount,
                  savedProductIds: savedProductState.savedProductIds,
                  onTapSavedButton: (id) {
                    savedProductNotifier.setSavedProduct(id);
                  },
                ),
              ),
            ],
            // Display Empty State screen if item is null
            if (savedProductState.savedProductCount < 1)
              const SliverFillRemaining(
                child: KsEmptyState(
                  icon: FontAwesomeIcons.solidHeart,
                  title: 'Saved Product is Empty',
                ),
              ),
          ],
        ),
      ),
    );
  }
}

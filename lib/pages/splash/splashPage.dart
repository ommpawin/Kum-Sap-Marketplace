import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kumsap_marketplace/constants/router.dart';
import 'package:kumsap_marketplace/pages/app_scaffold/appScaffoldPage.dart';
import 'package:kumsap_marketplace/store/product.state.dart';
import 'package:kumsap_marketplace/style/ksFonts.dart';
import 'package:kumsap_marketplace/widgets/core/ksImage.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  PageRoute<void> asRoute() {
    return MaterialPageRoute(
      builder: (context) => this,
      settings: const RouteSettings(
        name: AppRoutePath.splashPage,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productStateProvider);
    final productStateNotifier = ref.watch(productStateProvider.notifier);

    // Use useEffect Hook for use initSate when this page is open
    useEffect(() {
      // Simulate first time app open and load product data in waiting
      productStateNotifier.fetchData();

      return null;
    }, const []);

    useEffect(() {
      // # I hope that you will be interested in the app logo
      // Wait for API response and product data
      // # Limitation of flutter_hooks package is use Future.delayed for wait until Build life-cycle success
      if (productState.productCount != null) {
        Future.delayed(Duration.zero, () {
          Navigator.of(context).pushAndRemoveUntil(
            const AppScaffoldPage().asRoute(),
            (Route<dynamic> route) => false,
          );
        });
      }

      return null;
    }, [productState.productCount]);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Display app logo
              Container(
                height: 170,
                width: 170,
                alignment: Alignment.center,
                child: KsImage.assetSVG(
                  'kum_sap_logo',
                  folder: 'svg',
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              // Display SpinKit when loading
              if (!productState.isStateError)
                SpinKitDoubleBounce(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  size: 72,
                ),
              // Display message when state load product error
              if (productState.isStateError)
                Center(
                  child: Text(
                    '400 : Bad Request',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: KsFontWeight.bold,
                          color: Theme.of(context).colorScheme.error,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

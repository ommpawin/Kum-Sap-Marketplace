import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kumsap_marketplace/constants/router.dart';
import 'package:kumsap_marketplace/pages/cart/cartPage.dart';
import 'package:kumsap_marketplace/pages/home/homePage.dart';
import 'package:kumsap_marketplace/pages/saved/savedPage.dart';

class AppScaffoldPage extends HookWidget {
  final int page;

  const AppScaffoldPage({
    super.key,
    this.page = 0,
  });

  PageRoute<void> asRoute() {
    return MaterialPageRoute(
      builder: (context) => this,
      settings: const RouteSettings(
        name: AppRoutePath.appScaffoldPage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(page);

    // List of Pages for IndexedStack Call
    const List<Widget> pages = [
      HomePage(
        key: PageStorageKey(AppRoutePath.homePage),
      ),
      SavedPage(
        key: PageStorageKey(AppRoutePath.savedPage),
      ),
      CartPage(
        key: PageStorageKey(AppRoutePath.cartPage),
      )
    ];

    // List of menu in BottomNavigationBar
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: Container(
          height: 40,
          width: 45,
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Icon(FontAwesomeIcons.house),
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Container(
          height: 40,
          width: 41,
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Icon(FontAwesomeIcons.solidHeart),
        ),
        label: 'Saved',
      ),
      BottomNavigationBarItem(
        icon: Container(
          height: 40,
          width: 47,
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Icon(FontAwesomeIcons.cartShopping),
        ),
        label: 'Cart',
      ),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex.value,
        onTap: (i) => selectedIndex.value = i,
        items: items,
      ),
      body: IndexedStack(
        index: selectedIndex.value,
        children: pages,
      ),
    );
  }
}

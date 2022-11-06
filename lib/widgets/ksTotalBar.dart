import 'package:flutter/material.dart';
import 'package:kumsap_marketplace/constants/format.dart';
import 'package:kumsap_marketplace/pages/check_out/checkOutPage.dart';
import 'package:kumsap_marketplace/style/ksFonts.dart';
import 'package:kumsap_marketplace/widgets/ksBarButton.dart';

class KsTotalBar extends StatelessWidget {
  final double total;

  const KsTotalBar({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    final String price = Format.numberWithDigit.format(total);

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 16,
            blurRadius: 8,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              total == 0.0 ? 'Total : All Free' : 'Total : ฿ $price',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: KsFontWeight.bold,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ),
          KsBarButton(
            onPressed: () {
              Navigator.of(context).push(
                CheckoutPage(total: total).asRoute(),
              );
            },
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              'Checkout',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: KsFontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

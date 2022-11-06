import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kumsap_marketplace/constants/format.dart';
import 'package:kumsap_marketplace/pages/product/productPage.dart';
import 'package:kumsap_marketplace/style/ksFonts.dart';
import 'package:kumsap_marketplace/widgets/core/ksImage.dart';
import 'package:kumsap_marketplace/widgets/ksCounterBarAndButton.dart';

class KsProductCartCard extends StatelessWidget {
  final int id;
  final String imageUrl;
  final String title;
  final double? price;
  final int itemCount;
  final VoidCallback? onTapDecrease;
  final VoidCallback? onTapIncrease;
  final void Function(BuildContext)? onTapDelete;

  const KsProductCartCard({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    this.price,
    required this.itemCount,
    this.onTapDecrease,
    this.onTapIncrease,
    this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: LimitedBox(
        maxWidth: 378,
        child: Container(
          width: double.infinity,
          height: 150,
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: InkWell(
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
            child: Slidable(
              endActionPane: ActionPane(
                motion: const BehindMotion(),
                extentRatio: 0.25,
                dragDismissible: true,
                children: [
                  SlidableAction(
                    onPressed: onTapDelete,
                    autoClose: true,
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    foregroundColor:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                    borderRadius: BorderRadius.circular(8),
                    spacing: 7,
                    icon: FontAwesomeIcons.trashCan,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 160,
                      height: 150,
                      child: KsImage.networkImage(imageUrl,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 8, 8, 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: KsFontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              price == null || price == 0.0
                                  ? 'Free'
                                  : '฿ ${Format.numberWithDigit.format(price)}',
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                            KsCounterBarAndButton(
                              count: itemCount,
                              onTapDecrease: onTapDecrease,
                              onTapIncrease: onTapIncrease,
                              disable: price == 0 && itemCount > 0,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

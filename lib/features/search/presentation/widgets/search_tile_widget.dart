import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../network/end_points.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../../shopcartpage/presentation/view/shop_cart_screen.dart';
import '../../domain/entities/search.dart';

class ItemSearchWidget extends StatelessWidget {
  const ItemSearchWidget(
      {super.key,
      this.search,
      this.isRemovable,
      this.onRemove,
      this.onItemSearchPressed});
  final SearchEntity? search;
  final bool? isRemovable;
  final void Function(SearchEntity search)? onRemove;
  final void Function(String title)? onItemSearchPressed;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (final context) => AlertDialog.adaptive(
            content: Text('Xóa ${search!.name!}?'),
            title: Text('Xóa ${search!.name!}?'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      if (onRemove != null) {
                        onRemove!(search!);
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      child: ListTile(
        leading: const Icon(Icons.search_rounded),
        title: Text(search!.name ?? ''),
        trailing: GestureDetector(
          onTap: () {
            if (onItemSearchPressed != null) {
              onItemSearchPressed!(search!.name!);
            }
          },
          child: const Icon(Icons.replay),
        ),
      ),
    );
  }
}

class ItemSearchWidget2 extends StatelessWidget {
  const ItemSearchWidget2({super.key, this.search, this.onItemSearchPressed});
  final ProductEntity? search;
  final void Function(String title)? onItemSearchPressed;
  @override
  Widget build(final BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: search!.product_image![0] == 'i'
            ? '${EndPoints.urlImage}${search!.product_image}'
            : search!.product_image!,
        imageBuilder: (final context, final imageProvider) {
          return Container(
            width: MediaQuery.of(context).size.width / 5,
            height: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
        progressIndicatorBuilder: (final context, final url, final progress) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.08),
              ),
              child: const CupertinoActivityIndicator(),
            ),
          );
        },
        errorWidget: (final context, final url, final error) {
          return Container(
            width: MediaQuery.of(context).size.width / 5,
            height: MediaQuery.of(context).size.width / 4,
            color: Colors.black.withOpacity(0.04),
          );
        },
      ),
      title: Text(search!.name ?? ''),
      trailing: GestureDetector(
        onTap: () {
          if (onItemSearchPressed != null) {
            onItemSearchPressed!(search!.name!);
          }
        },
        child: const Icon(Icons.arrow_outward),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (final context) => ShopCartScreen(sCart: search!),
            ));
      },
    );
  }
}

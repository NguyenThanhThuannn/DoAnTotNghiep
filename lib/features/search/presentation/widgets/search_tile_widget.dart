import 'package:flutter/material.dart';

import '../../domain/entities/search.dart';

class ItemSearchWidget extends StatelessWidget {
  const ItemSearchWidget({super.key, this.search, this.isRemovable, this.onRemove, this.onItemSearchPressed});
  final SearchEntity ? search;
  final bool ? isRemovable;
  final void Function(SearchEntity search) ? onRemove;
  final void Function(String title) ? onItemSearchPressed;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(context: context, builder: (final context) => AlertDialog.adaptive(
          content: Text('Xóa ${search!.title!}?'),
          title: Text('Xóa ${search!.title!}?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {
                  if(onRemove!=null){
                    onRemove!(search!);
                  }
                  Navigator.of(context).pop();
                }, child: const Text('OK'),),
                const SizedBox(width: 10,),
                TextButton(onPressed: () {
                  Navigator.of(context).pop();
                }, child: const Text('Cancel'),),
              ],
            ),
          ],
        ),);
      },
      child: ListTile(
        leading: const Icon(Icons.search_rounded),
        title: Text(search!.title??''),
        trailing: GestureDetector(
          onTap: () {
            if(onItemSearchPressed!=null){
              onItemSearchPressed!(search!.title!);
            }
          },
          child: const Icon(Icons.arrow_outward_outlined),),
      ),
    );
  }
}
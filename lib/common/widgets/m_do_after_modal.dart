import 'package:configuration/route/xmd_router.dart';
import 'package:flutter/material.dart';

class ItemDoAfter<T> {
  final String title;
  final T value;
  ItemDoAfter({required this.title, required this.value});
}

Future<T?> showDoAfterModal<T>(BuildContext context, List<ItemDoAfter<T>> items,
        {ItemDoAfter? selected}) =>
    showModalBottomSheet<T>(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
        builder: (context) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    XMDRouter.pop(result: items[index].value);
                  },
                  trailing: items[index].value == selected?.value
                      ? const Icon(Icons.check)
                      : null,
                  title: Text(items[index].title),
                );
              });
        });

import 'package:flutter/material.dart';

final class ListViewBuilder<T> extends StatelessWidget {
  const ListViewBuilder(
      {super.key,
      required this.items,
      required this.itemBuilder,
      this.padding = const EdgeInsets.only(bottom: 100)});

  final List<T> items;
  final Widget? Function(BuildContext, int) itemBuilder;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: padding,
        itemCount: items.length,
        shrinkWrap: true,
        itemBuilder: itemBuilder);
  }
}

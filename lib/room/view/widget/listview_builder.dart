import 'package:flutter/material.dart';

final class ListViewBuilder<T> extends StatelessWidget {
  const ListViewBuilder(
      {super.key,
      required this.items,
      required this.itemBuilder,
      this.padding = const EdgeInsets.only(bottom: 100),
      this.isSeparated = false,
      this.separatorBuilder,
      this.isHorizontal = false});

  final List<T> items;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;

  final EdgeInsets padding;
  final bool isSeparated;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return isSeparated
        ? ListView.separated(
            scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
            separatorBuilder: separatorBuilder == null
                ? (_, __) => const SizedBox.shrink()
                : separatorBuilder!,
            padding: padding,
            itemCount: items.length,
            shrinkWrap: true,
            itemBuilder: itemBuilder)
        : ListView.builder(
            scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
            padding: padding,
            itemCount: items.length,
            shrinkWrap: true,
            itemBuilder: itemBuilder);
  }
}

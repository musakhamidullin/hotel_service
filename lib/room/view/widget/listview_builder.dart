import 'package:flutter/material.dart';

final class ListViewBuilder<T> extends StatefulWidget {
  const ListViewBuilder(
      {super.key,
      required this.items,
      required this.itemBuilder,
      this.padding = const EdgeInsets.only(bottom: 100),
      this.isSeparated = false,
      this.separatorBuilder,
      this.isHorizontal = false,
      this.scrollController});

  final List<T> items;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final ScrollController? scrollController;

  final EdgeInsets padding;
  final bool isSeparated;
  final bool isHorizontal;

  @override
  State<ListViewBuilder<T>> createState() => _ListViewBuilderState<T>();
}

class _ListViewBuilderState<T> extends State<ListViewBuilder<T>> {
  // @override
  // void dispose() {
  //   super.dispose();

  //   widget.scrollController?.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return widget.isSeparated
        ? ListView.separated(
            controller: widget.scrollController,
            scrollDirection:
                widget.isHorizontal ? Axis.horizontal : Axis.vertical,
            separatorBuilder: widget.separatorBuilder == null
                ? (_, __) => const SizedBox.shrink()
                : widget.separatorBuilder!,
            padding: widget.padding,
            itemCount: widget.items.length,
            shrinkWrap: true,
            itemBuilder: widget.itemBuilder)
        : ListView.builder(
            controller: widget.scrollController,
            scrollDirection:
                widget.isHorizontal ? Axis.horizontal : Axis.vertical,
            padding: widget.padding,
            itemCount: widget.items.length,
            shrinkWrap: true,
            itemBuilder: widget.itemBuilder);
  }
}

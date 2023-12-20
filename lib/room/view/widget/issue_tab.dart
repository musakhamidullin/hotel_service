import 'package:flutter/material.dart';

class IssueTab extends StatelessWidget {
  const IssueTab({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.grey.withOpacity(0.2)),
      child: TabBar(
        controller: controller,
        dividerHeight: 0,
        splashBorderRadius: BorderRadius.circular(24),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).primaryColor.withOpacity(0.5)),
        indicatorColor: Colors.transparent,
        indicatorPadding: EdgeInsets.zero,
        indicatorWeight: 0,
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: EdgeInsets.zero,
        tabs: const [
          Tab(child: Text('Cозданные')),
          Tab(child: Text('Новые')),
        ],
        labelColor: Colors.black,
      ),
    );
  }
}

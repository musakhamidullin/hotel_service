import 'package:flutter/material.dart';

import '../data/models/defect_status.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key, required this.status});

  final DefectStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.yellow.withOpacity(0.5)),
        child: Text(status.name));
  }
}

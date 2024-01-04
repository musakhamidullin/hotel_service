import 'package:flutter/material.dart';

import '../cubit/room_cubit.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key, required this.status});

  final DefectStatuses status;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: DefectStatuses.matchByStatus(status)),
        child: Text(status.name));
  }
}

import 'package:flutter/material.dart';

import '../../../auth/data/model/user.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.person_outline_rounded,
        size: 48,
      ),
    );
  }
}

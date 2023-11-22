import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: theme.iconTheme.color?.withOpacity(0.3) ?? Colors.grey,
            size: 96,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Ошибка',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: onPressed, child: const Text('перегрузить')),
        ],
      ),
    );
  }
}

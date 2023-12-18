import 'package:flutter/material.dart';

class AddPhotos extends StatelessWidget {
  const AddPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Flexible(
      child: Center(
        child: Opacity(
          opacity: 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.photo_library_outlined,
                size: 128,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Добавьте фотографии',
                style: theme.textTheme.titleLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}

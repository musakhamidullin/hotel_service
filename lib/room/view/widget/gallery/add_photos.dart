import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotos extends StatefulWidget {
  const AddPhotos({super.key, this.isFromFiles = false});

  final bool isFromFiles;

  @override
  State<AddPhotos> createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> {
  final List<String> _images = [];

  Future<void> _onSelectedCameraPressed() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _images.add(base64Encode(File(pickedImage.path).readAsBytesSync()));
      });
    }
  }

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
              ),
              if (widget.isFromFiles) const SizedBox(height: 16),
              if (widget.isFromFiles)
                Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'На Вашем устройстве отсутствуют фотографии',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    FilledButton.tonal(
                      onPressed: () {
                        _onSelectedCameraPressed();

                        // widget.onPhotosAdd?.call(_images);

                        Navigator.pop(context);
                      },
                      child: const Text('Сделать фото'),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

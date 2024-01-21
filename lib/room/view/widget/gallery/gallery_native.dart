import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_photos_from_device/plugin.dart';

class NativePhotoParserWidget extends StatefulWidget {
  const NativePhotoParserWidget(
      {super.key, required this.callImagePicker, required this.callCamera});

  final VoidCallback callImagePicker;
  final VoidCallback callCamera;

  @override
  State<NativePhotoParserWidget> createState() =>
      _NativePhotoParserWidgetState();
}

class _NativePhotoParserWidgetState extends State<NativePhotoParserWidget> {
  Future<List<String>> getPhotos() async {
    final data = await GetPhotosFromDevicePlugin.getPhotos();

    if (!data.$2) {
      widget.callImagePicker();
      throw StateError('function cannot return a value');
    }

    return data.$1;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 1,
      minChildSize: 0.4,
      initialChildSize: 1,
      builder: (context, scrollController) => FutureBuilder(
        future: getPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.requireData.isNotEmpty) {
            return GridView.builder(
              controller: scrollController,
              itemCount: snapshot.requireData.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemBuilder: (_, i) => Stack(
                children: [
                  Positioned.fill(
                    child: Image.file(
                      File(snapshot.requireData[i]),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.none,
                    ),
                  ),
                  Positioned.fill(
                    top: 6,
                    right: 6,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black87.withOpacity(0.5)),
                          child: Icon(
                            Icons.cancel_rounded,
                            color: Colors.white.withOpacity(0.8),
                            size: 34,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          if (snapshot.hasData && snapshot.requireData.isEmpty) {
            return Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'На Вашем устройстве отсутствуют фотографии',
                  style:
                      theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                FilledButton.tonal(
                  onPressed: () {
                    widget.callCamera();
                    Navigator.pop(context);
                  },
                  child: const Text('Сделать фото'),
                ),
              ],
            );
          }
          if (snapshot.hasError) {
            Navigator.pop(context);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

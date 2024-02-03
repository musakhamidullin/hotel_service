import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_photos_from_device/plugin.dart';

class NativePhotoParserWidget extends StatefulWidget {
  const NativePhotoParserWidget(
      {super.key,
      required this.callImagePicker,
      required this.callCamera,
      required this.onAddPhotosPressed});

  final VoidCallback callImagePicker;
  final VoidCallback callCamera;
  final void Function(List<String> images) onAddPhotosPressed;

  @override
  State<NativePhotoParserWidget> createState() =>
      _NativePhotoParserWidgetState();
}

class _NativePhotoParserWidgetState extends State<NativePhotoParserWidget> {

  Future<List<String>> _getPhotos() async =>
      await GetPhotosFromDevicePlugin().getPhotos();

  final Map<String, int> _markedImages = {};

  void _addItem(String path) {
    _markedImages[path] = _markedImages.length + 1;
    setState(() {});
  }

  void _deleteItem(String path) {
    final index = _markedImages[path]! - 1;

    final keys = _markedImages.keys.toList();

    for (int i = index; i < keys.length; i++) {
      _markedImages[keys[i]] = i;
    }

    _markedImages.remove(path);
    setState(() {});
  }

  List<String> _sort() {
    final temp = <String, int>{};

    final map = _markedImages.entries.toList()
      ..sort(
        (a, b) => a.value.compareTo(b.value),
      );

    temp.addEntries(map);

    return temp.keys.toList();
  }

  @override
  void initState() {
    super.initState();

    Future.sync(() async {
      final photos = await _getPhotos();
      _photos.addAll(photos);

      isLoaded = true;
      setState(() {});
    });
  }

  final _photos = <String>[];
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
        expand: false,
        maxChildSize: 1,
        minChildSize: 0.75,
        initialChildSize: 1,
        builder: (context, scrollController) {
          if (!isLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (_photos.isEmpty && isLoaded) {
            return InformationAboutEmptyPhotos(callCamera: widget.callCamera);
          }
          return Scaffold(
            floatingActionButton: _markedImages.isNotEmpty
                ? FloatingActionButton(
                    onPressed: () {
                      widget.onAddPhotosPressed(_sort());
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.check),
                  )
                : null,
            body: Padding(
              padding: EdgeInsets.only(
                  left: 8, right: 8, bottom: _markedImages.isNotEmpty ? 80 : 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Выберите фотографии',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: GridView.builder(
                        controller: scrollController,
                        itemCount: _photos.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                        ),
                        itemBuilder: (_, i) {
                          final path = _photos[i];
                          return Stack(
                            children: [
                              Positioned.fill(
                                child: GestureDetector(
                                  onTap: () => _addItem(path),
                                  child: Image.file(
                                    key: ValueKey(i),
                                    File(_photos[i]),
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.none,
                                  ),
                                ),
                              ),
                              if (_markedImages.containsKey(path))
                                Positioned.fill(
                                    child: GestureDetector(
                                  onTap: () => _deleteItem(path),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.amber.withOpacity(0.7),
                                            width: 6)),
                                  ),
                                )),
                              Positioned.fill(
                                top: 6,
                                right: 6,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            color: Colors.amber.shade100
                                                .withOpacity(0.5),
                                            border: Border.all(
                                                width: 2,
                                                color: Colors.amber.shade600),
                                            shape: BoxShape.circle),
                                        child: _markedImages[path] != null
                                            ? Text(
                                                _markedImages[path].toString(),
                                                style: theme
                                                    .textTheme.bodyMedium
                                                    ?.copyWith(
                                                        color: Colors.white,
                                                        shadows: [
                                                      const Shadow(
                                                          blurRadius: 5.0,
                                                          color: Colors.black),
                                                    ]),
                                              )
                                            : const SizedBox.shrink()),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class InformationAboutEmptyPhotos extends StatelessWidget {
  const InformationAboutEmptyPhotos({super.key, required this.callCamera});

  final void Function() callCamera;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Opacity(
            opacity: .7,
            child: Icon(
              Icons.add_photo_alternate_outlined,
              size: 128,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              'На Вашем устройстве отсутствуют фотографии',
              style: theme.textTheme.bodyLarge?.copyWith(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.tonal(
            onPressed: () {
              callCamera();
              Navigator.pop(context);
            },
            child: const Text('Сделать фото'),
          ),
        ],
      ),
    );
  }
}

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
  Future<List<String>> _getPhotos() async {
    final mediaService = MediaService();
    final dynamic targetPlatform = Platform.isAndroid
        ? AndroidPlatform(iMediaService: mediaService)
        : IOsPlatform(iMediaService: mediaService);
    final data =
        await GetPhotosFromDevicePlugin(iMobilePhotoManager: targetPlatform)
            .getPhotos();

    if (data.isEmpty) return [];

    return data;
  }

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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 1,
      minChildSize: 0.4,
      initialChildSize: 1,
      builder: (context, scrollController) => FutureBuilder(
        future: _getPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.requireData.isNotEmpty) {
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
              body: GridView.builder(
                  controller: scrollController,
                  itemCount: snapshot.requireData.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                      top: 8,
                      left: 8,
                      right: 8,
                      bottom: _markedImages.isNotEmpty ? 80 : 8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemBuilder: (_, i) {
                    final path = snapshot.requireData[i];
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: GestureDetector(
                            onTap: () => _addItem(path),
                            child: Image.file(
                              key: ValueKey(i),
                              File(snapshot.requireData[i]),
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
                                      color: Colors.amber.withOpacity(0.7),
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
                                          style: theme.textTheme.bodyMedium
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
            );
          }
          if (snapshot.hasData && snapshot.requireData.isEmpty) {
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
                  Text(
                    textAlign: TextAlign.center,
                    'На Вашем устройстве отсутствуют фотографии',
                    style:
                        theme.textTheme.bodyLarge?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  FilledButton.tonal(
                    onPressed: () {
                      widget.callCamera();
                      Navigator.pop(context);
                    },
                    child: const Text('Сделать фото'),
                  ),
                ],
              ),
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

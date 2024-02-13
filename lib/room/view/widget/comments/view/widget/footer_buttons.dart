import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_photos_from_device/plugin.dart';

import '../../../../../../voice_messenger/data/models/voice_value.dart';
import '../../../../../../voice_messenger/view/record_button.dart';
import '../../../../../data/models/audio.dart';
import '../../../../../data/models/image.dart';
import '../../../gallery/view/widget/get_photos_button.dart';

class FooterButtons extends StatefulWidget {
  const FooterButtons({
    super.key,
    required this.onSend,
    required this.onClear,
    required this.onPhotographed,
    required this.canSend,
    required this.recording,
    required this.onAudioRecorded,
  });

  final void Function() onSend;
  final void Function() onClear;
  final void Function(List<String>) onPhotographed;
  final void Function(VoiceValue) onAudioRecorded;
  final bool canSend;
  final ValueNotifier<bool> recording;

  @override
  State<FooterButtons> createState() => _FooterButtonsState();
}

class _FooterButtonsState extends State<FooterButtons> {
  var _recording = false;

  Future<ImageModel> _onSelectedCameraPressed() async {
    final data = await GetPhotosFromDevicePlugin().getPhoto();

    return ImageModel.fromDevice(data);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          _recording ? MainAxisAlignment.end : MainAxisAlignment.spaceAround,
      children: [
        Visibility(
          visible: !_recording,
          child: IconButton(
            onPressed: () async => await _onSelectedCameraPressed(),
            icon: const Icon(Icons.photo_camera_outlined),
          ),
        ),
        Visibility(
          visible: !_recording,
          child: GetPhotosButton(
            onSelectedFromNativeGalleryPressed: (photos) {
              widget.onPhotographed(
                  photos.map((e) => File(e.image).path).toList());
            },
            onSelectedFromImagePickerPressed: (photos) {
              widget.onPhotographed(
                  photos.map((e) => File(e.image).path).toList());
            },
            onSelectedCameraPressed: (photo) {
              widget.onPhotographed([File(photo.image).path]);
            },
            iconData: Icons.attach_file,
          ),
        ),
        RecordButton(
          onRecord: (value) {
            widget.recording.value = value;
            setState(() {
              _recording = value;
            });
          },
          onStop: (value) {
            widget.onAudioRecorded(
                VoiceValue(audio: AudioModel.fromDevice(value)));
          },
        ),
        Visibility(
          visible: !_recording,
          child: IconButton(
            onPressed: widget.canSend ? widget.onSend : null,
            icon: const Icon(Icons.send),
          ),
        ),
        Visibility(
          visible: !_recording,
          child: IconButton(
            onPressed: widget.canSend ? widget.onClear : null,
            icon: const Icon(Icons.clear),
          ),
        ),
      ],
    );
  }
}

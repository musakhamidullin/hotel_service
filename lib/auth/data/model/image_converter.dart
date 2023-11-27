import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

class ImageConverter implements JsonConverter<Uint8List, String?> {
  const ImageConverter();

  @override
  Uint8List fromJson(String? value) {
    if (value == null) return Uint8List(0);

    try {
      return base64Decode(value);
    } catch (_) {}

    return Uint8List(0);
  }

  @override
  String toJson(List<int> value) => base64Encode(value);
}
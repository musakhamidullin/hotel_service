import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';
part 'image.g.dart';

@freezed
class ImageModel with _$ImageModel {
  factory ImageModel(
      {@Default(false) bool isFromApi,
      @Default(false) bool isFromCamera,
      @Default('') String image}) = _ImageModel;

  factory ImageModel.fromApi(String image) =>
      ImageModel(isFromApi: true, image: image);

  factory ImageModel.fromDevice(String image) => ImageModel(image: image);

  factory ImageModel.fromCamera(String image) =>
      ImageModel(image: image, isFromCamera: true);

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  static List<ImageModel> getImageModels(List<String> images) {
    return images.map((e) => ImageModel.fromDevice(e)).toList();
  }
}

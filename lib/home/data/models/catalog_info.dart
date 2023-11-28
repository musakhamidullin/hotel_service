import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_info.g.dart';

part 'catalog_info.freezed.dart';

@freezed
class CatalogInfo with _$CatalogInfo {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory CatalogInfo({
    required int id,
    required String shortDesc,
    required String longDesc,
  }) = _CatalogInfo;

  factory CatalogInfo.fromJson(Map<String, dynamic> json) =>
      _$CatalogInfoFromJson(json);
}

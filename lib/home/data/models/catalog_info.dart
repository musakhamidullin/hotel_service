import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_info.g.dart';

part 'catalog_info.freezed.dart';

@freezed
class CatalogInfo with _$CatalogInfo {
  const factory CatalogInfo({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'ShortDesc') required String shortDesc,
    @JsonKey(name: 'LongDesc') required String longDesc,
  }) = _CatalogInfo;

  factory CatalogInfo.fromJson(Map<String, dynamic> json) =>
      _$CatalogInfoFromJson(json);
}

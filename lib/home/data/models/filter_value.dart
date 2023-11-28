import 'package:freezed_annotation/freezed_annotation.dart';

import 'catalog_info.dart';

part 'filter_value.freezed.dart';

@freezed
class FilterValue with _$FilterValue {
  const factory FilterValue({
    CatalogInfo? cleanStatus,
    CatalogInfo? cleanType,
  }) = _FilterValue;
}

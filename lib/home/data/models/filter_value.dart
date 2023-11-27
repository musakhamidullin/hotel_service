import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_value.freezed.dart';

@freezed
class FilterValue with _$FilterValue {
  const factory FilterValue({
    @Default(-1) int cleanStatus,
  }) = _FilterValue;
}

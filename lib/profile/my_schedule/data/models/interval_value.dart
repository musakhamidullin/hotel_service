import 'package:freezed_annotation/freezed_annotation.dart';

part 'interval_value.freezed.dart';
part 'interval_value.g.dart';

@freezed
class IntervalValue with _$IntervalValue {
  @JsonSerializable(fieldRename: FieldRename.pascal)
const factory IntervalValue({
  DateTime? timeStart,
  DateTime? timeEnd,
}) = _IntervalValue;

  factory IntervalValue.fromJson(Map<String, dynamic> json) =>
      _$IntervalValueFromJson(json);
}

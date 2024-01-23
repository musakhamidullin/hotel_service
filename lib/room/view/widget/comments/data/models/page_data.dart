import 'package:freezed_annotation/freezed_annotation.dart';

import 'message_value.dart';

part 'page_data.freezed.dart';
part 'page_data.g.dart';

@freezed
class PageMessagesData with _$PageMessagesData {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory PageMessagesData({
    @Default(<MessageValue>[]) List<MessageValue> data,
  }) = _PageMessagesData;

  factory PageMessagesData.fromJson(Map<String, dynamic> json) =>
      _$PageMessagesDataFromJson(json);
}

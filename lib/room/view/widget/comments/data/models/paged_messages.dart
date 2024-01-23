import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_messages.freezed.dart';
part 'paged_messages.g.dart';

@freezed
class PagedMessages with _$PagedMessages {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory PagedMessages({
    @Default(1) int page,
    @Default(10) int pageSize,
    @Default(0) int defectId,
  }) = _PagedMessages;

  factory PagedMessages.getDefectId(int defectId) =>
      PagedMessages(defectId: defectId);

  factory PagedMessages.changeSize(int pageNumber, int pageSize) =>
      PagedMessages(page: pageNumber, pageSize: pageSize);

  factory PagedMessages.changePage(int pageNumber) =>
      PagedMessages(page: pageNumber);

  factory PagedMessages.fromJson(Map<String, dynamic> json) =>
      _$PagedMessagesFromJson(json);
}

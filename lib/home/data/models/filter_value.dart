import 'package:freezed_annotation/freezed_annotation.dart';

import 'catalog_info.dart';
import 'room_status_info.dart';

part 'filter_value.freezed.dart';

@freezed
class FilterValue with _$FilterValue {
  const factory FilterValue({
    CatalogInfo? cleanStatus,
    CatalogInfo? cleanType,
    RoomStatusInfo? roomStatusInfo,
  }) = _FilterValue;

  const FilterValue._();

  Map<String, dynamic> toBody() => {
        if (roomStatusInfo != null) "RoomStatus": roomStatusInfo?.id,
        if (cleanStatus != null) "CleanStatusId": cleanStatus?.id,
        if (cleanType != null) "CleanTypeId": cleanType?.id,
      };
}

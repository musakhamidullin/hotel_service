// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PagedMessagesImpl _$$PagedMessagesImplFromJson(Map<String, dynamic> json) =>
    _$PagedMessagesImpl(
      page: json['Page'] as int? ?? 1,
      pageSize: json['PageSize'] as int? ?? 10,
      defectId: json['DefectId'] as int? ?? 0,
    );

Map<String, dynamic> _$$PagedMessagesImplToJson(_$PagedMessagesImpl instance) =>
    <String, dynamic>{
      'Page': instance.page,
      'PageSize': instance.pageSize,
      'DefectId': instance.defectId,
    };

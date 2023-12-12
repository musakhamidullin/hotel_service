// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IssuesStateImpl _$$IssuesStateImplFromJson(Map<String, dynamic> json) =>
    _$IssuesStateImpl(
      index: json['index'] as int? ?? 0,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      comment: json['comment'] as String? ?? '',
      date: json['date'] == null
          ? ''
          : const DateSerializer().fromJson(json['date']),
      isMutable: json['isMutable'] ?? true,
      department: json['department'] == null
          ? const Department()
          : Department.fromJson(json['department'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$IssuesStateImplToJson(_$IssuesStateImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'images': instance.images,
      'comment': instance.comment,
      'date': const DateSerializer().toJson(instance.date),
      'isMutable': instance.isMutable,
      'department': instance.department,
    };

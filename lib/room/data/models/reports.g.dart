// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportsImpl _$$ReportsImplFromJson(Map<String, dynamic> json) =>
    _$ReportsImpl(
      personId: json['PersonId'] as int? ?? 0,
      roomId: json['RoomId'] as int? ?? 0,
      problemList: (json['ProblemList'] as List<dynamic>?)
              ?.map((e) => ProblemList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReportsImplToJson(_$ReportsImpl instance) =>
    <String, dynamic>{
      'PersonId': instance.personId,
      'RoomId': instance.roomId,
      'ProblemList': instance.problemList,
    };

_$ProblemListImpl _$$ProblemListImplFromJson(Map<String, dynamic> json) =>
    _$ProblemListImpl(
      problemText: json['ProblemText'] as String? ?? '',
      departmentId: json['DepartmentId'] as int? ?? 0,
      problemMedia: (json['ProblemMedia'] as List<dynamic>?)
              ?.map((e) => ProblemMedia.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProblemListImplToJson(_$ProblemListImpl instance) =>
    <String, dynamic>{
      'ProblemText': instance.problemText,
      'DepartmentId': instance.departmentId,
      'ProblemMedia': instance.problemMedia,
    };

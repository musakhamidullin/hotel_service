// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DefectImpl _$$DefectImplFromJson(Map<String, dynamic> json) => _$DefectImpl(
      id: json['Id'] as int? ?? 0,
      text: json['Text'] as String? ?? '',
      createDate: json['CreateDate'] as String? ?? '',
      hotelDefectMedias: (json['hotelDefectMedias'] as List<dynamic>?)
              ?.map((e) => ProblemMedia.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DefectImplToJson(_$DefectImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Text': instance.text,
      'CreateDate': instance.createDate,
      'hotelDefectMedias': instance.hotelDefectMedias,
    };

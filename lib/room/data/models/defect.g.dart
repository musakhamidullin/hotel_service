// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DefectImpl _$$DefectImplFromJson(Map<String, dynamic> json) => _$DefectImpl(
      id: json['Id'] as int,
      text: json['Text'] as String,
      createDate: DateTime.parse(json['CreateDate'] as String),
      hotelDefectMedias: (json['HotelDefectMedias'] as List<dynamic>)
          .map((e) => ProblemMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DefectImplToJson(_$DefectImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Text': instance.text,
      'CreateDate': instance.createDate.toIso8601String(),
      'HotelDefectMedias': instance.hotelDefectMedias,
    };

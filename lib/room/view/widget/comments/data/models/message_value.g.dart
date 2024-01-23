// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageValueImpl _$$MessageValueImplFromJson(Map<String, dynamic> json) =>
    _$MessageValueImpl(
      text: json['Text'] as String? ?? '',
      date:
          json['Date'] == null ? null : DateTime.parse(json['Date'] as String),
      personId: json['PersonId'] as int? ?? 0,
      personName: json['PersonName'] as String? ?? '',
      isEdited: json['IsEdited'] as bool? ?? false,
      medias: (json['Medias'] as List<dynamic>?)
              ?.map((e) => ProblemMedia.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProblemMedia>[],
    );

Map<String, dynamic> _$$MessageValueImplToJson(_$MessageValueImpl instance) =>
    <String, dynamic>{
      'Text': instance.text,
      'Date': instance.date?.toIso8601String(),
      'PersonId': instance.personId,
      'PersonName': instance.personName,
      'IsEdited': instance.isEdited,
      'Medias': instance.medias,
    };

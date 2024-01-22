// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioModelImpl _$$AudioModelImplFromJson(Map<String, dynamic> json) =>
    _$AudioModelImpl(
      isFromApi: json['isFromApi'] as bool? ?? false,
      audio: json['audio'] as String? ?? '',
    );

Map<String, dynamic> _$$AudioModelImplToJson(_$AudioModelImpl instance) =>
    <String, dynamic>{
      'isFromApi': instance.isFromApi,
      'audio': instance.audio,
    };

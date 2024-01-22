// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageModelImpl _$$ImageModelImplFromJson(Map<String, dynamic> json) =>
    _$ImageModelImpl(
      isFromApi: json['isFromApi'] as bool? ?? false,
      isFromCamera: json['isFromCamera'] as bool? ?? false,
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$$ImageModelImplToJson(_$ImageModelImpl instance) =>
    <String, dynamic>{
      'isFromApi': instance.isFromApi,
      'isFromCamera': instance.isFromCamera,
      'image': instance.image,
    };

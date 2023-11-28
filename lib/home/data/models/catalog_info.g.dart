// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatalogInfoImpl _$$CatalogInfoImplFromJson(Map<String, dynamic> json) =>
    _$CatalogInfoImpl(
      id: json['Id'] as int,
      shortDesc: json['ShortDesc'] as String,
      longDesc: json['LongDesc'] as String,
    );

Map<String, dynamic> _$$CatalogInfoImplToJson(_$CatalogInfoImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ShortDesc': instance.shortDesc,
      'LongDesc': instance.longDesc,
    };

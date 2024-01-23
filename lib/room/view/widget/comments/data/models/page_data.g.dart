// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageMessagesDataImpl _$$PageMessagesDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PageMessagesDataImpl(
      data: (json['Data'] as List<dynamic>?)
              ?.map((e) => MessageValue.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <MessageValue>[],
    );

Map<String, dynamic> _$$PageMessagesDataImplToJson(
        _$PageMessagesDataImpl instance) =>
    <String, dynamic>{
      'Data': instance.data,
    };

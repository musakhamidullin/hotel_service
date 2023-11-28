// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      id: json['Id'] as int,
      floor: json['Floor'] as String,
      cleanStatusId: json['CleanStatusId'] as int,
      cleaningType: json['CleaningType'] as int,
      roomNumber: json['RoomNumber'] as String,
      roomStatus: json['RoomStatus'] as bool,
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Floor': instance.floor,
      'CleanStatusId': instance.cleanStatusId,
      'CleaningType': instance.cleaningType,
      'RoomNumber': instance.roomNumber,
      'RoomStatus': instance.roomStatus,
    };

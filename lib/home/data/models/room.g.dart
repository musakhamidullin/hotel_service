// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
      id: json['Id'] as int? ?? 0,
      floor: json['Floor'] as int? ?? 0,
      cleanStatusId: json['CleanStatusId'] as int? ?? 0,
      cleaningType: json['CleaningType'] as int? ?? 0,
      roomStatusId: json['RoomStatusId'] as int? ?? 0,
      roomNumber: json['RoomNumber'] as String? ?? '',
      roomStatus: json['RoomStatus'] as String? ?? '',
      roomType: json['RoomType'] as String? ?? '',
      roomId: json['RoomId'] as int? ?? 0,
      cleanStatusName: json['CleanStatusName'] as String? ?? '',
      cleaningTypeName: json['CleaningTypeName'] as String? ?? '',
      arrdate: json['Arrdate'] == null
          ? ''
          : const DateSerializer().fromJson(json['Arrdate']),
      depdate: json['Depdate'] == null
          ? ''
          : const DateSerializer().fromJson(json['Depdate']),
      defects: (json['Defects'] as List<dynamic>?)
              ?.map((e) => Defect.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Floor': instance.floor,
      'CleanStatusId': instance.cleanStatusId,
      'CleaningType': instance.cleaningType,
      'RoomStatusId': instance.roomStatusId,
      'RoomNumber': instance.roomNumber,
      'RoomStatus': instance.roomStatus,
      'RoomType': instance.roomType,
      'RoomId': instance.roomId,
      'CleanStatusName': instance.cleanStatusName,
      'CleaningTypeName': instance.cleaningTypeName,
      'Arrdate': const DateSerializer().toJson(instance.arrdate),
      'Depdate': const DateSerializer().toJson(instance.depdate),
      'Defects': instance.defects,
    };

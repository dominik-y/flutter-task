// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogImpl _$$LogImplFromJson(Map<String, dynamic> json) => _$LogImpl(
      id: json['id'] as String,
      type: json['type'] as String?,
      payload: json['payload'] as String?,
      public: json['public'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$LogImplToJson(_$LogImpl instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'payload': instance.payload,
      'public': instance.public,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

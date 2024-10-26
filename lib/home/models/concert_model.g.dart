// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConcertModelImpl _$$ConcertModelImplFromJson(Map<String, dynamic> json) =>
    _$ConcertModelImpl(
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      place: json['place'] as String,
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$$ConcertModelImplToJson(_$ConcertModelImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'date': instance.date,
      'images': instance.images,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'place': instance.place,
      'price': instance.price,
    };

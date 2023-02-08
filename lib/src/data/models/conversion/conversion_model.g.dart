// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversionModel _$ConversionModelFromJson(Map json) => ConversionModel(
      result: (json['result'] as num).toDouble(),
      date: json['date'] as String,
      query: Map<String, dynamic>.from(json['query'] as Map),
      info: Map<String, dynamic>.from(json['info'] as Map),
    );

Map<String, dynamic> _$ConversionModelToJson(ConversionModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'date': instance.date,
      'query': instance.query,
      'info': instance.info,
    };

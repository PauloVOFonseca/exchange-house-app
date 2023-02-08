import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversion_model.g.dart';

@JsonSerializable(anyMap: true)
class ConversionModel {
  final double result;
  final String date;
  final Map<String, dynamic> query;
  final Map<String, dynamic> info;

  ConversionModel({
    required this.result,
    required this.date,
    required this.query,
    required this.info,
  });

  factory ConversionModel.fromJson(Map<String, dynamic> json) =>
      _$ConversionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConversionModelToJson(this);

  ConversionEntity toEntity() => _$ConversionModelToEntity(this);
}

ConversionEntity _$ConversionModelToEntity(ConversionModel conversionModel) {
  return ConversionEntity(
    result: conversionModel.result,
    date: conversionModel.date,
    query: conversionModel.query,
    info: conversionModel.info,
  );
}

import 'package:dio/dio.dart';
import 'package:exchange_house_app/src/application/constants/endpoints.dart';
import 'package:exchange_house_app/src/application/constants/secret_key.dart';
import 'package:exchange_house_app/src/data/data_sources/conversion/conversion_datasource.dart';
import 'package:exchange_house_app/src/data/models/conversion/conversion_model.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_request_entity.dart';

class ConversionDatasourceImp implements ConversionDatasource {
  final Dio dio = Dio();

  @override
  Future<ConversionEntity> getConversion({
    required ConversionRequestEntity entity,
  }) async {
    try {
      String replacedEndpoint = Endpoints.convert
          .replaceFirst("{to}", entity.convertCoin)
          .replaceFirst("{from}", entity.baseCoin)
          .replaceFirst("{amount}", entity.amount.toString());

      final response = await dio.get(replacedEndpoint,
          options: Options(headers: {"apikey": SECRET_API_KEY}));

      return ConversionModel.fromJson(response.data).toEntity();
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

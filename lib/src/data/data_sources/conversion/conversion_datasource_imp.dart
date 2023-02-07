import 'package:exchange_house_app/src/data/data_sources/conversion/conversion_datasource.dart';

class ConversionDatasourceImp implements ConversionDatasource {
  @override
  Future<dynamic> getConversion() async {
    try {
      String response = 'TESTE';

      return response;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

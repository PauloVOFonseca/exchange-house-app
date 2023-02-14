import 'package:exchange_house_app/src/application/constants/db_tables.dart';
import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/data/clients/db/db_client.dart';
import 'package:exchange_house_app/src/data/data_sources/conversion_history/conversion_history_datasource.dart';
import 'package:exchange_house_app/src/domain/entities/conversion_history/conversion_history_entity.dart';

class ConversionHistoryDatasourceImp implements ConversionHistoryDatasource {
  final DBClient dbClient = getIt<DBClient>();

  @override
  Future<bool> saveConversion({
    required ConversionHistoryEntity entity,
  }) async {
    try {
      await dbClient.insert(
        DBTablesKey.history,
        entity.toJson(),
      );

      return true;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<ConversionHistoryEntity>> getHistory() async {
    try {
      final List<ConversionHistoryEntity> allConversionList = [];

      List<Map<String, dynamic>> result =
          await dbClient.queryAllRows(DBTablesKey.history);

      if (result.isNotEmpty) {
        for (var element in result) {
          allConversionList.add(ConversionHistoryEntity.fromJson(element));
        }

        return allConversionList;
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

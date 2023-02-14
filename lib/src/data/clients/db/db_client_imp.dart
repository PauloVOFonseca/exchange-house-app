import 'package:exchange_house_app/src/application/services/database/db.dart';
import 'package:exchange_house_app/src/data/clients/db/db_client.dart';
import 'package:sqflite/sqlite_api.dart';

class DBClientImp extends DBClient {
  late Database _db;

  @override
  Future queryAllRows(String table, {int? limit}) async {
    _db = await DB.instance.database;
    return await _db.query(table);
  }
  
  @override
  Future insert(String table, Map<String, dynamic> values) async {
    _db = await DB.instance.database;

    return await _db.insert(table, values);
  }
}

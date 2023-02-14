import 'package:exchange_house_app/src/application/services/database/tables.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  static Database? _database;

  get database async {
    if (_database != null) return instance;

    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'exchange.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(db, version) async {
    await db.execute(Tables.history);
  }
}

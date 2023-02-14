abstract class DBClient {
  Future queryAllRows(String table, {int? limit});
  Future insert(String table, Map<String, dynamic> values);
}

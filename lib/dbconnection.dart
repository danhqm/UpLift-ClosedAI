import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:postgres/postgres.dart';

class DatabaseConnection {
  //Singleton connection only
  static final DatabaseConnection _instance = DatabaseConnection._internal();
  factory DatabaseConnection() => _instance;
  DatabaseConnection._internal();

  PostgreSQLConnection? _connection;

  Future<PostgreSQLConnection> getConnection() async {
    if (_connection == null || _connection!.isClosed) {
      await _connect();
    }
    return _connection!;
  }

  Future<void> _connect() async {
    String host = dotenv.get('DB_HOST');
    int port = int.parse(dotenv.get('DB_PORT'));
    String dbName = dotenv.get('DB_NAME');
    String username = dotenv.get('DB_USER');
    String password = dotenv.get('DB_PASSWORD');

    _connection = PostgreSQLConnection(
      host,
      port,
      dbName,
      username: username,
      password: password,
      useSSL: true,
    );

    await _connection!.open();
  }

  Future<void> closeConnection() async {
    if (_connection != null && !_connection!.isClosed) {
      await _connection!.close();
    }
  }

}

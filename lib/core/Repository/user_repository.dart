import 'package:dio/dio.dart';
import 'package:fashol_purchase_tracking_flutter/core/model/user_model.dart';
import 'package:mysql1/mysql1.dart';

class UserRepository {
  final Dio _dio = Dio();

  // Future<List<UserModel>> fetchUser() async {}

  Future<Future<Results>> fetchUser() async {
    var settings = ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'admin',
        password: '',
        db: 'fashol_erp');
    var conn = await MySqlConnection.connect(settings);

    var result = conn.query("select * from user where id = 1");
    return result;
  }
}

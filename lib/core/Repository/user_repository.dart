import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fashol_purchase_tracking_flutter/core/model/user_model.dart';
import 'package:mysql1/mysql1.dart';

class UserRepository {
  final Dio dio = Dio();

  Future<UserModel> login(String email, String password) async {
    final response = await dio.post(
      "http://192.168.0.127:3000/login",
      data: {"email": email, "password": password},
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // final response = await dio.get("http://192.168.0.127:3000/data");

    // print("object");

    if (response.statusCode == 200) {
      final data = response.data;
      return UserModel.fromJson(data);
    } else {
      throw Exception('Failed to load users');
    }
  }
}

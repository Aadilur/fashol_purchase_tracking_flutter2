import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fashol_purchase_tracking_flutter/core/model/user_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
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

    if (response.statusCode == 200) {
      final data = response.data;

      // List<dynamic> userJsonList = response.data as List;
      // print(userJsonList);
      print("object");

      var users = UserModel.fromJson(response.data);

      print(users.name);
      return UserModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load users');
    }
  }
}

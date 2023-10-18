import 'package:fashol_purchase_tracking_flutter/core/Repository/user_repository.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';

class UserViewModel extends GetxController {
  final RxBool isLoggedIn = false.obs;
  final UserRepository _repository = UserRepository();

  final users = UserModel().obs;

  void login(String email, String password) async {
    try {
      final data = await _repository.login(email, password);
      users.value = data;
    } catch (e) {
      Get.snackbar("Error", "There Was An ERROR $e");
    }
  }
}

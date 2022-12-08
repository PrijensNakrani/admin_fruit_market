import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  Future<User?> loginUser(
      {required String email, required String password}) async {
    try {
      isLoading.value = true;
      User? user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;
      if (user != null) {
        isLoading.value = true;
        return user;
      } else {
        print("Login Faild");
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
    return null;
  }
}

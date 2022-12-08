import 'package:admin_fruit_market/controller/auth_controller.dart';
import 'package:admin_fruit_market/get_category_ui/get_home_screen.dart';
import 'package:admin_fruit_market/widget/comom_text_field.dart';
import 'package:admin_fruit_market/widget/next_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    AuthController authController = Get.put(AuthController());
    print("hfjjjfj");
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlOcSoYbCCkX54QbkObjC4E3Oxn70DAepTJy2EnSc&s"),
                    radius: 65.r,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  CommonTextField(
                    controller: _emailController,
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                      if (!regex.hasMatch(value!)) {
                        return "Enter valid Email";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    labelText: "Email",
                    action: TextInputAction.next,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CommonTextField(
                      controller: _passwordController,
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (!regex.hasMatch(value!)) {
                          return "Enter valid password";
                        }
                      },
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "Password",
                      labelText: "Password",
                      action: TextInputAction.done,
                      obscureText: false),
                  SizedBox(
                    height: 50.h,
                  ),
                  Obx(
                    () => authController.isLoading.value == false
                        ? GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                authController
                                    .loginUser(
                                        email: _emailController.text,
                                        password: _passwordController.text)
                                    .then(
                                  (user) {
                                    if (user != null) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => GetHomeScreen(),
                                        ),
                                      );
                                      print(
                                          "${FirebaseAuth.instance.currentUser}");
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text("Login sucssesfully")));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  const Text("user invalide")));
                                    }
                                  },
                                );
                              }
                            },
                            child: NextContainer(text: "Login"),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

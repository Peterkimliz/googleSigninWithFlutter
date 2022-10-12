import 'package:digistore/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);
  AuthController authController=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FloatingActionButton.extended(
            icon: FaIcon(FontAwesomeIcons.google),
              onPressed: () {
              authController.signWithGoogle();
              }, label: Text("Sign in with google")),
        ),
      ),
    );
  }
}

import 'package:digistore/controllers/authController.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(),permanent: true);
  }
  
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  void goToLoginPage() {
    Get.toNamed('/login');
  }

  void register() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (isValidForm(email, password, name, lastName, phone, confirmPassword)) {
      Get.snackbar('Formulario válido', 'Todo Okey!');
    }
  }

  bool isValidForm(String email, String password, String name, String lastName,
      String phone, String confirmPassword) {
    if (email.isEmpty) {
      Get.snackbar(
          'Formulario no válido', 'Debes ingresar tu correo electrónico');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
          'Formulario no válido', 'El correo electrónico no es válido');
      return false;
    }

    if (name.isEmpty) {
      Get.snackbar('Formulario no válido', 'Debes ingresar tus nombres');
      return false;
    }

    if (lastName.isEmpty) {
      Get.snackbar('Formulario no válido', 'Debes ingresar tus apellidos');
      return false;
    }

    if (phone.isEmpty) {
      Get.snackbar('Formulario no válido', 'Debes ingresar tus teléfono');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no válido', 'Debes ingresar el password');
      return false;
    }

    if (confirmPassword.isEmpty) {
      Get.snackbar('Formulario no válido',
          'Debes ingresar la confirmación del password');
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar('Formulario no válido', 'Las contraseñas no coinciden');
      return false;
    }

    return true;
  }
}

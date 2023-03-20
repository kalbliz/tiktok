import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiktok/app/services/firebase_services/firebase_services.dart';
import 'package:tiktok/app/utilities/dialogue/general_dialogue.dart';
import 'package:tiktok/app/utilities/enums/enums.dart';

class LoginController extends GetxController {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final thisViewState = ViewState.idle.obs;
  final generalDialogue = GeneralDialog();
  final FirebaseService firebaseService = Get.find<FirebaseService>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }



  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future signInUser({required String email, required String password}) async {
    thisViewState.value = ViewState.busy;
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseService.firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password);
        debugPrint('login success');
      } else {
        generalDialogue.errorMessage(
          'Please fill all fields',
        );
      }
    } catch (e) {
      generalDialogue.errorMessage(e.toString());
    }
    thisViewState.value = ViewState.idle;
  }
}

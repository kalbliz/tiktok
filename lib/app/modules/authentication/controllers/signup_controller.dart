// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tiktok/app/models/user/user_model.dart' as model;
import 'package:tiktok/app/services/firebase_services/firebase_services.dart';
import 'package:tiktok/app/utilities/dialogue/general_dialogue.dart';
import 'package:tiktok/app/utilities/enums/enums.dart';

class SignUpController extends GetxController {
  final thisViewState = ViewState.idle.obs;
  final usernameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final FirebaseService firebaseService = Get.find<FirebaseService>();
  final Rx<File> _pickedimage = File('').obs;
  final Rx<File> file = File('').obs;
  File? get profilePhoto => _pickedimage.value;
  final generalDialogue = GeneralDialog();
  late final ImagePicker _picker;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _picker = ImagePicker();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      debugPrint(pickedImage.path.toString());
      generalDialogue.successMessage('Success', 'Image picked');
    } else {
      generalDialogue.errorMessage(
        'Failed',
      );
    }
    // _pickedimage = Rx<File?>(File(pickedImage!.path));
  }

  pickHeroImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    print("image path is : ${image?.path}");
    if (image != null) {
      file.value = File(image.path);
      _pickedimage.value = File(image.path);
      print("sending path is:${file.value.path}");
    }
  }

  Future<String> uploadFileToFireStore(File image) async {
    Reference ref = firebaseService.firebaseStorage
        .ref()
        .child('profilepic')
        .child(firebaseService.firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future registerUser(
      String username, String email, String password, File? image) async {
    thisViewState.value = ViewState.busy;
    try {
      if (username.isNotEmpty && password.isNotEmpty && image != null) {
        UserCredential credentials = await firebaseService.firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        String downloadUrl = await uploadFileToFireStore(image);
        model.User user = model.User(
            name: username,
            profilePhoto: downloadUrl,
            email: email,
            uid: credentials.user!.uid);
        await firebaseService.firebaseStore
            .collection('user')
            .doc(credentials.user!.uid)
            .set(user.toJson());
      } else {
        generalDialogue.errorMessage(
          'Please fill all fields',
        );
        debugPrint('error');
      }
    } catch (e) {
      debugPrint(e.toString());
      generalDialogue.errorMessage(
        e.toString(),
      );
    }
    thisViewState.value = ViewState.idle;
  }
}

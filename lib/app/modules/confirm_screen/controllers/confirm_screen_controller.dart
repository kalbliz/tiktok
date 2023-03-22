import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiktok/app/models/videos/video_model.dart';
import 'package:tiktok/app/services/firebase_services/firebase_services.dart';
import 'package:tiktok/app/utilities/dialogue/general_dialogue.dart';
import 'package:tiktok/app/utilities/enums/enums.dart';
import 'package:video_compress/video_compress.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreenController extends GetxController {
  //TODO: Implement ConfirmScreenController
  final thisViewState = ViewState.idle.obs;
  final FirebaseService firebaseService = Get.find<FirebaseService>();
  late VideoPlayerController videoPlayerController;
  final TextEditingController songEditingController = TextEditingController();
  final TextEditingController captionEditingController =
      TextEditingController();
  final argument = Get.arguments;
  final count = 0.obs;
  final GeneralDialog generalDialog = GeneralDialog();
  @override
  void onInit() async {
    super.onInit();
    debugPrint(argument[0]['videoFile'].toString());
    debugPrint(argument[0]['videoPath'].toString());
    videoPlayerController =
        VideoPlayerController.file(argument[0]['videoFile']);
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setVolume(1);
    videoPlayerController.setLooping(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
  }

  void increment() => count.value++;

  _getThumbnail({required String videoPath}) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  compressVideo({required String videoPath}) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath.removeAllWhitespace,
      quality: VideoQuality.LowQuality,
      deleteOrigin: false,
    );
    debugPrint('video compressed');
    return compressedVideo!.file;
  }

  Future<String> _uploadVideoToStorage(
      {required String id, required String videoPath}) async {
    Reference reference =
        firebaseService.firebaseStorage.ref().child('videos').child(id);
    UploadTask uploadTask =
        reference.putFile(await compressVideo(videoPath: videoPath));
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    debugPrint('video uploaded to storage');
    return downloadUrl;
  }

  Future<String> _uploadImageToStorage(
      {required String id, required String videoPath}) async {
    Reference reference =
        firebaseService.firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask =
        reference.putFile(await _getThumbnail(videoPath: videoPath));
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    debugPrint('thumbnail uploaded to storage');
    return downloadUrl;
  }

  uploadVideo(
      {required String songName,
      required String caption,
      required String videoPath}) async {
    thisViewState.value = ViewState.busy;
    try {
      String uid = firebaseService.firebaseAuth.currentUser!.uid;
      DocumentSnapshot documentSnapshot =
          await firebaseService.firebaseStore.collection('user').doc(uid).get();
      var allDocuments =
          await firebaseService.firebaseStore.collection('videos').get();
      int length = allDocuments.docs.length;
      String videoUrl = await _uploadVideoToStorage(
          id: 'Video $length', videoPath: videoPath);
      String thumbnail = await _uploadImageToStorage(
          id: 'Video $length', videoPath: videoPath);
      VideoModel videoModel = VideoModel(
          username: (documentSnapshot.data()! as Map<String, dynamic>)['name'],
          id: "Video $length",
          uid: uid,
          songName: songName,
          caption: caption,
          videoUrl: videoUrl,
          thumbnail: thumbnail,
          profilePhoto: (documentSnapshot.data()!
              as Map<String, dynamic>)['profilePhoto'],
          likes: [],
          commentCount: 0,
          shareCount: 0);
      debugPrint(' starting video uploaded to store');
      await firebaseService.firebaseStore
          .collection('videos')
          .doc('Video $length')
          .set(videoModel.toJson());
      debugPrint('video uploaded to store');
      Get.back();
    } catch (e) {
      print(e);
      generalDialog.errorMessage(e.toString());
    }
    thisViewState.value = ViewState.idle;
  }
}

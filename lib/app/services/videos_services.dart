import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tiktok/app/models/videos/video_model.dart';
import 'package:tiktok/app/services/firebase_services/firebase_services.dart';

class VideoServices extends GetxService {
  final Rx<List<VideoModel>> _videoList = Rx<List<VideoModel>>([]);
  List<VideoModel> get videoList => _videoList.value;
  final firebaseServices = Get.find<FirebaseService>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _videoList.bindStream(
      firebaseServices.firebaseStore.collection('videos').snapshots().map(
        (QuerySnapshot querySnapshot) {
          List<VideoModel> retrivedVideos = [];
          for (var element in querySnapshot.docs) {
            retrivedVideos.add(VideoModel.fromSnap(element));
          }
          return retrivedVideos;
        },
      ),
    );
  }

  likeVideo(String id) async {
    DocumentSnapshot documentSnapshot =
        await firebaseServices.firebaseStore.collection('videos').doc(id).get();

    var uid = firebaseServices.user.uid;

    if ((documentSnapshot.data()! as dynamic)['likes'].contains(uid)) {
      await firebaseServices.firebaseStore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayRemove([uid])
      });
    } else {
      await firebaseServices.firebaseStore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayUnion([uid])
      });
    }
  }
}

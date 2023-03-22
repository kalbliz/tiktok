// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {
  final String username;
  final String id;
  final String uid;
  final String songName;
  final String caption;
  final String videoUrl;
  final String thumbnail;
  final String profilePhoto;
  final List likes;
  final int commentCount;
  final int shareCount;
  VideoModel({
    required this.username,
    required this.id,
    required this.uid,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.thumbnail,
    required this.profilePhoto,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "id": id,
        "uid": uid,
        "songName": songName,
        "caption": caption,
        "videoUrl": videoUrl,
        "thumbnail": thumbnail,
        "profilePhoto": profilePhoto,
        "likes": likes,
        "commentCount": commentCount,
        "shareCount": shareCount,
      };

  static VideoModel fromSnap(DocumentSnapshot documentSnapshot) {
    var snapShot = documentSnapshot.data() as Map<String, dynamic>;

    return VideoModel(
        username: snapShot["username"],
        id: snapShot["id"],
        uid: snapShot["uid"],
        songName: snapShot["songName"],
        caption: snapShot["caption"],
        videoUrl: snapShot["videoUrl"],
        thumbnail: snapShot["thumbnail"],
        profilePhoto: snapShot["profilePhoto"],
        likes: snapShot["likes"],
        commentCount: snapShot["commentCount"],
        shareCount: snapShot["shareCount"]);
  }
}

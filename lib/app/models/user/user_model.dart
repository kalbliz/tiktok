// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String profilePhoto;
  final String email;
  final String uid;
  User({
    required this.name,
    required this.profilePhoto,
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'profilePhoto': profilePhoto,
        'email': email,
        'uid': uid,
      };

  static User fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return User(
      name: documentSnapshot['name'],
      profilePhoto: documentSnapshot['profilePhoto'],
      email: documentSnapshot['email'],
      uid: documentSnapshot['uid'],
    );
  }
}

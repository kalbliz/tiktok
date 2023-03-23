import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/app/modules/authentication/controllers/signup_controller.dart';
import 'package:tiktok/app/routes/app_pages.dart';
import 'package:tiktok/app/services/firebase_services/firebase_services.dart';
import 'package:tiktok/app/services/videos_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(FirebaseService());
    Get.put(VideoServices());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      title: 'TikTok Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey),
    );
  }
}

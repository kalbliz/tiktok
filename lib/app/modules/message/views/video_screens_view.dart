import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_screens_controller.dart';

class MessagesView extends GetView<MessagesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VideoScreensView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VideoScreensView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

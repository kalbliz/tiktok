import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/confirm_screen_controller.dart';

class ConfirmScreenView extends GetView<ConfirmScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConfirmScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ConfirmScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

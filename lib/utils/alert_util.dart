import 'package:configuration/route/xmd_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertUtil {
  static showLoading() {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ],
          );
        });
  }

  static hideLoading() {
    XMDRouter.pop();
  }

  static showToast(String message) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 2000),
        padding: const EdgeInsets.all(8.0),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}

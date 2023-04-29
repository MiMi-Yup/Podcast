import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
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
    BuildContext context = Get.context!;
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        content: Text(
          message,
          style: mST14R.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black),
        ),
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

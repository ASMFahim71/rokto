import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rokto/core/common/utils/app_color.dart';

toastInfo(
  String str, {
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: str,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.sp,
    gravity: ToastGravity.SNACKBAR,
  );
}

class AppBox {
  static void confirmPopup(
    BuildContext context,
    String title,
    String content,
    VoidCallback onConfirm,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: const Text("Confirm"),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                onConfirm(); // Execute the callback
              },
            ),
          ],
        );
      },
    );
  }
}

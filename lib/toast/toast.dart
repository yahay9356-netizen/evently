import 'package:flutter/material.dart';

class Toast {
  static void show({
    required String title,
    required BuildContext context,
    ToastType type = ToastType.success,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: type.color,
      ),
    );
  }
}

enum ToastType {
  error(color: Colors.red),
  success(color: Colors.green);

  final Color color;

  const ToastType({required this.color});
}

import 'package:enntly/auth/screen/auth_srvece.dart';
import 'package:enntly/toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool isloading = false;
  User? user;

  Future<void> createAccount({
    required String emailAddress,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    isloading = true;
    notifyListeners();
    try {
      user = await AuthSrvece.creatAcount(
        emailAddress: emailAddress,
        password: password,
        name: name,
      );
      if (context.mounted) {
        Toast.show(
          title: "welcome $name",
          context: context,
          type: ToastType.success,
        );
      }
    } catch (e) {
      user = null;
      if (context.mounted) {
        Toast.show(
          title: e.toString(),
          context: context,
          type: ToastType.error,
        );
      }
    }
    isloading = false;
    notifyListeners();
  }

  Future<void> login({
    required String emailAddress,
    required String password,
    required BuildContext context,
  }) async {
    isloading = true;
    notifyListeners();
    try {
      user = await AuthSrvece.login(
        emailAddress: emailAddress,
        password: password,
      );
      if (context.mounted) {
        Toast.show(
          title: "welcome ${user?.displayName ?? ''}",
          context: context,
          type: ToastType.success,
        );
      }
    } catch (e) {
      user = null;
      if (context.mounted) {
        Toast.show(
          title: e.toString(),
          context: context,
          type: ToastType.error,
        );
      }
    }
    isloading = false;
    notifyListeners();
  }

  Future<void> loginWithGoogle({required BuildContext context}) async {
    isloading = true;
    notifyListeners();
    try {
      final credential = await AuthSrvece.signInWithGoogle();

      if (credential != null) {
        user = credential.user;
        if (context.mounted) {
          Toast.show(
            title: "welcome ${user?.displayName ?? ''}",
            context: context,
            type: ToastType.success,
          );
        }
      } else {
        user = null;
      }
    } catch (e) {
      user = null;
      if (context.mounted) {
        Toast.show(
          title: 'Google sign-in failed: $e',
          context: context,
          type: ToastType.error,
        );
      }
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
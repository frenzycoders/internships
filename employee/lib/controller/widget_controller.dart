import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetController extends GetxController {
  RxBool logoutProcess = false.obs;
  showDialouge(
      {required BuildContext context,
      required String text,
      required Widget widget,
      required List<Widget> actions}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      useRootNavigator: true,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(10),
          title: Text(
            text,
            style: GoogleFonts.firaSans(
              color: Colors.indigo.shade600,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          content: widget,
          actions: actions,
        );
      },
    );
  }

  setLogoutProgress({required bool value}) {
    logoutProcess.value = value;
  }

  shoeSnackBar({required BuildContext context, required Widget widget}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: widget,
    ));
  }

  rightSlidePage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return page;
        },
        transitionsBuilder: (context, animation, secondAnimation, child) {
          return SlideTransition(
            position:
                animation.drive(Tween(begin: Offset(1, 0), end: Offset(0, 0))),
            child: child,
          );
        },
      ),
    );
  }
}

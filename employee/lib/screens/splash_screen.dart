import 'dart:io';

import 'package:employee/controller/index.dart';
import 'package:employee/models/user_models.dart';
import 'package:employee/screens/login_screen.dart';
import 'package:employee/utils/index.dart';
import 'package:employee/widgets/index.dart';
import 'package:employee/widgets/stylish_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late WidgetController _widgetController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widgetController = Get.find<WidgetController>();
    changeScreen();
  }

  changeScreen() async {
    StorageController storageController = Get.find<StorageController>();
    ApiController apiController = Get.find<ApiController>();
    WidgetController uiWidgetController = Get.find<WidgetController>();
    await storageController.getToken();
    if (storageController.token.isEmpty) {
    } else {
      try {
        await apiController.getUserProfile(notes: false);
        Get.offAndToNamed('/home');
      } on HttpException catch (e) {
        uiWidgetController.showDialouge(
          context: context,
          text: 'Error !',
          widget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(e.toString()),
                ),
              ),
            ],
          ),
          actions: [
            StylishButton(
              onTap: () {
                Navigator.of(context).pop();
                changeScreen();
              },
              text: 'RETRY',
            ),
            StylishButton(
              onTap: () {
                exit(0);
              },
              text: 'EXIT',
            )
          ],
        );
      } on HttpExceptionWithStatus catch (e) {
        uiWidgetController.showDialouge(
          context: context,
          text: 'Token Expire. Login Again !!',
          widget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(e.message),
                ),
              ),
            ],
          ),
          actions: [
            StylishButton(
              onTap: () {
                storageController.storeToken(token: '');
                storageController.changeProfileValue(
                  profile: UserProfile(
                      id: '', name: '', username: '', email: '', status: false),
                );
                Get.offAndToNamed('/login');
              },
              text: 'Login',
            ),
            StylishButton(
              onTap: () {
                exit(0);
              },
              text: 'EXIT',
            )
          ],
        );
      } catch (e) {
        uiWidgetController.showDialouge(
          context: context,
          text: 'Error !',
          widget: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              alignment: Alignment.center,
              child: Text(e.toString()),
            ),
          ),
          actions: [
            StylishButton(
              onTap: () {
                Navigator.of(context).pop();
                changeScreen();
              },
              text: 'RETRY',
            ),
            StylishButton(
              onTap: () {
                exit(0);
              },
              text: 'EXIT',
            )
          ],
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: StylishText(
                  firstTxt: "WEL",
                  secondTxt: "COME",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 0, left: 10, right: 10),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/bg.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    alignment: Alignment.center,
                    child: Text(
                      'Please press next to login',
                      style: GoogleFonts.firaSans(
                          fontSize: 10, color: Colors.orange.withOpacity(0.7)),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  color: Colors.indigo,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: Text(
                    'NEXT',
                    style: GoogleFonts.firaSans(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// 20801

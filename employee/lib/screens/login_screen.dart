import 'package:employee/controller/login_controller.dart';
import 'package:employee/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(builder: (logController) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 10,
              left: 10,
              right: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: StylishText(
                    firstTxt: 'LOG',
                    secondTxt: 'IN',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Column(
                  children: [
                    logController.showError.isTrue
                        ? Container(
                            alignment: Alignment.center,
                            child: Text(
                              logController.errorMessage,
                              style: GoogleFonts.firaSans(
                                color: Colors.red,
                              ),
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 5),
                      child: TextField(
                        controller: logController.usernameController,
                        enabled: !logController.isEnabled.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.indigo.shade600,
                          ),
                          labelText: 'username or email',
                          border: OutlineInputBorder(),
                          focusColor: Colors.indigo.shade600,
                        ),
                        style: GoogleFonts.firaSans(
                          color: Colors.indigo.shade600,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 5),
                      child: TextField(
                        controller: logController.passwordController,
                        enabled: !logController.isEnabled.value,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              logController.showHidePassword();
                            },
                            icon: logController.hidePassword.isTrue
                                ? const FaIcon(
                                    FontAwesomeIcons.eye,
                                  )
                                : const FaIcon(
                                    FontAwesomeIcons.eyeSlash,
                                  ),
                          ),
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.indigo.shade600,
                          ),
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          focusColor: Colors.indigo.shade600,
                        ),
                        obscureText: logController.hidePassword.value,
                        style: GoogleFonts.firaSans(
                          color: Colors.indigo.shade600,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: logController.remember.value,
                                  onChanged: (value) {
                                    logController.changeRememberValue(
                                        value: value!);
                                  },
                                ),
                                Text(
                                  'remember me',
                                  style: GoogleFonts.firaSans(
                                    color: Colors.orange.withOpacity(0.7),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            logController.isLoading.isFalse
                                ? TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Forgot password',
                                      style: GoogleFonts.firaSans(
                                        color: Colors.indigo.shade600,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 0,
                                    width: 0,
                                  ),
                          ],
                        ),
                      ),
                    ),
                    logController.isLoading.isTrue
                        ? Center(child: CircularProgressIndicator())
                        : StylishButton(
                            onTap: () async {
                              await logController.performLogin();

                              if (logController.showError.isFalse) {
                                Navigator.of(context).popAndPushNamed('/home');
                              }
                            },
                            text: 'Login',
                          ),
                  ],
                ),
                logController.isLoading.isTrue
                    ? Container()
                    : Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                              color: Colors.indigo.withOpacity(0.7),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'BACK',
                                style: GoogleFonts.firaSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            FlatButton(
                              color: Colors.orange.withOpacity(0.7),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/home');
                              },
                              child: Text(
                                'SKIP',
                                style: GoogleFonts.firaSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      )
              ],
            ),
          ),
        ),
      );
    });
  }
}

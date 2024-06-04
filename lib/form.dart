import 'dart:io';

import 'package:ap_ta_signup/Info.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildForm extends StatefulWidget {
  static final Uri _uri = Uri.parse('https://lms2.sbu.ac.ir');
// Colors:
  static const Color forgotPasswordText = Colors.deepPurple;
  static const Color signInButtonG1 = Color(0xe1961d6b);
  static const Color signInButtonG2 = Color(0xd3961d6b);
  static const Color signInButtonG3 = Color(0xbd961d6b);

  static const Color checkbox = Color(0xFF024335);
  static const Color signInBox = Color(0xFF024335);

  static const Color hintText = Color(0xFFB4B4B4);
  static const Color filledText = Colors.white24;
  static const Color inputBorder = Color(0xFF707070);

  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  TextEditingController studentID = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscure = true, userIDChecker = true, passwordChecker = true;
  String response = '';

  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    double enterButton = widthOfScreen * 0.6;

    return SizedBox(
      width: widthOfScreen,
      child: Stack(
        children: <Widget>[
          Positioned(
              left: 40,
              top: 25,
              child: SizedBox(
                width: 350,
                child: TextFormField(
                  controller: studentID,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: 'شماره دانشجویی',
                    labelStyle: const TextStyle(
                      color: BuildForm.inputBorder,
                      fontWeight: FontWeight.normal,
                    ),
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    hintText: '!شماره دانشجویی خود را وارد کنید',
                    hintStyle: const TextStyle(color: BuildForm.hintText),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.purple.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          // برای مثال اینم cost بذاریم
                          color: BuildForm.forgotPasswordText,
                          style: BorderStyle.solid),
                    ),
                  ),
                ),
              )),
          Positioned(
              left: 40,
              top: 125,
              child: SizedBox(
                width: 350,
                child: TextFormField(
                  controller: password,
                  obscureText: obscure,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: 'رمز عبور',
                    labelStyle: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.normal,
                    ),
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    hintText: '!رمز عبور را وارد کنید',
                    hintStyle: TextStyle(color: BuildForm.hintText),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscure ? Icons.visibility : Icons.visibility_off,
                        color: BuildForm.hintText,
                      ),
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.purple.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          // برای مثال اینم cost بذاریم
                          color: Colors.deepPurple.shade800,
                          style: BorderStyle.solid),
                    ),
                  ),
                ),
              )),
          userIDChecker && passwordChecker
              ? const Positioned(right: 38, left: 48, top: 211, child: Text(""))
              : userIDChecker
                  ? const Positioned(
                      right: 38,
                      left: 48,
                      top: 211,
                      child: Text(
                        '!خطا در ورود: رمز وارد شده درست نمی باشد',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: BuildForm.forgotPasswordText,
                            fontSize: 12,
                            fontFamily: 'Bnazanin',
                            fontWeight: FontWeight.w600),
                      ))
                  : const Positioned(
                      right: 38,
                      left: 48,
                      top: 211,
                      child: Text(
                        'خطا در ورود: شماره دانشجویی وارد شده در سیستم ثبت نشده است. ثبت نام کنید',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: BuildForm.forgotPasswordText,
                            fontSize: 12,
                            fontFamily: 'Bnazanin',
                            fontWeight: FontWeight.w600),
                      )),
          Positioned(
            top: 290,
            right: widthOfScreen * 0.37,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InfoScreen(),
                  ),
                );
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.navigate_before_rounded,
                    color: BuildForm.forgotPasswordText,
                  ),
                  Text("ثبت نام کنید",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'Poppins-Medium',
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ), // sign up text
          Positioned(
              top: 340,
              right: widthOfScreen * 0.18,
              child: InkWell(
                onTap: () async {
                  logIn();
                  if (userIDChecker && passwordChecker) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InfoScreen(),
                      ),
                    );
                  }
                },
                child: Container(
                  width: widthOfScreen * 0.61, // 250
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [
                          0.3,
                          0.6,
                          0.85,
                        ],
                        colors: [
                          BuildForm.signInButtonG1,
                          BuildForm.signInButtonG2,
                          BuildForm.signInButtonG3,
                        ]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.navigate_before_rounded,
                        textDirection: TextDirection.ltr,
                        color: Colors.white,
                      ),
                      SizedBox(width: enterButton * 0.33),
                      const Text(
                        'ورود',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontFamily: 'Bnazanin',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
              top: 405,
              left: 59,
              child: Container(
                height: 0.5,
                width: 312,
                color: BuildForm.inputBorder,
              )), // خط جدا کننده وسط
          Positioned(
              top: 425,
              left: widthOfScreen * 0.33,
              child: TextButton(
                  onPressed: () => setState(
                        () {
                          _launchInBrowserView(BuildForm._uri);
                        },
                      ),
                  child: const Text(
                    "ورود به سامانه یادگیری مجازی",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 10),
                  ))),
          Positioned(
              top: 477,
              left: 120,
              right: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 42,
                    height: 42,
                    child: Image.asset(
                      'images/Sbu-logo.png',
                      width: 25,
                      height: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "دانشکده مهندسی کامپیوتر - دانشگاه شهید بهشتی",
                    style: TextStyle(fontSize: 8),
                  )
                ],
              ))
        ],
      ),
    );
  }

  _launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  //connect server
  Future<String> logIn() async {
    await Socket.connect("192.168.0.104", 8080).then((serverSocket) {
      serverSocket
          .write('GET: logInChecker~${studentID.text}~${password.text}\u0000');
      serverSocket.flush();
      serverSocket.listen((socketResponse) {
        setState(() {
          response = String.fromCharCodes(socketResponse);
        });
      });
    });
    print("----------   server response is:  { $response }");

    if (response == "401") {
      userIDChecker = true;
      passwordChecker = false;
    } else if (response == "404") {
      userIDChecker = false;
      passwordChecker = false;
    } else if (response == "200") {
      userIDChecker = true;
      passwordChecker = true;
    }
    return response;
  }
}

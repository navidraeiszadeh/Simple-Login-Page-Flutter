import 'package:ap_ta_signup/temp.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildForm extends StatefulWidget {
  //در ابتدا براشون state less میزنم تا تهش ببینن چی میشه
  final Uri _url = Uri.parse('https://lms2.sbu.ac.ir');
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
  bool obscure = true, userNameChecker = false, passwordChecker = false;

  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    double enterButton = widthOfScreen * 0.6;
    bool isChecked = false;

    return SizedBox(
      width: widthOfScreen,
      child: Stack(
        // mishe be jaye stack az tarkib column va sized box va allignment estefade konim!
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
              // serfan dar soorat estefade az stack mitonim az positioned estefade konim
              //در ابتدا const باشه
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
          const Positioned(
              right: 38,
              left: 48,
              top: 211,
              child: Text(
                'رمزعبور خود را فراموش کرده اید؟',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: BuildForm.forgotPasswordText,
                    fontSize: 13,
                    fontFamily: 'Poppins-Medium',
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
                // in ham as avval nemizarim   TODO-> clikable
                //onTap: ,
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
                      /// as avval avval barash const tariif mikonim
                      const Icon(
                        Icons.navigate_before_rounded,
                        textDirection: TextDirection
                            .ltr, // in ro bayad search konim hamoon zaman video gereftan
                        color: Colors.white,
                      ),
                      SizedBox(width: enterButton * 0.33),
                      const Text(
                        'ورود',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: 'Poppins-Medium',
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
                width: 310,
                color: BuildForm.inputBorder,
              )), // خط جدا کننده وسط
          Positioned(
              top: 425,
              left: widthOfScreen * 0.26,
              child: TextButton(
                  onPressed: _launchURL,
                  child: const Text(
                    "ورود به سامانه یادگیری مجازی دانشگاه",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 12),
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

  _launchURL() async {
    const url = 'https://lms2.sbu.ac.ir';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

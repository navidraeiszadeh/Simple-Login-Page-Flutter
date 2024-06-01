import 'package:flutter/material.dart';
import 'form.dart';
import 'layers.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    double heigthOfScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: const [
                0.14,
                0.27,
                0.55,
                0.65,
                0.82,
                0.9
              ],
              colors: [
                Colors.purple.shade900,
                Colors.purple.shade800,
                Colors.purple.shade700,
                Colors.purple.shade400,
                Colors.purpleAccent.shade100,
                Colors.purple.shade100
              ]),
          //   image: DecorationImage(
          //   image: AssetImage('images/primaryBg.png'),
          //   fit: BoxFit.cover,
          //
          // )
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 55,
                left: widthOfScreen * 0.4,
                child: const Text(
                  'دانشجویار',
                  style: TextStyle(
                      fontSize: 22,
                      //fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
            Positioned(
                top: 100,
                left: widthOfScreen / 2 -
                    100, // /2 for find middle of page - 100 is - half of image width
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'images/logo.png',
                  ),
                )),
            Positioned(top: 275, right: 0, bottom: 0, child: LayerOne()),
            Positioned(
                top: 275 + widthOfScreen * 0.05,
                right: 0,
                bottom: 0,
                child: LayerTwo()),
            Positioned(
                top: heigthOfScreen * 0.33 + widthOfScreen * 0.05,
                right: 0,
                bottom: widthOfScreen * 0.05,
                left: 0,
                child: BuildForm()),
          ],
        ),
      ),
    );
  }
}

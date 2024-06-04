import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  static const Color backGroundTheme = Color(0xffff8593);
  static const Color contextThemeColor = Color(0xfff9f8fe);

  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backGroundTheme,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: widthOfScreen,
                      height: heightOfScreen * 28 / 80,
                      child: Column(
                        children: [
                          SizedBox(
                            height: heightOfScreen * 0.1,
                          ),
                          Container(
                            height: 148,
                            width: 145,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: contextThemeColor,
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 19),
                                Image.asset(
                                  'images/person.png',
                                  height: 129,
                                  width: 132,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          const Text(
                            "تقی تقوی",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Bnazanin',
                                fontSize: 29,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: widthOfScreen,
                        padding: EdgeInsets.all(30),
                        decoration: const BoxDecoration(
                          color: contextThemeColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: widthOfScreen * 0.83,
                              height: heightOfScreen * 0.19,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(27))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 23,
                                  ),
                                  Row(
                                    // textDirection: ,
                                    children: const [
                                      SizedBox(
                                        width: 22, // figmA
                                      ),
                                      Text("400243103",
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontFamily: 'Bnazanin',
                                              fontSize: 16)),
                                      SizedBox(
                                        width: 110, // figmA
                                      ),
                                      Text(" شماره دانشجویی",
                                          style: TextStyle(
                                              color: Colors.black,
                                              // fontFamily: 'Bnazanin',
                                              // fontSize: 16
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    height: 0.5,
                                    width: 280,
                                    color: Colors.black12,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    // textDirection: ,
                                    children: const [
                                      SizedBox(
                                        width: 22, // figmA
                                      ),
                                      Text("16",
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontFamily: 'Bnazanin',
                                              fontSize: 16)),
                                      SizedBox(
                                        width: 204, // figmA
                                      ),
                                      Text(" تعداد واحد",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    height: 0.5,
                                    width: 280,
                                    color: Colors.black12,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    // textDirection: ,
                                    children: const [
                                      SizedBox(
                                        width: 22, // figmA
                                      ),
                                      Text("17.78",
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontFamily: 'Bnazanin',
                                              fontSize: 16)),
                                      SizedBox(
                                        width: 198, // figmA
                                      ),
                                      Text("معدل کل ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 32),
                            Container(
                              width: widthOfScreen * 0.83,
                              height: heightOfScreen * 0.14,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(27))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 23,
                                  ),
                                  InkWell(
                                    // اit must be wrapped it last
                                    onTap: () => _showAlertDialog(context),
                                    child: Row(
                                      // textDirection: ,
                                      children: [
                                        const SizedBox(
                                          width: 160, // figmA
                                        ),
                                        const Text(" ویرایش مشخصات",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Colors.deepPurple),
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    height: 0.5,
                                    width: 280,
                                    color: Colors.black12,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    // textDirection: ,
                                    children: [
                                      const SizedBox(
                                        width: 218, // figmA
                                      ),
                                      const Text(" تغییر رمز",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: Colors.greenAccent),
                                        child: const Icon(
                                          Icons.change_circle,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: heightOfScreen * 0.11,
                            ),
                            Container(
                              width: widthOfScreen * 0.83,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: backGroundTheme,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: const Center(
                                  child: Text(
                                "حذف حساب کاربری",
                                style: TextStyle(
                                    fontFamily: 'Bnazanin',
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Text('ویرایش مشخصات کاربری',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Bnazanin',
                  fontSize: 26,
                  color: Colors.redAccent)),
          content: const Text(
              'جهت ویرایش اطلاعات کاربری خود به واحد راهبری دانشگاه مراجعه نمایید.',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: 'Bnazanin',
                fontSize: 20,
              )),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: const Text('فهمیدم'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

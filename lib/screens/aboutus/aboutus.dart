import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:giftex/screens/components/header.dart';
import 'package:giftex/viewmodel/service/serviceviewmodel.dart';

import '../components/footer/footer.dart';

ServiceViewModel serviceViewModel = ServiceViewModel();

class Aboutuspage extends StatefulWidget {
  const Aboutuspage({Key? key}) : super(key: key);

  @override
  _AboutuspageState createState() => _AboutuspageState();
}

class _AboutuspageState extends State<Aboutuspage> {
  int _pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    serviceViewModel.getWhoWeAre();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: Observer(builder: (context) {
        return serviceViewModel.isloading
            ? LinearProgressIndicator()
            : SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "ABOUT US",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.black,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${serviceViewModel.whoWeAreResponse.pageContent!.bannerItem!.title}".toUpperCase(),
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      // Container(
                      //   width: MediaQuery.of(context).size.width * .80,
                      //   child: Text(
                      //     "${serviceViewModel.whoWeAreResponse.pageContent!.bannerItem!.desc}",
                      //     textAlign: TextAlign.justify,
                      //     style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      //           color: Color(0XFF000000),
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //   ),
                      // ),
                      // const SizedBox(height: 16,),
                      Container(
                        height: 260,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 54,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: EdgeInsets.only(top: 30, bottom: 0),
                                child: Container(
                                  //replace this Container with your Card
                                  color: Color(0xff1F2A52),
                                  height: 160.0,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 54,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: EdgeInsets.only(top: 30, bottom: 0),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xff8C9FB1),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(265),
                                        bottomRight: Radius.circular(265),
                                      ),
                                    ),
                                    height: 140.0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                left: 0,
                                right: 0,
                                bottom: 54,
                                child: Image.network(
                                  "${serviceViewModel.whoWeAreResponse.pageContent!.bannerItem!.image!.mobile}",
                                  height: 220,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      //
                      // Padding(
                      //   padding: EdgeInsets.all(16),
                      //   child: HtmlWidget(
                      //     "${serviceViewModel.whoWeAreResponse.pageContent!.bannerItem!.desc}",
                      //     // textStyle: TextStyle(fontSize: 14),
                      //   ),
                      // ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "01",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                        color: Color(0XFF000000),
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                SizedBox(
                                  width: 10,
                                  height: 40,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("image/Line.png"),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                "WHO WE ARE",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0XFF000000),
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 5,
                            // ),

                            Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: HtmlWidget(
                                "${serviceViewModel.whoWeAreResponse.pageContent!.culture!.desc1}",
                                // textStyle: TextStyle(fontSize: 14),
                              ),
                            ),
                            // Text(
                            //   "${serviceViewModel.whoWeAreResponse.pageContent!.culture!.desc1}",
                            //   textAlign: TextAlign.start,
                            //   style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            //         color: Color(0XFF000000),
                            //         fontWeight: FontWeight.w500,
                            //       ),
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: HtmlWidget(
                                "${serviceViewModel.whoWeAreResponse.pageContent!.culture!.desc2}",
                                // textStyle: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),

                            Image.network(
                              "${serviceViewModel.whoWeAreResponse.pageContent!.culture!.image![0].mobile}",
                            ),

                            SizedBox(
                              height: 16,
                            ),

                            Container(
                              padding: EdgeInsets.only(right: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("image/Line.png"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "02",
                                        textAlign: TextAlign.end,
                                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                              color: Color(0XFF000000),
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Text(
                                      "${serviceViewModel.whoWeAreResponse.pageContent!.culture!.title}".toUpperCase(),
                                      textAlign: TextAlign.end,
                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                            color: Color(0XFF000000),
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 5,
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 16, right: 8),
                                    child: HtmlWidget(
                                      "${serviceViewModel.whoWeAreResponse.pageContent!.culture!.desc1}",
                                      // textStyle: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  // Text(
                                  //   "${serviceViewModel.whoWeAreResponse.pageContent!.culture!.desc1}",
                                  //   textAlign: TextAlign.start,
                                  //   style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  //         color: Color(0XFF000000),
                                  //         fontWeight: FontWeight.w500,
                                  //       ),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: HtmlWidget(
                                      "${serviceViewModel.whoWeAreResponse.pageContent!.culture!.desc2}",
                                      // textStyle: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  Image.network(
                                    "${serviceViewModel.whoWeAreResponse.pageContent!.culture!.image![0].mobile}",
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Container(
                            //replace this Container with your Card
                            // color: Color(0Xff3C5233),
                            // height: 260.0,
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "03",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                        color: Color(0XFF000000),
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset("image/Line.png"),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // SizedBox(height: 16,),
                            Text(
                              "${serviceViewModel.whoWeAreResponse.pageContent!.ourValues!.title}".toUpperCase(),
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0XFF000000),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            // SizedBox(
                            //   height: 15,
                            // ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: serviceViewModel.whoWeAreResponse.pageContent!.ourValues!.array!
                                    .map(
                                      (e) => Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Column(
                                          children: [
                                            HtmlWidget(
                                              "${e.desc}",
                                              // textStyle: TextStyle(fontSize: 14),
                                            ),
                                            Image.network(
                                              "${e.image!.mobile}",
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("image/Line.png"),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "04",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                  color: Color(0XFF000000),
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // SizedBox(height: 16,),
                      Text(
                        "${serviceViewModel.whoWeAreResponse.pageContent!.management!.title}".toUpperCase(),
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Color(0XFF000000),
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: HtmlWidget(
                          "${serviceViewModel.whoWeAreResponse.pageContent!.management!.desc}",
                          // textStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),

                      Column(
                        children: serviceViewModel.whoWeAreResponse.pageContent!.management!.expertProfile!
                            .map(
                              (e) => Container(
                                  height: 400,
                                  padding: EdgeInsets.all(16),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 90, bottom: 0),
                                        child: Center(
                                          child: Container(
                                            //replace this Container with your Card
                                            // color: Color(0Xff3C5233),
                                            // height: 260.0,
                                            child: Image.asset(
                                              "image/Rectangle (1).png",
                                              fit: BoxFit.fill,
                                              color: Color(0xffEAEEF2),
                                              width: 250,
                                              height: 510,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0, bottom: 10, left: 60),
                                        child: Column(
                                          children: [
                                            Container(
                                              //replace this Container with your Card
                                              // color: Color(0Xff3C5233),
                                              // height: 260.0,
                                              child: Image.network(
                                                e.image!.mobile ?? "",
                                                fit: BoxFit.fill,
                                                width: 200,
                                                height: 200,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              e!.name ?? "",
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0XFF000000),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              e!.designation ?? "",
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                    color: Color(0XFF000000),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Icon(
                                              Icons.mail_outline_rounded,
                                              color: Color(0XFF000000),
                                              size: 20,
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              e!.mail ?? "",
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                    color: Color(0XFF000000),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            )
                            .toList(),
                      ),

                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
                      Container(
                        color: Color(0xff1F2A52),
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}

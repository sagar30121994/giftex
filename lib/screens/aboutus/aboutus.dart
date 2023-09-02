import 'package:flutter/material.dart';
import 'package:giftex/screens/components/header.dart';

import '../components/footer/footer.dart';

class Aboutuspage extends StatefulWidget {
  const Aboutuspage({Key? key}) : super(key: key);

  @override
  _AboutuspageState createState() => _AboutuspageState();
}

class _AboutuspageState extends State<Aboutuspage> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .90,
          child: SingleChildScrollView(
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
                "LOREM IPSUM",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .80,
                child: Text(
                  "We feature premium artworks including modern, contemporary, and street art",
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0XFF000000),
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
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
                        child: Image.asset(
                          "image/2.png",
                          height: 220,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 565,
                padding: EdgeInsets.all(16),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 260 / 2.0, right: 0),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child: Image.asset(
                          "image/Rectangle (1).png",
                          fit: BoxFit.fill,
                          width: 200,
                          height: 510,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "01",
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
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
                          Text(
                            "WHO WE ARE",
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0XFF000000),
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Secure platform to conduct online auctions for Modern Indian and Contemporary art. ",
                            textAlign: TextAlign.start,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0XFF000000),
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "AstaGuru was conceptualised in the year 2008 with the sole purpose of creating a safe . ",
                            textAlign: TextAlign.start,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0XFF000000),
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Center(
                              child: Image.asset(
                            "image/3.png",
                            fit: BoxFit.fill,
                          )),
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset("image/Line.png"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "02",
                                      textAlign: TextAlign.end,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                            color: Color(0XFF000000),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "CULTURE AT ASTA GURU",
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        color: Color(0XFF000000),
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Secure platform to conduct online auctions for Modern Indian and Contemporary art. ",
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Color(0XFF000000),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "AstaGuru was conceptualised in the year 2008 with the sole purpose of creating a safe . ",
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Color(0XFF000000),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          )
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
                height: 451,
                padding: EdgeInsets.all(16),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 80, right: 70),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child: Image.asset(
                          "image/Rectangle (1).png",
                          fit: BoxFit.fill,
                          width: 200,
                          height: 340,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 80, left: 0),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child: Image.asset(
                          "image/4.png",
                          fit: BoxFit.fill,
                          width: 150,
                          height: 300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 100, right: 0),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "03",
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
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
                            "OUR VALUES",
                            textAlign: TextAlign.start,
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0XFF000000),
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 55, right: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "LOREM IPSUM",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        color: Color(0XFF000000),
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "ea commodo consequat. Duis aute irure dolor in ",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Color(0XFF000000),
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "LOREM IPSUM",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        color: Color(0XFF000000),
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "ea commodo consequat. Duis aute irure dolor in ",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Color(0XFF000000),
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "LOREM IPSUM",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        color: Color(0XFF000000),
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "ea commodo consequat. Duis aute irure dolor in ",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Color(0XFF000000),
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                    ),
                  ],
                ),
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
                "OUR MANAGEMENT",
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
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0XFF373737),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
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
                              child: Image.asset(
                                "image/5.png",
                                fit: BoxFit.fill,
                                width: 200,
                                height: 200,
                              ),
                            ),
                            // SizedBox(height: 10,),
                            Text(
                              "SEEMA VOHRA",
                              textAlign: TextAlign.end,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: Color(0XFF000000),
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Senior Manager",
                              textAlign: TextAlign.end,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
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
                              "seemavohra@astaguru.com",
                              textAlign: TextAlign.end,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Color(0XFF000000),
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width, child: Footer()),
              Container(
                color: Color(0xff1F2A52),
                height: 30,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          )),
        ),
      ),
    );
  }
}

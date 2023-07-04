import 'package:flutter/material.dart';

import '../components/footer/footer.dart';
import '../components/header.dart';

class Servicepage extends StatefulWidget {
  const Servicepage({Key? key}) : super(key: key);

  @override
  _ServicepageState createState() => _ServicepageState();
}

class _ServicepageState extends State<Servicepage> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height*.90,
          child: SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                "OUR SERVICES",
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 0.888889),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "FIND YOUR SERVICES THAT FITS YOUR NEEDS",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .80,
                child: Text(
                  "We feature premium artworks including modern, contemporary, and street art",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Color(0XFF000000), fontWeight: FontWeight.w500, letterSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 260,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 150 / 2.0, bottom: 0),
                      child: Container(
                        //replace this Container with your Card
                        color: Color(0Xff1F2A52),
                        height: 160.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 150 / 2.0, bottom: 0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff8C9FB1),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(250),
                              bottomRight: Radius.circular(250),
                            ),
                          ),
                          height: 140.0,
                        ),
                      ),
                    ),
                    Positioned(
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          "image/services.png",
                          height: 180,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .80,
                child: Text(
                  "WE OFFER MANY SERVICES TO \nOUR GREAT CUSTOMER",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Color(0XFF000000), fontWeight: FontWeight.w600, letterSpacing: 0.888889),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .85,
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0XFF373737),
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 170,
                padding: EdgeInsets.all(16),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 0,
                          ),
                          child: Container(
                            //replace this Container with your Card
                            // color: Color(0Xff3C5233),
                            // height: 260.0,
                            child: Image.asset("image/Rectangle (1).png",
                                fit: BoxFit.fill, width: 100, height: 150, color: Color(0xffEAEEF2)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 70,
                        top: 100 / 2,
                      ),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child:
                            Image.asset("image/Shape (9).png", fit: BoxFit.fill, width: 50, color: Color(0xff1F2A52)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 40 / 2,
                        top: 30,
                      ),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child: Row(
                          children: [
                            Text(
                              "01",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0xff1F2A52),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset("image/Line.png", color: Color(0xff1F2A52)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 130,
                        top: 90,
                      ),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child: Text(
                          "AUCTION",
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Color(0xff000000), fontWeight: FontWeight.w600, letterSpacing: 0.888889),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    width: MediaQuery.of(context).size.width * .80,
                    child: Text(
                      "AstaGuru, India's premium online auction house, caters to a niche strata of clientele globally since its inception in 2008. We conduct annual auctions for an impressive range of Art and Artefacts.",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Color(0XFF373737),
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 170,
                padding: EdgeInsets.all(16),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 0,
                          ),
                          child: Container(
                            //replace this Container with your Card
                            // color: Color(0Xff3C5233),
                            // height: 260.0,
                            child: Image.asset("image/Rectangle (1).png",
                                fit: BoxFit.fill, width: 100, height: 150, color: Color(0xffEAEEF2)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 70,
                        top: 100 / 2,
                      ),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child:
                            Image.asset("image/Shape (11).png", fit: BoxFit.fill, width: 50, color: Color(0xff1F2A52)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 60,
                        top: 20,
                      ),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child: Row(
                          children: [
                            Image.asset("image/Line.png", color: Color(0xff1F2A52)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "02",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0xff1F2A52),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 130,
                        top: 90,
                      ),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child: Text(
                          "CONSULTATION",
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Color(0xff000000), fontWeight: FontWeight.w600, letterSpacing: 0.888889),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 16),
                    width: MediaQuery.of(context).size.width * .80,
                    child: Text(
                      "Art is created with a soul and it is imperative that its essence resonates with the one who acquires it. We work with keen individuals to help them enrich their lives with pertinent art.",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Color(0XFF373737),
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 170,
                padding: EdgeInsets.all(16),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 0,
                          ),
                          child: Container(
                            //replace this Container with your Card
                            // color: Color(0Xff3C5233),
                            // height: 260.0,
                            child: Image.asset("image/Rectangle (1).png",
                                fit: BoxFit.fill, width: 100, height: 150, color: Color(0xffEAEEF2)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 70,
                        top: 100 / 2,
                      ),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child:
                            Image.asset("image/Shape (10).png", fit: BoxFit.fill, width: 50, color: Color(0xff1F2A52)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 40 / 2,
                        top: 30,
                      ),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child: Row(
                          children: [
                            Text(
                              "03",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0xff1F2A52),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset("image/Line.png", color: Color(0xff1F2A52)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 130,
                        top: 90,
                      ),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child: Text(
                          "RESTORATION",
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Color(0xff000000), fontWeight: FontWeight.w600, letterSpacing: 0.888889),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16),
                    width: MediaQuery.of(context).size.width * .80,
                    child: Text(
                      "AstaGuru reveres art in all its forms. Paintings and other artworks are susceptible to tampering and decay over the course of time. Restoration is best left to the experts, considering this service entails the longevity of the artwork.",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Color(0XFF373737),
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 170,
                padding: EdgeInsets.all(16),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 0,
                          ),
                          child: Container(
                            //replace this Container with your Card
                            // color: Color(0Xff3C5233),
                            // height: 260.0,
                            child: Image.asset("image/Rectangle (1).png",
                                fit: BoxFit.fill, width: 100, height: 150, color: Color(0xffEAEEF2)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 70,
                        top: 100 / 2,
                      ),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child: Image.asset(
                          "image/Shape (12).png",
                          fit: BoxFit.fill,
                          width: 50,
                          color: Color(0xff1F2A52),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 60,
                        top: 30,
                      ),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child: Row(
                          children: [
                            Image.asset(
                              "image/Line.png",
                              color: Color(0xff1F2A52),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "04",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0xff1F2A52),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 130,
                        top: 90,
                      ),
                      child: Container(
                        //replace this Container with your Card
                        // color: Color(0Xff3C5233),
                        // height: 260.0,
                        child: Text(
                          "VALUATION",
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Color(0xff000000), fontWeight: FontWeight.w600, letterSpacing: 0.888889),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 16),
                    width: MediaQuery.of(context).size.width * .80,
                    child: Text(
                      "An artwork is only valuable if its significance is assessed keeping various parameters in mind, AstaGuru conducts a thorough research and investigates all determinant aspects, including the provenance, artist, medium, subject, authenticity, quality and the current market value.",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Color(0XFF373737),
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
              SliverToBoxAdapter(
                child: Container(
                  color: Color(0xff1F2A52),
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
          )),
        ),
      ),
      // bottomNavigationBar: Dashboard2Ui(),
    );
  }
}

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/header.dart';

import '../components/footer/footer.dart';

class HowToBuyPage extends StatefulWidget {
  @override
  _HowToBuyPageState createState() => _HowToBuyPageState();
}

class _HowToBuyPageState extends State<HowToBuyPage> {
  int _pageIndex = 0;

  bool countDown = true, selected = false;
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardE = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardF = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardG = new GlobalKey();
  @override
  void initState() {
    // TODO: implement initState

    // nameController.text="Aryan Raj";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                "HOW TO BUY",
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
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .90,
                child: Text(
                  "We feature premium artworks including modern, contemporary, and street art",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Color(0XFF000000), fontWeight: FontWeight.w600, letterSpacing: 1),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
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
                          "image/howtobuy.png",
                          height: 200,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Color(0xffEAEEF2),
                  elevation: 0,
                  shadowColor: Color(0xff1F2A52),
                  initialElevation: 0,
                  contentPadding: EdgeInsets.all(4),
                  key: cardA,
                  leading: Container(
                    height: 60,
                    width: 60,
                    child: Image.asset(
                      "image/estimate.png",
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    "ESTIMATE",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Estimates are based on an average market value of the lot, determined at AstaGuru’s discretion.\n\nThese are provided only as a guide for Buyers.\n\nBuyers should not rely on estimates as a prediction of actual price. Buyers are advised to carry out an independent research exercise.\n\nEstimates do not include margin, packing, insurance, shipping, handling charges and any other taxes.",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Color(0xffEAEEF2),
                  elevation: 0,
                  shadowColor: Color(0xff1F2A52),
                  initialElevation: 0,
                  contentPadding: EdgeInsets.all(4),
                  key: cardB,
                  leading: Container(
                    height: 40,
                    width: 60,
                    child: Image.asset("image/reserves.png", height: 40, width: 40),
                  ),
                  title: Text(
                    "RESERVES",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "The first step in the process is to arrange a consultation with one of our representatives. You can contact us or email us with details of your property. We shall then study the property and give you a valuation on the same. We will respond to your auction estimate request within 3 working days. It is very important to AstaGuru to provide the highest level of service; accordingly, we cannot rush valuations.",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Color(0xffEAEEF2),
                  elevation: 0,
                  shadowColor: Color(0xff1F2A52),
                  initialElevation: 0,
                  contentPadding: EdgeInsets.all(4),
                  key: cardC,
                  leading: Container(
                    height: 30,
                    width: 60,
                    child: Image.asset("image/margins.png", height: 40, width: 40),
                  ),
                  title: Text(
                    "MARGINS",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "The first step in the process is to arrange a consultation with one of our representatives. You can contact us or email us with details of your property. We shall then study the property and give you a valuation on the same. We will respond to your auction estimate request within 3 working days. It is very important to AstaGuru to provide the highest level of service; accordingly, we cannot rush valuations.",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Color(0xffEAEEF2),
                  elevation: 0,
                  shadowColor: Color(0xff1F2A52),
                  initialElevation: 0,
                  contentPadding: EdgeInsets.all(4),
                  key: cardD,
                  leading: Container(
                    height: 30,
                    width: 60,
                    child: Image.asset(
                      "image/biding.png",
                      height: 40,
                    ),
                  ),
                  title: Text(
                    "BIDDING",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "The first step in the process is to arrange a consultation with one of our representatives. You can contact us or email us with details of your property. We shall then study the property and give you a valuation on the same. We will respond to your auction estimate request within 3 working days. It is very important to AstaGuru to provide the highest level of service; accordingly, we cannot rush valuations.",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Color(0xffEAEEF2),
                  elevation: 0,
                  shadowColor: Color(0xff1F2A52),
                  initialElevation: 0,
                  contentPadding: EdgeInsets.all(4),
                  key: cardE,
                  leading: Container(
                    height: 30,
                    width: 60,
                    child: Image.asset("image/aftersale.png", height: 40),
                  ),
                  title: Text(
                    "AFTER SALE",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "The first step in the process is to arrange a consultation with one of our representatives. You can contact us or email us with details of your property. We shall then study the property and give you a valuation on the same. We will respond to your auction estimate request within 3 working days. It is very important to AstaGuru to provide the highest level of service; accordingly, we cannot rush valuations.",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Color(0xffEAEEF2),
                  elevation: 0,
                  shadowColor: Color(0xff1F2A52),
                  initialElevation: 0,
                  contentPadding: EdgeInsets.all(4),
                  key: cardF,
                  leading: Container(
                    height: 30,
                    width: 60,
                    child: Image.asset("image/payment.png", height: 30),
                  ),
                  title: Text(
                    "PAYMENT",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "The first step in the process is to arrange a consultation with one of our representatives. You can contact us or email us with details of your property. We shall then study the property and give you a valuation on the same. We will respond to your auction estimate request within 3 working days. It is very important to AstaGuru to provide the highest level of service; accordingly, we cannot rush valuations.",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Color(0xffEAEEF2),
                  elevation: 0,
                  shadowColor: Color(0xff1F2A52),
                  initialElevation: 0,
                  contentPadding: EdgeInsets.all(4),
                  key: cardG,
                  leading: Container(
                    height: 30,
                    width: 60,
                    child: Image.asset(
                      "image/delivery.png",
                      height: 30,
                    ),
                  ),
                  title: Text(
                    "DELIVERY CONDUCT OF PURCHASE",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "The first step in the process is to arrange a consultation with one of our representatives. You can contact us or email us with details of your property. We shall then study the property and give you a valuation on the same. We will respond to your auction estimate request within 3 working days. It is very important to AstaGuru to provide the highest level of service; accordingly, we cannot rush valuations.",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
              Container(
                height: 100,
                color: Color(0xff1F2A52),
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Dashboard2Ui(),
    );
  }
}

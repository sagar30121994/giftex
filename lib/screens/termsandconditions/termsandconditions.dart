import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/header.dart';

import '../components/bottomnavigationbar/dashborard2.dart';
import '../components/footer/footer.dart';

class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  int _pageIndex = 0;
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardE = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardF = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardG = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardH = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardI = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardJ = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardK = new GlobalKey();
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
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "image/Group (11).png",
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "TERMS & CONDITIONS",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.only(left: 0, right: 16),
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      ),
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      )
                    ],
                    border: Border.all(color: Color(0xffDDE3E8), width: 1),
                    // image: DecorationImage(
                    //   image: AssetImage("image/Rectangle 2 (2).png"),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.white),
                child: ExpansionTileCard(
                  trailing: Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.black,
                  ),
                  baseColor: Colors.white,
                  expandedColor: Colors.white,
                  key: cardA,
                  // leading: Container(
                  //   height: 60,
                  //   width: 60,
                  //
                  //   child: Stack(
                  //     children: [
                  //       Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                  //       Center(child: Image.asset("image/Group (5).png",height:35,fit: BoxFit.cover,))
                  //     ],),
                  // ),
                  title: Text(
                    "DEFINITIONS AND INTERPRETATION",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, right: 16, left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, right: 16, left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, right: 16, left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, right: 16, left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, right: 16, left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, right: 16, left: 16, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
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
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.only(left: 0, right: 16),
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      ),
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      )
                    ],
                    border: Border.all(color: Color(0xffDDE3E8), width: 1),
                    // image: DecorationImage(
                    //   image: AssetImage("image/Rectangle 2 (2).png"),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.white),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Colors.red[50],
                  key: cardB,
                  trailing: Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.black,
                  ),
                  // leading: Container(
                  //   height: 60,
                  //   width: 60,
                  //
                  //   child: Stack(
                  //     children: [
                  //       Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                  //       Center(child: Image.asset("image/Group (7).png",height:35,fit: BoxFit.cover,))
                  //     ],),
                  // ),
                  title: Text(
                    "Reserve Price, estimates and margin",
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
                padding: EdgeInsets.only(left: 0, right: 16),
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      ),
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      )
                    ],
                    border: Border.all(color: Color(0xffDDE3E8), width: 1),
                    // image: DecorationImage(
                    //   image: AssetImage("image/Rectangle 2 (2).png"),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.white),
                child: ExpansionTileCard(
                  trailing: Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.black,
                  ),
                  baseColor: Colors.white,
                  expandedColor: Colors.red[50],
                  key: cardC,
                  // leading: Container(
                  //   height: 60,
                  //   width: 60,
                  //
                  //   child: Stack(
                  //     children: [
                  //       Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                  //       Center(child: Image.asset("image/Group (8).png",height:35,fit: BoxFit.cover,))
                  //     ],),
                  // ),
                  title: Text(
                    "Conduct of astaguru auction",
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
                padding: EdgeInsets.only(left: 0, right: 16),
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      ),
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      )
                    ],
                    border: Border.all(color: Color(0xffDDE3E8), width: 1),
                    // image: DecorationImage(
                    //   image: AssetImage("image/Rectangle 2 (2).png"),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.white),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Colors.red[50],
                  key: cardD,
                  trailing: Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.black,
                  ),
                  // leading: Container(
                  //   height: 60,
                  //   width: 60,
                  //
                  //   child: Stack(
                  //     children: [
                  //       Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                  //       Center(child: Image.asset("image/Group (9).png",height:35,fit: BoxFit.cover,))
                  //     ],),
                  // ),
                  title: Text(
                    "Authenticity Gurantee",
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
                padding: EdgeInsets.only(left: 0, right: 16),
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      ),
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      )
                    ],
                    border: Border.all(color: Color(0xffDDE3E8), width: 1),
                    // image: DecorationImage(
                    //   image: AssetImage("image/Rectangle 2 (2).png"),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.white),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Colors.red[50],
                  key: cardE,
                  trailing: Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.black,
                  ),
                  // leading: Container(
                  //   height: 60,
                  //   width: 60,
                  //
                  //   child: Stack(
                  //     children: [
                  //       Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                  //       Center(child: Image.asset("image/Group (9).png",height:35,fit: BoxFit.cover,))
                  //     ],),
                  // ),
                  title: Text(
                    "Payment of the Buyer",
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
                padding: EdgeInsets.only(left: 0, right: 16),
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      ),
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      )
                    ],
                    border: Border.all(color: Color(0xffDDE3E8), width: 1),
                    // image: DecorationImage(
                    //   image: AssetImage("image/Rectangle 2 (2).png"),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.white),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Colors.red[50],
                  key: cardF,
                  trailing: Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.black,
                  ),
                  // leading: Container(
                  //   height: 60,
                  //   width: 60,
                  //
                  //   child: Stack(
                  //     children: [
                  //       Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                  //       Center(child: Image.asset("image/Group (9).png",height:35,fit: BoxFit.cover,))
                  //     ],),
                  // ),
                  title: Text(
                    "Delivery and Collection of Purchased Lot",
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
                padding: EdgeInsets.only(left: 0, right: 16),
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      ),
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      )
                    ],
                    border: Border.all(color: Color(0xffDDE3E8), width: 1),
                    // image: DecorationImage(
                    //   image: AssetImage("image/Rectangle 2 (2).png"),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.white),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Colors.red[50],
                  key: cardG,
                  trailing: Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.black,
                  ),
                  // leading: Container(
                  //   height: 60,
                  //   width: 60,
                  //
                  //   child: Stack(
                  //     children: [
                  //       Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                  //       Center(child: Image.asset("image/Group (9).png",height:35,fit: BoxFit.cover,))
                  //     ],),
                  // ),
                  title: Text(
                    "Extent of Astaguru’s Liability",
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
                padding: EdgeInsets.only(left: 0, right: 16),
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      ),
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      )
                    ],
                    border: Border.all(color: Color(0xffDDE3E8), width: 1),
                    // image: DecorationImage(
                    //   image: AssetImage("image/Rectangle 2 (2).png"),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.white),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Colors.red[50],
                  key: cardH,
                  trailing: Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.black,
                  ),
                  // leading: Container(
                  //   height: 60,
                  //   width: 60,
                  //
                  //   child: Stack(
                  //     children: [
                  //       Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                  //       Center(child: Image.asset("image/Group (9).png",height:35,fit: BoxFit.cover,))
                  //     ],),
                  // ),
                  title: Text(
                    "Extent of buyer’s Liability",
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
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(left: 0, right: 16),
                margin: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      ),
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      )
                    ],
                    border: Border.all(color: Color(0xffDDE3E8), width: 1),
                    // image: DecorationImage(
                    //   image: AssetImage("image/Rectangle 2 (2).png"),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.white),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Colors.red[50],
                  key: cardI,
                  trailing: const Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.black,
                  ),
                  // leading: Container(
                  //   height: 60,
                  //   width: 60,
                  //
                  //   child: Stack(
                  //     children: [
                  //       Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                  //       Center(child: Image.asset("image/Group (9).png",height:35,fit: BoxFit.cover,))
                  //     ],),
                  // ),
                  title: Text(
                    "Governing Law and Dispute Resolution",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: const Color(0XFF000000),
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
                              color: const Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(left: 0, right: 16),
                margin: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      ),
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      )
                    ],
                    border: Border.all(color: const Color(0xffDDE3E8), width: 1),
                    // image: DecorationImage(
                    //   image: AssetImage("image/Rectangle 2 (2).png"),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.white),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Colors.red[50],
                  key: cardJ,
                  trailing: Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.black,
                  ),
                  // leading: Container(
                  //   height: 60,
                  //   width: 60,
                  //
                  //   child: Stack(
                  //     children: [
                  //       Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                  //       Center(child: Image.asset("image/Group (9).png",height:35,fit: BoxFit.cover,))
                  //     ],),
                  // ),
                  title: Text(
                    "Miscellaneous",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: const Color(0XFF000000),
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
                              color: const Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(left: 0, right: 16),
                margin: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      ),
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        color: Color.fromRGBO(226, 223, 202, 0.39),
                      )
                    ],
                    border: Border.all(color: const Color(0xffDDE3E8), width: 1),
                    // image: DecorationImage(
                    //   image: AssetImage("image/Rectangle 2 (2).png"),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.white),
                child: ExpansionTileCard(
                  baseColor: Colors.white,
                  expandedColor: Colors.red[50],
                  key: cardK,
                  trailing: const Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.black,
                  ),
                  // leading: Container(
                  //   height: 60,
                  //   width: 60,
                  //
                  //   child: Stack(
                  //     children: [
                  //       Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                  //       Center(child: Image.asset("image/Group (9).png",height:35,fit: BoxFit.cover,))
                  //     ],),
                  // ),
                  title: Text(
                    "Refund Policy",
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
                height: 16,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0XFFF9F9F9)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        side: const BorderSide(color: Color(0xff747474), width: 0.38)))),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                  child: Text(
                    'Load More',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0XFF2D2D2D),
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(height: 820, width: MediaQuery.of(context).size.width, child: Footer()),
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
      bottomNavigationBar: Dashboard2Ui(),
    );
  }
}

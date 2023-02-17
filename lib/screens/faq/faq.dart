

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/header.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/bottomnavigationbar/dashborard2.dart';
import '../components/footer/footer.dart';
import '../customepaint.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  int _pageIndex = 0;
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardE = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*.90,
          child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  Text("FAQ’s",
                    textAlign: TextAlign.left,
                    style:
                    Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text("HAVE QUESTIONS? WE'RE HERE TO HELP.",
                    textAlign: TextAlign.left,
                    style:
                    Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0xff466D33),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    width: MediaQuery.of(context).size.width*.80,
                    child: Text("we host over 200 auctions annually and offer a cross-category selection of items available for immediate purchase via both digital and physical shopping experiences as well as private sales.",
                      textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0XFF000000),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    height: 230,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30 ,bottom: 0),
                          child: Container(
                            //replace this Container with your Card
                            color: Color(0Xff3C5233),
                            height: 160.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30,bottom: 0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:40.0),
                            child: Container(

                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(109, 144, 93, 0.44),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(250),
                                  bottomRight: Radius.circular(250),
                                ),
                              ),
                              height: 140.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 16,),
                  //
                  Container(
                    padding: EdgeInsets.only(left: 0,right: 16),
                    margin: EdgeInsets.only(left: 16,right: 16),
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
                        border: Border.all(color: Color(0xffDDE3E8),width: 1),
                        // image: DecorationImage(
                        //   image: AssetImage("image/Rectangle 2 (2).png"),
                        //   fit: BoxFit.cover,
                        // ),
                        color: Colors.white
                    ),
                    child: ExpansionTileCard(
                      trailing: Icon(Icons.add,size: 18,color: Colors.black,),
                      baseColor: Colors.white,
                      expandedColor: Colors.red[50],
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
                      title: Text("What is a condition report?",textAlign: TextAlign.start,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("The first step in the process is to arrange a consultation with one of our representatives. You can contact us or email us with details of your property. We shall then study the property and give you a valuation on the same. We will respond to your auction estimate request within 3 working days. It is very important to AstaGuru to provide the highest level of service; accordingly, we cannot rush valuations.",
                            textAlign: TextAlign.start,
                            style:
                            Theme
                                .of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    padding: EdgeInsets.only(left: 0,right: 16),
                    margin: EdgeInsets.only(left: 16,right: 16),
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
                        border: Border.all(color: Color(0xffDDE3E8),width: 1),
                        // image: DecorationImage(
                        //   image: AssetImage("image/Rectangle 2 (2).png"),
                        //   fit: BoxFit.cover,
                        // ),
                        color: Colors.white
                    ),
                    child: ExpansionTileCard(
                      baseColor: Colors.white,
                      expandedColor: Colors.red[50],
                      key: cardB,
                      trailing: Icon(Icons.add,size: 18,color: Colors.black,),
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
                      title: Text("What are the various Modes to Bid?",textAlign: TextAlign.start,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("The first step in the process is to arrange a consultation with one of our representatives. You can contact us or email us with details of your property. We shall then study the property and give you a valuation on the same. We will respond to your auction estimate request within 3 working days. It is very important to AstaGuru to provide the highest level of service; accordingly, we cannot rush valuations.",
                            textAlign: TextAlign.start,
                            style:
                            Theme
                                .of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    padding: EdgeInsets.only(left: 0,right: 16),
                    margin: EdgeInsets.only(left: 16,right: 16),
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
                        border: Border.all(color: Color(0xffDDE3E8),width: 1),
                        // image: DecorationImage(
                        //   image: AssetImage("image/Rectangle 2 (2).png"),
                        //   fit: BoxFit.cover,
                        // ),
                        color: Colors.white
                    ),
                    child: ExpansionTileCard(
                      trailing: Icon(Icons.add,size: 18,color: Colors.black,),
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
                      title: Text("What are the applicable additional charges?",textAlign: TextAlign.start,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("The first step in the process is to arrange a consultation with one of our representatives. You can contact us or email us with details of your property. We shall then study the property and give you a valuation on the same. We will respond to your auction estimate request within 3 working days. It is very important to AstaGuru to provide the highest level of service; accordingly, we cannot rush valuations.",
                            textAlign: TextAlign.start,
                            style:
                            Theme
                                .of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    padding: EdgeInsets.only(left: 0,right: 16),
                    margin: EdgeInsets.only(left: 16,right: 16),
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
                        border: Border.all(color: Color(0xffDDE3E8),width: 1),
                        // image: DecorationImage(
                        //   image: AssetImage("image/Rectangle 2 (2).png"),
                        //   fit: BoxFit.cover,
                        // ),
                        color: Colors.white
                    ),
                    child: ExpansionTileCard(
                      baseColor: Colors.white,
                      expandedColor: Colors.red[50],
                      key: cardD,
                      trailing: Icon(Icons.add,size: 18,color: Colors.black,),
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
                      title: Text("What are the various Duties & Taxes applicable?",textAlign: TextAlign.start,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("The first step in the process is to arrange a consultation with one of our representatives. You can contact us or email us with details of your property. We shall then study the property and give you a valuation on the same. We will respond to your auction estimate request within 3 working days. It is very important to AstaGuru to provide the highest level of service; accordingly, we cannot rush valuations.",
                            textAlign: TextAlign.start,
                            style:
                            Theme
                                .of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    padding: EdgeInsets.only(left: 0,right: 16),
                    margin: EdgeInsets.only(left: 16,right: 16),
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
                        border: Border.all(color: Color(0xffDDE3E8),width: 1),
                        // image: DecorationImage(
                        //   image: AssetImage("image/Rectangle 2 (2).png"),
                        //   fit: BoxFit.cover,
                        // ),
                        color: Colors.white
                    ),
                    child: ExpansionTileCard(
                      baseColor: Colors.white,
                      expandedColor: Colors.red[50],
                      key: cardE,
                      trailing: Icon(Icons.add,size: 18,color: Colors.black,),
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
                      title: Text("Procedure in case goods/lots are damaged in transit?",textAlign: TextAlign.start,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("The first step in the process is to arrange a consultation with one of our representatives. You can contact us or email us with details of your property. We shall then study the property and give you a valuation on the same. We will respond to your auction estimate request within 3 working days. It is very important to AstaGuru to provide the highest level of service; accordingly, we cannot rush valuations.",
                            textAlign: TextAlign.start,
                            style:
                            Theme
                                .of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  ElevatedButton(
                    style:   ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                                side: BorderSide(color: Color(0xff747474),width: 0.38)
                            )
                        )
                    ),
                    onPressed: (){
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                      child: Text('LOAD MORE', style:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0XFF2D2D2D),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2
                      ),),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  SizedBox(
                      height: 820,
                      width: MediaQuery.of(context).size.width,
                      child: Footer()),
                ],
              )
          ),
        ),
      ),
      bottomNavigationBar: Dashboard2Ui(),
    );
  }
}

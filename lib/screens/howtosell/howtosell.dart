

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/header.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/bottomnavigationbar/dashborard2.dart';
import '../components/footer/footer.dart';
import '../customepaint.dart';

class HowToSellPage extends StatefulWidget {
  const HowToSellPage({Key? key}) : super(key: key);

  @override
  _HowToSellPageState createState() => _HowToSellPageState();
}

class _HowToSellPageState extends State<HowToSellPage> {
  int _pageIndex = 0;
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardE = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardF = new GlobalKey();
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
                  Text("HOW TO SELL",
                    textAlign: TextAlign.left,
                    style:
                    Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing:  0.888889
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text("FIND YOUR SERVICES THAT FITS YOUR NEEDS",
                    textAlign: TextAlign.left,
                    style:
                    Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0xff466D33),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    width: MediaQuery.of(context).size.width*.9,
                    child: Text("We feature premium artworks including modern, contemporary, and street art",
                      textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0XFF000000),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1
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
                  SizedBox(height: 16,),
                  Text("IT WORKS WITH 3 EASY STEPS",
                    textAlign: TextAlign.left,
                    style:
                    Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.888889
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30,top: 0,),
                              child: Container(
                                //replace this Container with your Card
                                // color: Color(0Xff3C5233),
                                // height: 260.0,
                                child: Image.asset("image/Rectangle (2).png",fit: BoxFit.fill,height: 90,),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0,top: 30,),
                              child: Container(
                                //replace this Container with your Card
                                // color: Color(0Xff3C5233),
                                // height: 260.0,
                                child: Image.asset("image/Group (2).png",fit: BoxFit.fill,),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 60,),
                          CircleAvatar(radius: 16,
                            backgroundColor: Color(0xff466D33),
                          child: Text("1",
                            textAlign: TextAlign.left,
                            style:
                            Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),),
                        ],
                      ),
                      SizedBox(height: 16,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.70,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            children: <TextSpan>[
                              TextSpan(text: 'Take ',style:  Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,),),
                              TextSpan(text: 'clear pictures ', style:  Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,),),
                              TextSpan(text: 'of your item.\nFront and back should be clearly visible.',style:  Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 100,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30,top: 0,),
                              child: Container(
                                //replace this Container with your Card
                                // color: Color(0Xff3C5233),
                                // height: 260.0,
                                child: Image.asset("image/Rectangle (2).png",fit: BoxFit.fill,height: 90,),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0,top: 30,),
                              child: Container(
                                //replace this Container with your Card
                                // color: Color(0Xff3C5233),
                                // height: 260.0,
                                child: Image.asset("image/Group (3).png",fit: BoxFit.fill,),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 60,),
                          CircleAvatar(radius: 16,
                            backgroundColor: Color(0xff466D33),
                          child: Text("2",
                            textAlign: TextAlign.left,
                            style:
                            Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),),
                        ],
                      ),
                      SizedBox(height: 16,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.70,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            children: <TextSpan>[
                              TextSpan(text: 'Provide us the ',style:  Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,),),
                              TextSpan(text: 'documentation ', style:  Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,),),
                              TextSpan(text: 'history & complete details of your item.',style:  Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 100,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30,top: 0,),
                              child: Container(
                                //replace this Container with your Card
                                // color: Color(0Xff3C5233),
                                // height: 260.0,
                                child: Image.asset("image/Rectangle (2).png",fit: BoxFit.fill,height: 90,),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0,top: 30,),
                              child: Container(
                                //replace this Container with your Card
                                // color: Color(0Xff3C5233),
                                // height: 260.0,
                                child: Image.asset("image/Group (4).png",fit: BoxFit.fill,),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 60,),
                          CircleAvatar(radius: 16,
                            backgroundColor: Color(0xff466D33),
                          child: Text("3",
                            textAlign: TextAlign.left,
                            style:
                            Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),),
                        ],
                      ),
                      SizedBox(height: 16,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.70,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            children: <TextSpan>[
                              TextSpan(text: 'That’s it! Our specialist will ',style:  Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,),),
                              TextSpan(text: 'review ', style:  Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,),),
                              TextSpan(text: 'your submission and get back to you.',style:  Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 500,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20,right:20,top: 80,bottom: 0),
                          child: Container(
                            //replace this Container with your Card
                            color: Color.fromRGBO(245, 245, 245, 1),
                            height: 370.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50,right:50,top: 0,bottom: 0),
                          child: Column(
                            children: [
                              Container(
                                height: 270.0,
                                child: Stack(
                                  children: [
                                    Container(
                                      //replace this Container with your Card
                                      color: Color.fromRGBO(245, 245, 245, 1),
                                      height: 270.0,
                                      child: Image.asset("image/Rectangle 1716.png"),
                                    ),
                                    Center(child: Image.asset("image/6.png",height: 45,)),
                                    Center(
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Color(0xff526D46),),
                                    ),
                                    Center(child: Image.asset("image/7.png",height: 13,))
                                  ],
                                ),
                              ),
                              SizedBox(height: 16,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*.80,
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    // Note: Styles for TextSpans must be explicitly defined.
                                    // Child text spans will inherit styles from parent
                                    children: <TextSpan>[
                                      TextSpan(text: 'IT’S EFFORT LESS SELL\nWITH ',style:  Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      letterSpacing:  0.888889),),
                                      TextSpan(text: 'ASTAGURU', style:  Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0XFF526D45),
                                        fontWeight: FontWeight.w600,
                                      letterSpacing:  0.888889),),

                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16,),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 340.0,right: 40,left: 50),
                          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                            textAlign: TextAlign.left,
                            style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 30,),
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
                      key: cardA,
                      leading: Container(
                        height: 60,
                        width: 60,

                        child: Stack(
                          children: [
                            Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                            Center(child: Image.asset("image/Group (5).png",height:35,fit: BoxFit.cover,))
                          ],),
                      ),
                      title: Text("EVALUATION",textAlign: TextAlign.start,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(
                            color: Color(0XFF414141),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.888889
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
                      key: cardF,
                      leading: Container(
                        height: 60,
                        width: 60,

                        child: Stack(
                          children: [
                            Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                            Center(child: Image.asset("image/Group (22).png",height:35,fit: BoxFit.cover,))
                          ],),
                      ),
                      title: Text("DECISION TO SELL",textAlign: TextAlign.start,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(
                          color: Color(0XFF414141),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.888889
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
                      leading: Container(
                        height: 60,
                        width: 60,

                        child: Stack(
                          children: [
                            Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                            Center(child: Image.asset("image/Group (7).png",height:35,fit: BoxFit.cover,))
                          ],),
                      ),
                      title: Text("SELLER’S CONTRACT",textAlign: TextAlign.start,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(
                            color: Color(0XFF414141),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.888889
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
                      key: cardC,
                      leading: Container(
                        height: 60,
                        width: 60,

                        child: Stack(
                          children: [
                            Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                            Center(child: Image.asset("image/Group (8).png",height:35,fit: BoxFit.cover,))
                          ],),
                      ),
                      title: Text("LOGISTICS",textAlign: TextAlign.start,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(
                            color: Color(0XFF414141),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.888889
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
                      leading: Container(
                        height: 60,
                        width: 60,

                        child: Stack(
                          children: [
                            Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                            Center(child: Image.asset("image/Group (9).png",height:35,fit: BoxFit.cover,))
                          ],),
                      ),
                      title: Text("RESERVE PRICE",textAlign: TextAlign.start,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(
                            color: Color(0XFF414141),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.888889
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
                      leading: Container(
                        height: 60,
                        width: 60,

                        child: Stack(
                          children: [
                            Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                            Center(child: Image.asset("image/Group (9).png",height:35,fit: BoxFit.cover,))
                          ],),
                      ),
                      title: Text("PAYMENT",textAlign: TextAlign.start,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(
                            color: Color(0XFF414141),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.888889
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
                  const SizedBox(height: 16,),
                  SizedBox(
                      height: 1100,
                      width: MediaQuery.of(context).size.width,
                      child: Footer()),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                  )
                ],
              )
          ),
        ),
      ),
      bottomNavigationBar: Dashboard2Ui(),
    );
  }
}

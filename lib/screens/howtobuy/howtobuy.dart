

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/header.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/bottomnavigationbar/dashborard2.dart';
import '../components/footer/footer.dart';
import '../customepaint.dart';

class HowToBuyPage extends StatefulWidget {
  @override
  _HowToBuyPageState createState() => _HowToBuyPageState();
}

class _HowToBuyPageState extends State<HowToBuyPage> {
  int _pageIndex = 0;
  List<Menu> data = [];
  bool countDown =true,selected=false;
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
    dataList.forEach((element) {
      data.add(Menu.fromJson(element));
    });
    // nameController.text="Aryan Raj";
    super.initState();
  }

  Widget _buildList(Menu list) {
    if (list.subMenu!.isEmpty)
      return Builder(
          builder: (context) {
            return ListTile(
              // onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategory(list.name))),
                leading: Checkbox(
                  value: selected,
                  onChanged: (bool? value) {},
                ),
                title: Text(list!.name!, style:
                Theme
                    .of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),)
            );
          }
      );
    return ExpansionTile(

      title: Text(
        list.name!,
        style:
        Theme
            .of(context)
            .textTheme
            .subtitle1!
            .copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: list.subMenu!.map(_buildList).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height * .90,
          child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  Text("HOW TO BUY",
                    textAlign: TextAlign.left,
                    style:
                    Theme
                        .of(context)
                        .textTheme
                        .headline6!
                        .copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing:  0.888889
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text("FIND YOUR SERVICES THAT FITS YOUR NEEDS",
                    textAlign: TextAlign.left,
                    style:
                    Theme
                        .of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(
                      color: Color(0xff466D33),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .90,
                    child: Text(
                      "We feature premium artworks including modern, contemporary, and street art",
                      textAlign: TextAlign.center,
                      style:
                      Theme
                          .of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(
                        color: Color(0XFF000000),
                        fontWeight: FontWeight.w600,
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
                          padding: EdgeInsets.only(top: 30, bottom: 0),
                          child: Container(
                            //replace this Container with your Card
                            color: Color(0Xff3C5233),
                            height: 160.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0),
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
                              Center(child: Image.asset("image/Group (23).png",height:35,fit: BoxFit.cover,))
                            ],),
                      ),
                      title: Text("ESTIMATE",textAlign: TextAlign.start,
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
                          child: Text("Estimates are based on an average market value of the lot, determined at AstaGuru’s discretion.\n\nThese are provided only as a guide for Buyers.\n\nBuyers should not rely on estimates as a prediction of actual price. Buyers are advised to carry out an independent research exercise.\n\nEstimates do not include margin, packing, insurance, shipping, handling charges and any other taxes.",textAlign: TextAlign.start,
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
                              Center(child: Image.asset("image/Group (24).png",height:35,fit: BoxFit.cover,))
                            ],),
                      ),
                      title: Text("RESERVES",textAlign: TextAlign.start,
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
                      key: cardC,
                      leading: Container(
                        height: 60,
                        width: 60,

                        child: Stack(
                            children: [
                              Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                              Center(child: Image.asset("image/Group (25).png",height:35,fit: BoxFit.cover,))
                            ],),
                      ),
                      title: Text("MARGINS",textAlign: TextAlign.start,
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
                      leading: Container(
                        height: 60,
                        width: 60,

                        child: Stack(
                            children: [
                              Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                              Center(child: Image.asset("image/Group (26).png",height:35,fit: BoxFit.cover,))
                            ],),
                      ),
                      title: Text("BIDDING",textAlign: TextAlign.start,
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
                  ), SizedBox(height: 16,),
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
                              Center(child: Image.asset("image/Group (27).png",height:35,fit: BoxFit.cover,))
                            ],),
                      ),
                      title: Text("AFTER SALE",textAlign: TextAlign.start,
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
                      key: cardF,
                      leading: Container(
                        height: 60,
                        width: 60,

                        child: Stack(
                            children: [
                              Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                              Center(child: Image.asset("image/Group (28).png",height:35,fit: BoxFit.cover,))
                            ],),
                      ),
                      title: Text("PAYMENT",textAlign: TextAlign.start,
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
                      key: cardG,
                      leading: Container(
                        height: 60,
                        width: 60,

                        child: Stack(
                            children: [
                              Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                              Center(child: Image.asset("image/Group (29).png",height:35,fit: BoxFit.cover,))
                            ],),
                      ),
                      title: Text("DELIVERY CONDUCT OF PURCHASE",textAlign: TextAlign.start,
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
                  const SizedBox(height: 30,),
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
class Menu {
  String? name;
  IconData? icon;
  List<Menu>? subMenu = [];

  Menu({this.name, this.subMenu, this.icon});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    if (json['subMenu'] != null) {
      subMenu!.clear();
      json['subMenu'].forEach((v) {
        subMenu?.add(new Menu.fromJson(v));
      });
    }
  }
}
List dataList = [
  {
    "name": "Category",
    "icon": Icons.payment,
    "subMenu": [
      {"name": "Contemporary Art"},
      {"name": "Paintings"},
      {"name": "Antique Furniture"},
      {"name": "Antique"}
    ]
  },
  {
    "name": "Artist Name",
    "icon": Icons.volume_up,
    "subMenu": [
      {"name": "Jamini Roy"},
      {"name": "M. F. Hussain"},
      {"name": "Horace Van Ruth"},
      {"name": "Sailoz Mookherhea"}
    ]
  },
  {
    "name": "Price",

    "subMenu": [
      {"name": "0-500"},
      {"name": "500-1000"},
      {"name": "1000-2000"},
      {"name": "above 2000"}
    ]
  },
];


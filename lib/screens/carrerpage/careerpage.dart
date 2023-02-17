

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/footer/footer.dart';
import 'package:scaled_list/scaled_list.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../components/bottomnavigationbar/dashborard2.dart';

class CareerPage extends StatefulWidget {
  @override
  _CareerPageState createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  int _pageIndex = 0;
  Color tabColor= Color(0xff6D905D);
  String newsType="LATEST NEWS";
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB= new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Image.asset("image/app1.png"),
        actions: [
          Image.asset("image/app2.png"),
          SizedBox(width: 3,),
          Image.asset("image/app3.png"),
          SizedBox(width: 3,),
          Container(
              width: 45,
              color: Color(0XFF8DAB7F),
              child: Image.asset("image/app4.png")),
          // SizedBox(width: 3,),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*.90,
          child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  Text("CAREER",
                    textAlign: TextAlign.left,
                    style:
                    Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text("start Doing work that matters",
                    textAlign: TextAlign.left,
                    style:
                    Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0xff466D33),
                      fontWeight: FontWeight.w600,
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
                  // const SizedBox(height: 16,),
                  Container(
                    height: 290,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top:70 ,bottom: 0),
                          child: Container(
                            //replace this Container with your Card
                            color: Color(0Xff3C5233),
                            height: 200.0,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 70,bottom: 0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:50.0),
                            child: Container(

                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(109, 144, 93, 0.44),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(200),
                                  bottomRight: Radius.circular(200),
                                ),
                              ),
                              height: 130.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 0,left: 170),
                          child: Image.asset("image/10.png",height: 230,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 110,bottom: 0,left: 100),
                          child: Image.asset("image/9.png",height: 140,),
                        ),


                      ],
                    ),
                  ),

                  const SizedBox(height: 30,),
                  Container(
                    color: Color(0xffFFFFFF),
                    child: DefaultTabController(
                      length: 3,
                      child:  SingleChildScrollView(
                        child: TabBar(
                          onTap: (index) {
                            setState(() {

                              // if(index==0) { tabColor = Color(0xff6D905D);}
                              // if(index==1) {tabColor =  Color(0xff6D905D);}
                              // if(index==2) {tabColor =  Color(0xff6D905D);}
                            });
                            print(index);
                          },
                          // indicator: BoxDecoration(
                          //     color: tabColor
                          // ),
                          isScrollable: true,
                          padding: EdgeInsets.all(0),
                          unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.6),
                          labelColor: const Color(0xFF000000),
                          labelStyle:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,),
                          tabs: [
                            Tab(
                                text: "Show All"
                            ),
                            Tab(
                                text: "Full time opportunities "
                            ),
                            Tab(
                                text: "internship opportunities"
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildPlayerModelList();
                      },
                    ),
                  ),
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
  Widget _buildPlayerModelList() {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 0,
      child: ExpansionTile(

        backgroundColor: Color(0xffF9F9F9),
        leading: Image.asset("image/Group.png"),
        title: Text(
          "Sales Representative ",
          style:
          Theme.of(context).textTheme.subtitle1!.copyWith(
            color: Color(0XFF000000),
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle:  Row(
          children: [
            Image.asset("image/Vector (11).png"),
            SizedBox(width: 5,),
            Text(
              "Mumbai",
              style:
              Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Color(0XFF000000),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Job Description",
                    style:
                    Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Color(0XFF000000),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Icon(Icons.circle,size: 15,color: Color(0xff8DAB7F),),
                    SizedBox(width: 10,),
                    Text(
                      "Generating leads.",
                      style:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0XFF000000),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Icon(Icons.circle,size: 15,color: Color(0xff8DAB7F),),
                    SizedBox(width: 10,),
                    Text(
                      "Meeting or exceeding sales goals.",
                      style:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0XFF000000),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Icon(Icons.circle,size: 15,color: Color(0xff8DAB7F),),
                    SizedBox(width: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width*.7,
                      child: Text(
                        "Negotiating all contracts with prospective clients.",
                        style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Icon(Icons.circle,size: 15,color: Color(0xff8DAB7F),),
                    SizedBox(width: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width*.7,
                      child: Text(
                        "Helping determine pricing schedules for quotes, promotions, and negotiations.",
                        style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Icon(Icons.circle,size: 15,color: Color(0xff8DAB7F),),
                    SizedBox(width: 10,),
                    Text(
                      "Preparing weekly and monthly reports.",
                      style:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0XFF000000),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Icon(Icons.circle,size: 15,color: Color(0xff8DAB7F),),
                    SizedBox(width: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width*.7,
                      child: Text(
                        "Giving sales presentations to a range of prospective clients.",
                        style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                Container(
                  height: 380,
                  child: Stack(
                    children: [
                      Container(
                        height: 360,
                        width: 410,
                        color: Color(0xffEAF1DB).withOpacity(0.7),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lets Work Together",
                              style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0XFF000000),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Fill the form below and get in touch",
                              style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Color(0XFF000000),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Name',
                                    hintText: 'Enter Your Name',
                                    prefixIcon: Icon(Icons.person_outline_sharp),
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email Id',
                                    hintText: 'Enter Your Email',
                                    prefixIcon: Icon(Icons.email_outlined),
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Mobile No',
                                    hintText: 'Enter Your No',
                                    prefixIcon: Icon(Icons.add_ic_call),
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Upload Resume',
                                    hintText: '',
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 340.0),
                        child: Center(
                          child: ElevatedButton(
                            style:   ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color(0XFF8DAB7F)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      // side: BorderSide(color: Colors.red)
                                    )
                                )
                            ),
                            onPressed: (){
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                              child: Text('Apply Now', style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Color(0XFFFFFFFF),
                                fontWeight: FontWeight.w600,
                              ),),
                            ),
                          ),
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
    );
  }
}

class ItemModel {
  bool expanded;
  String? headerItem;
  String? discription;
  Color? colorsItem;
  String? img;

  ItemModel({this.expanded: false, this.headerItem, this.discription,this.colorsItem,this.img});
}
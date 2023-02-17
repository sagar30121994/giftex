

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';
import 'package:giftex/screens/components/header.dart';
import 'package:scaled_list/scaled_list.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../customepaint.dart';

class ArtistPage extends StatefulWidget {
  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  int _pageIndex = 0;
  Color tabColor= Color(0xff6D905D);
  String newsType="LATEST NEWS";
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final controller1 = PageController(viewportFraction: 0.8, keepPage: true);
  final controller2 = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*.90,
        child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16,),
                Text("ARTIST’S PROFILE",
                  textAlign: TextAlign.left,
                  style:
                  Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.888889
                  ),
                ),
                const SizedBox(height: 10,),
                Text("JAMINI ROY",
                  textAlign: TextAlign.left,
                  style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Color(0xff1F1F1F),
                    fontWeight: FontWeight.w600,
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
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Container(
                  height: 290,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top:70 ,bottom: 0),
                        child: Container(
                          //replace this Container with your Card
                          color: Color(0Xff3C5233),
                          height: 230.0,
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
                                bottomLeft: Radius.circular(280),
                                bottomRight: Radius.circular(280),
                              ),
                            ),
                            height: 127.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 70,bottom: 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:60.0),
                          child: Container(

                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(60, 82, 51, 1),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(220),
                                bottomRight: Radius.circular(220),
                              ),
                            ),
                            height: 120.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 70,bottom: 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:80.0),
                          child: Container(

                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(109, 144, 93, 0.44),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(200),
                                bottomRight: Radius.circular(200),
                              ),
                            ),
                            height: 100.0,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 0,left: 100),
                        child: Image.asset("image/8.png",height: 150,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 210,bottom: 0,left: 120),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style:   ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0XFF3C5233)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          side: BorderSide(color: Color(0xff8DAB7F),width: 0.5)
                                      )
                                  )
                              ),
                              onPressed: (){
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0,left: 16,top: 12,bottom: 12),
                                child: Text('FOLLOW', style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Color(0XFFFFFFFF),
                                  fontWeight: FontWeight.w600,
                                ),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  width: MediaQuery.of(context).size.width*.85,
                  child: Text("Born in 1887 in a remote village in the state of West Bengal, Jamini Roy studied at Kolkata's Government School of Art. Initially, he painted in particular, in the Post-Impressionist genre essentially of portraits and landscapes, in keeping with his grooming as part of a proper British academic system. By 1925 though, he started to experiment along the lines of the then popular bazaar paintings synonymous with the Kalighat temple. By the 1930s, he almost completely switched over to indigenous materials for painting on woven mats, wood coated with lime and cloths. The motivation to paint on woven mats was the textures the artist noticed in Bvzantine art that he had observed in color photos. ",
                    textAlign: TextAlign.center,
                    style:
                    Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("ONGOING \nAUCTIONS",
                        textAlign: TextAlign.left,
                        style:
                        Theme.of(context).textTheme.headline6!.copyWith(
                          color: Color(0xff1F1F1F),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.14286
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),

                Container(
                  color: Color(0xffFFFFFF),
                  height:500,

                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(0),
                  child:  PageView.builder(
                    controller: controller,
                    itemBuilder: (BuildContext context, int pos) {
                      return Container(
                          color: Color(0xffFFFFFF),
                          height:380,
                          margin: EdgeInsets.only(right: 16),
                          // alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 150 / 2.0,bottom: 0),
                                child: Container(
                                  //replace this Container with your Card
                                  color: Color(0xffF9F9F9),
                                  height:500.0,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0,right: 25),
                                child: Image.asset("image/Bitmap6.png",height: 180,),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 370 / 2.0,bottom: 0,left: 10.0,right: 10),
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 20,),
                                      Text("JAMINI ROY",
                                        textAlign: TextAlign.center,
                                        style:
                                        Theme.of(context).textTheme.headline6!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.5146
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Text("Mother & Child",
                                        textAlign: TextAlign.center,
                                        style:
                                        Theme.of(context).textTheme.subtitle1!.copyWith(
                                          color: Color(0xff747474),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Estimate Value ",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Color(0xff747474),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Text("₹50,000- ₹75,000",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                                  color: Color(0xff202232),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Bid Closing in",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Color(0xff747474),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Text("2hrs:5Mins:30Sec ",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                                  color: Color(0xff466D33),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Current Bid",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Color(0xff747474),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Text("₹50,000",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                                  color: Color(0xff202232),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Next Valid Bid",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Color(0xff747474),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Text("₹75,000",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                                  color: Color(0xff466D33),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            style:   ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20.0),
                                                        side: BorderSide(color: Color(0xff747474),width: 0.38)
                                                    )
                                                )
                                            ),
                                            onPressed: (){
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                              child: Text('PROXY BID', style:
                                              Theme.of(context).textTheme.caption!.copyWith(
                                                color: Color(0XFF2D2D2D),
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.00973
                                              ),),
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          ElevatedButton(
                                            style:   ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Color(0XFF466D33)),
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
                                              child: Text('BID NOW', style:
                                              Theme.of(context).textTheme.caption!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.00973
                                              ),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          )
                      );
                    },
                    itemCount: 3,
                  ),
                ),
                SizedBox(height: 16,),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        type: WormType.thin,
                        activeDotColor: Color(0xff3C5233),
                        dotColor: Color(0xffD1D1D1)
                      // strokeWidth: 5,
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("OTHER WORKS\nFROM THE \nARTISTS",
                        textAlign: TextAlign.left,
                        style:
                        Theme.of(context).textTheme.headline6!.copyWith(
                          color: Color(0xff1F1F1F),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.14286
                        ),
                      ),
                      Spacer(),
                      Text("VIEW ALL",textAlign: TextAlign.center,
                        style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0XFF5D7E4D),
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          letterSpacing: 1
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  // color: Color(0xffFFFFFF),
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  // padding: EdgeInsets.all(0),
                  child:  PageView.builder(
                    controller: controller1,
                    itemBuilder: (BuildContext context, int pos) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 350,
                              width: MediaQuery.of(context).size.width*.9,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                    color: Color(0xffFFFFFF),
                                    height:450,
                                    alignment: Alignment.center,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 150 / 2.0,bottom: 0),
                                          child: Container(
                                            //replace this Container with your Card
                                            color: Color(0xffF9F9F9),
                                            height:260.0,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 25.0,right: 25),
                                          child: Image.asset("image/image 9.png",height: 180,),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 370 / 2.0,bottom: 0,left: 25.0,right: 25),
                                            child:Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(width: 20,),
                                                Text("TRADITIONAL PAINTINGS",
                                                  textAlign: TextAlign.center,
                                                  style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1
                                                  ),
                                                ),
                                                SizedBox(height: 10,),
                                                Text("2022",
                                                  textAlign: TextAlign.center,
                                                  style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0xff747474),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(height: 20,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Current Bid",
                                                          textAlign: TextAlign.center,
                                                          style:
                                                          Theme.of(context).textTheme.subtitle1!.copyWith(
                                                            color: Color(0xff747474),
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10,),
                                                        Text("₹50,000",
                                                          textAlign: TextAlign.center,
                                                          style:
                                                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            color: Color(0xff202232),
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Next Valid Bid",
                                                          textAlign: TextAlign.center,
                                                          style:
                                                          Theme.of(context).textTheme.subtitle1!.copyWith(
                                                            color: Color(0xff747474),
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(height: 10,),
                                                        Text("₹55,000",
                                                          textAlign: TextAlign.center,
                                                          style:
                                                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                                            color: Color(0xff7B9B6C),
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                        ),
                                      ],
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 3,
                  ),
                ),
                SizedBox(height: 16,),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller1,
                    count: 3,
                    effect: WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        type: WormType.thin,
                        activeDotColor: Color(0xff3C5233),
                        dotColor: Color(0xffD1D1D1)
                      // strokeWidth: 5,
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  color: Color(0xffFFFFFF),
                  child: DefaultTabController(
                    length: 3,
                    child:  DecoratedBox(
                      decoration: BoxDecoration(
                        //This is for background color
                        color: Colors.white.withOpacity(0.0),

                        //This is for bottom border that is needed
                        border: Border(
                            bottom: BorderSide(color: Color(0xffDFDFDF), width: 2)),
                      ),
                      child: TabBar(
                        onTap: (index) {
                          setState(() {

                            if(index==0) { tabColor = Color(0xff6D905D);
                            newsType="LATEST NEWS";}
                            if(index==1) {tabColor =  Color(0xff6D905D);
                            newsType="VIDEOS";}
                            if(index==2) {tabColor =  Color(0xff6D905D);
                            newsType="BLOGS";}
                          });
                          print(index);
                        },
                        indicator: UnderlineTabIndicator(
                          borderSide:
                          BorderSide(color: Color(0xff8DAB7F), width: 2.0),
                        ),
                        padding: EdgeInsets.all(0),
                        labelPadding:  EdgeInsets.all(0),
                        unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.59),
                        labelColor: const Color(0xFF2D2D2D),
                        labelStyle:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0xff2D2D2D),
                          fontWeight: FontWeight.w600,),
                        tabs: [
                          Tab(
                              text: "LATEST NEWS"
                          ),
                          Tab(
                              text: "VIDEOS"
                          ),
                          Tab(
                              text: "BLOGS"
                          ),

                        ],
                      ),
                    ),

                  ),
                ),
                SizedBox(height:20,),
                SizedBox(
                  // color: Color(0xffFFFFFF),
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  // padding: EdgeInsets.all(0),
                  child:  PageView.builder(
                    controller: controller2,
                    itemBuilder: (BuildContext context, int pos) {
                      return Container(
                          color: Color(0xffFFFFFF),
                          height:350,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 16),
                          width: MediaQuery.of(context).size.width*.9,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 0,right: 0,top: 50),
                                child: Image.asset("image/Rectangle (11).png",width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16,right: 36),
                                child: Column(
                                  children: [
                                    Image.asset("image/Rectangle 2.png",fit: BoxFit.cover,),
                                    SizedBox(height: 16,),
                                    Row(
                                      children: [

                                        Text("January 10, 2022",textAlign: TextAlign.center,
                                          style:
                                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0XFF747474),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Text("Lorem ipsum dolor sit amet, consecte tur adipiscing elit,",
                                      textAlign: TextAlign.left,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    Text("Lorem ipsum dolor sit amet, consecte tur adipiscing elit,",
                                      textAlign: TextAlign.left,
                                      style:
                                      Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: Color(0xff747474),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                  ],
                                ),
                              ),
                            ],
                          )
                      );
                    },
                    itemCount: 3,
                  ),
                ),
                SizedBox(height: 16,),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller2,
                    count: 3,
                    effect: WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        type: WormType.thin,
                        activeDotColor: Color(0xff3C5233),
                        dotColor: Color(0xffD1D1D1)
                      // strokeWidth: 5,
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                const SizedBox(height: 16,),
                SizedBox(
                    height: 1100,
                    width: MediaQuery.of(context).size.width,
                    child: Footer()),

              ],
            )
        ),
      ),
      bottomNavigationBar: Dashboard2Ui(),
    );
  }
}

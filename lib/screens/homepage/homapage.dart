

import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/howtobuy/howtobuy.dart';
import 'package:giftex/screens/howtosell/howtosell.dart';
import 'package:giftex/screens/newsandupdates/newsandupdates.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../components/header.dart';
import '../customepaint.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin{
  int _pageIndex = 0;
  Color tabColor= Color(0xff6D905D);
  String newsType="LATEST NEWS";
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final sliderController = PageController();
  final controller1 = PageController(viewportFraction: 0.8, keepPage: true);
  final controller2 = PageController(viewportFraction: 0.8, keepPage: true);


   int position=0;
  //
  // PageController controller=PageController();

  startTimer(){
    Timer.periodic(Duration(seconds: 4), (_) async {

      setState(() {


        if(position!=4){
          position++;
          sliderController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInCirc);
        }else{
          position=0;
          sliderController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.easeInCirc);
        }
      });

    });
  }


  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HeaderUi(),

            SizedBox(
              height: 450,
              child: Stack(
                children: [

                  Positioned(
                    bottom: 75,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 150 / 2.0,bottom: 0),
                      child: Container(
                        //replace this Container with your Card
                        color: Color(0xff1F2A52),
                        height: 150.0,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: sliderController,


                      onPageChanged: (pos){
                        setState(() {
                          position=pos%4;
                        });
                      },

                      itemCount: 5,
                      itemBuilder:(context,pos) =>


                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 10,),
                                Text(
                                  "Interior Design",
                                  textAlign: TextAlign.left,
                                  style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2.0
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                Text("SHOP COLLECTIBLES",
                                  textAlign: TextAlign.left,
                                  style:
                                  Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                Container(
                                  width: MediaQuery.of(context).size.width*.80,
                                  child: Text("Discover our online destination where purchasing is immediate",
                                    textAlign: TextAlign.center,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: Color(0XFF747474),
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16,),
                                Container(
                                  height: 300,
                                  child: Column(
                                    children: [

                                      Padding(
                                        padding: const EdgeInsets.only(left: 25.0,right: 25),
                                        child: Image.asset("image/Bitmap.png"),
                                      ),
                                        SizedBox(height: 24,),
                                      SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: Container(

                                            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 2),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(22.0),
                                                gradient: LinearGradient(
                                                  begin: Alignment.bottomLeft,
                                                  end: Alignment.topRight,
                                                  colors: [
                                                    Color(0xffB45156),
                                                    Color(0xffE74B52),
                                                    // Color(0xffFFFFFF),
                                                  ],
                                                )
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                              child: Text('BUY NOW', style:
                                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                                  color: Color(0XFFFFFFFF),
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1
                                              ),),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                    ),
                  ),

                ],
              ),
            ),





            Row(
              children: [
                SizedBox(width: 10,),
                Text("01/0${position+1}",
                  textAlign: TextAlign.left,
                  style:
                  Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 10,),
                // Image.asset("image/Line.png",width: 100,),

                Container(
                  width:120 ,
                  color: Colors.black,
                  height: 1,
                ),

                Spacer(),
                Container(
                  height: 70,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("image/Rectangle Copy.png"),
                      fit: BoxFit.cover,
                    ),
                  ),

                  // child:
                  // Icon(Icons.cale)
                   child:Image.asset("image/calender.png",color: Color(0xff000000),),
                )
              ],
            ),
            SizedBox(height: 16,),
            SizedBox(
              width: MediaQuery.of(context).size.width*.80,
              child: Text("SHOP NOW \nON OUR ONLINE STORE",
                textAlign: TextAlign.center,
                style:
                Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                    letterSpacing: 0.666667
                ),
              ),
            ),
            const SizedBox(height: 16,),
            SizedBox(
              width: MediaQuery.of(context).size.width*.80,
              child: Text("Discover our online platform where purchasing is immediate, with items delivered right to your door.",
                textAlign: TextAlign.center,
                softWrap: true,
                style:
                Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Color(0XFF2D2D2D),
                  fontWeight: FontWeight.w400,
                  wordSpacing: 2,
                  textBaseline: TextBaseline.alphabetic,


                ),


              ),
            ),
            const SizedBox(height: 16,),
            Container(
              height: 440,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.70,
                    child: Text("FEATURED ITEMS",
                      textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.headline6!.copyWith(
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.42857
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                      // width: 45,
                      color: Color(0XFF8DAB7F),
                      child: Image.asset("image/Bitmap1.png")),
                  SizedBox(height: 16,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.70,
                    child: Text("Antique Elephant Buddha",
                      textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Color(0xff373737),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.70,
                    child: Text("₹ 20,000",
                      textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  SizedBox(
                    height: 50,
                    child: Center(
                      child:  InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsAndUpdatesPage()));
                        },
                        child: Container(

                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Color(0xffB45156),
                                  Color(0xffE74B52),
                                ],
                              )
                          ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                          child: Text('VIEW ALL', style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Color(0XFFFFFFFF),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1
                          ),),
                        ),
                      ),
                    ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: MediaQuery.of(context).size.width*.70,
              child: Text("UPCOMING AUCTIONS",
                textAlign: TextAlign.start,
                style:
                Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.14286
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 440,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("image/Bitmap2.png"),
                  fit: BoxFit.cover,

                ),
                color: Color(0xffE9E3BF)
              ),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                      color: Color(0xffEAEEF2).withOpacity(0.75),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 0,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.70,
                            child: Text("Opulent Collectibles",
                              textAlign: TextAlign.start,
                              style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xffEAEEF2),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child:  Text("EXPLORE",
                              textAlign: TextAlign.start,
                              style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.70,
                            child: Text("30th-31st Aug",
                              textAlign: TextAlign.start,
                              style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.70,
                            child: Text("2022",
                              textAlign: TextAlign.start,
                              style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.772727
                              ),
                            ),
                          ),
                          const SizedBox(height: 14,),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("image/Bitmap3.png"),
                          fit: BoxFit.cover,

                        ),
                        color: Color(0xff495E93).withOpacity(1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 0,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.70,
                            child: Text("Modern Indian",
                              textAlign: TextAlign.end,
                              style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                  // letterSpacing: 1
                              ),
                            ),
                          ),
                          const SizedBox(height: 16,),
                          Container(
                            padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            decoration: BoxDecoration(
                              color: Color(0xffEAEEF2),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child:  Text("EXPLORE",
                              textAlign: TextAlign.start,
                              style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0xff2D2D2D),
                                  fontWeight: FontWeight.bold,
                                letterSpacing: 1
                              ),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.70,
                            child: Text("30th-31st Aug",
                              textAlign: TextAlign.end,
                              style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.70,
                            child: Text("2022",
                              textAlign: TextAlign.end,
                              style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HowToSellPage()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 160,
                    color: Theme.of(context).colorScheme.surface,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("image/sell.png"),
                          SizedBox(height: 16,),
                          Text("HOW TO SELL?",
                            textAlign: TextAlign.end,
                            style:
                            Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Color(0xff3A3A3A),
                              fontWeight: FontWeight.w400,
                                letterSpacing: 1
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HowToBuyPage()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 160,
                    color:Theme.of(context).colorScheme.onSecondaryContainer,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("image/sell.png"),
                          SizedBox(height: 16,),
                          Text("HOW TO Buy?",
                            textAlign: TextAlign.end,
                            style:
                            Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 16,),
                Text("SHOP ONLINE BY CATEGORY",
                  textAlign: TextAlign.center,
                  style:
                  Theme.of(context).textTheme.headline5!.copyWith(
                    color: Color(0xff373737),
                    fontWeight: FontWeight.w900,

                    letterSpacing: 1

                  ),
                ),
              ],
            ),
            SizedBox(height: 24,),
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
                          text: "ART"
                      ),
                      Tab(
                          text: "JEWELLERY"
                      ),
                      Tab(
                          text: "VINTAGE CARS"
                      ),

                    ],
                  ),
                ),

              ),
            ),
            SizedBox(height: 16,),
            Container(
              color: Color(0xffFFFFFF),
              height:320,

              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(0),
              child:  PageView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int pos) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        color: Color(0xffFFFFFF),
                        height:350,
                        width: 200,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 150 / 2.0,bottom: 0,left: 50,right: 50),
                              child: Container(
                                //replace this Container with your Card
                                color: Color(0xffF8F8F8),
                                height:260.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0,right: 25),
                              child: Image.asset("image/Bitmap (10).png",height: 210,width: 150,fit: BoxFit.fill,),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 430 / 2.0,bottom: 0,left: 25.0,right: 25),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(width: 20,),
                                    Text("FURNITURE \nDECORATIVE ART",
                                      textAlign: TextAlign.start,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                          color: Color(0xff2D2D2D),
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.5
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("₹ 2,30,000",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Theme.of(context).colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        )
                    ),
                  );
                },
                itemCount: 3,
              ),
            ),

            SizedBox(height: 10,),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewsAndUpdatesPage()));
          },
          child: Container(

            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.0),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xffB45156),
                    Color(0xffE74B52),
                  ],

                )
            ),
              // onPressed: (){
              //
              // },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                child: Text('VIEW ALL', style:
                Theme.of(context).textTheme.bodyText1!.copyWith(
                  color:Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1
                ),),
              ),
            ),
        ),
            const SizedBox(height: 20,),
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
            const SizedBox(height: 20,),
            SizedBox(height: 24,),
            Container(
              height: 340,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text("WHY ASTA GURU MUSE?",style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            width:85,
                            height: 80,
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 0,
                                    right:8,
                                    child: Image.asset('image/museback.png',height: 65,width: 55,)),
                                Positioned(
                                    left: 4,
                                    bottom:8,
                                    child: Image.asset('image/authgua.png',height: 65,width: 55,)),

                              ],
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text("Authenticity \nGuaranteed",style:Theme.of(context).textTheme.subtitle1,)

                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width:85,
                            height: 80,
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 0,
                                    right:8,
                                    child: Image.asset('image/museback.png',height: 65,width: 55,)),
                                Positioned(
                                    left: 4,
                                    bottom:8,
                                    child: Image.asset('image/bidaction.png',height: 65,width: 55,)),

                              ],
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text("Bid In \nAction",style:Theme.of(context).textTheme.subtitle1,)

                        ],
                      )
                    ],
                  ),

                  SizedBox(height: 24,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            width:85,
                            height: 80,
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 0,
                                    right:8,
                                    child: Image.asset('image/museback.png',height: 65,width: 55,)),
                                Positioned(
                                    left: 4,
                                    bottom:8,
                                    child: Image.asset('image/shoponline.png',height: 65,width: 55,)),

                              ],
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text("Shop Online\nInstantly ",style:Theme.of(context).textTheme.subtitle1,)

                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width:85,
                            height: 80,
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 0,
                                    right:8,
                                    child: Image.asset('image/museback.png',height: 65,width: 55,)),
                                Positioned(
                                    left: 4,
                                    bottom:8,
                                    child: Image.asset('image/panindia.png',height: 65,width: 55,)),

                              ],
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text("Pan India \nShopping",style:Theme.of(context).textTheme.subtitle1,)

                        ],
                      )
                    ],
                  ),



                ],
              ),
            ),

            const SizedBox(height: 30,),
            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 16,),
                Text("NEWS & UPDATES.",
                  textAlign: TextAlign.center,
                  style:
                  Theme.of(context).textTheme.headline6!.copyWith(
                    color: Color(0xff373737),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            const SizedBox(height: 20,),

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
                      BorderSide(color: Color(0xffB45156), width: 2.0),
                    ),
                    padding: EdgeInsets.all(0),
                    labelPadding:  EdgeInsets.all(0),
                    unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.59),
                    labelColor: const Color(0xFF2D2D2D),
                    labelStyle:
                    Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0xff2D2D2D),
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,),

                    tabs: [
                      Tab(
                          text: "LATEST NEWS",
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
            SizedBox(height: 20,),
            Container(
              color: Color(0xffFFFFFF),
              height:340,

              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(0),
              child:  PageView.builder(
                controller: controller1,
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
                          child: Container(
                            color: Color(0xffEAEEF2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16),
                          child: Column(
                            children: [
                              Image.asset("image/Rectangle 2.png",fit: BoxFit.cover,),
                              SizedBox(height: 16,),
                              Row(
                                children: [

                                  Text("Jan 10, 2022",textAlign: TextAlign.center,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                child: Text("Lorem ipsum dolor sit amet,\nconsecte tur adipiscing elit, jwsnjw wjnsjw djwnd",
                                  textAlign: TextAlign.left,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0xff2D2D2D),
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Text("Lorem ipsum dolor sit amet, consecte tur adipiscing elit,wsjnsjw jwnjsdw jnjdw njndwjd jndwj jnjdw ",
                                textAlign: TextAlign.left,
                                overflow:TextOverflow.ellipsis,
                                maxLines: 2,
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
                    ),
                  );
                },
                itemCount: 3,
              ),
            ),
            SizedBox(height: 24,),
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

            SizedBox(height: 34,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewsAndUpdatesPage()));
              },
              child: Container(

                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.0),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xffB45156),
                        Color(0xffE74B52),
                      ],
                    )
                ),
                // style:   ButtonStyle(
                //     backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary),
                //
                //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //         RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(16.0),
                //           // side: BorderSide(color: Colors.red)
                //         )
                //     )
                // ),
                // onPressed: (){
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => NewsAndUpdatesPage()));
                // },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                  child: Text('VIEW ALL', style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Color(0XFFFFFFFF),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1
                  ),),
                ),
              ),
            ),
             SizedBox(height: 16,),
            Container(

              color: Color(0Xff2D2D2D),
              child: Column(
                children: [
                  Container(
                      color: Color(0Xff1F2A52),
                      width: MediaQuery.of(context).size.width,
                      child: Footer()),
                  Container(
                    color: Color(0Xff1F2A52),
                    height: 150,
                      width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}

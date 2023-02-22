

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../components/header.dart';
import '../customepaint.dart';

class NewsAndUpdatesPage extends StatefulWidget {
  @override
  _NewsAndUpdatesPageState createState() => _NewsAndUpdatesPageState();
}

class _NewsAndUpdatesPageState extends State<NewsAndUpdatesPage> {
  int _pageIndex = 0;
  Color tabColor= Color(0xff6D905D);
  String newsType="LATEST NEWS";
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
                const SizedBox(height: 16,),
                Text("NEWS AND UPDATES",
                  textAlign: TextAlign.left,
                  style:
                  Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    letterSpacing:  0.888889
                  ),
                ),
                const SizedBox(height: 10,),
                Text("FIND YOUR SERVICES THAT FITS YOUR NEEDS",
                  textAlign: TextAlign.left,
                  style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Color(0xff466D33),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16,),
                Container(
                  width: MediaQuery.of(context).size.width*.90,
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
                  height: 230,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top:70 ,bottom: 0),
                        child: Container(
                          //replace this Container with your Card
                          color: Color(0Xff3C5233),
                          height: 160.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 70,bottom: 0),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 90.0,right: 80,top: 0,bottom: 0),
                        child: Image.asset("image/4 1.png",height: 150,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 160.0,right: 80,top: 10,bottom: 0),
                        child: Image.asset("image/5 1.png",height: 150,),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16,),

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
                          fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                        unselectedLabelStyle:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0xff2D2D2D).withOpacity(0.4),
                          fontWeight: FontWeight.w600,
                        letterSpacing: 1),
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
                SizedBox(height: 16,),
                newsType=="BLOGS"?Container(
                    height: 500,
                    child: CustomScrollView(
                      shrinkWrap: true,
                        slivers: [
                      SliverPinnedHeader(
                          child: Container(
                            height: 300,
                            padding: EdgeInsets.all(16),
                            child: Stack(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("image/Rectangle1.png",width: MediaQuery.of(context).size.width*.85,fit: BoxFit.fill,height: 200,),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 100.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*.66,
                                        color: Color(0xffF8F7F0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 16,),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("Jamini Roy",textAlign: TextAlign.center,
                                                    style:
                                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Color(0XFF747474),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  SizedBox(
                                                      width: 14,
                                                      child: Divider(color: Color(0xff3C5233),thickness: 1,)),
                                                  // Image.asset("image/Line.png",width: 18,color: Color(0xff3C5233),),
                                                  SizedBox(width: 10,),
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
                                              Text("News and updates \njamini roy auction",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Color(0xff2D2D2D),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(height: 10,),
                                              Text("Lorem ipsum dolor sit amet, consecte tur adipiscing elit,",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                                  color: Color(0xff747474),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),  ),

                              ],
                            ),
                          )),
                      SliverAnimatedPaintExtent(
                        duration: const Duration(milliseconds: 150),
                        child: SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 32.0,right: 32.0),
                                child: Container(
                                    color: Color(0xffFFFFFF),
                                    height:350,
                                    alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Image.asset("image/Rectangle 2.png",fit: BoxFit.cover,),
                                      SizedBox(height: 16,),
                                      Row(
                                        children: [
                                          Text("Jamini Roy",textAlign: TextAlign.center,
                                            style:
                                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                              color: Color(0XFF747474),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          SizedBox(
                                            width: 14,
                                              child: Divider(color: Color(0xff3C5233),thickness: 1,)),
                                          // Image.asset("image/Line.png",width: 18,color: Color(0xff3C5233),),
                                          SizedBox(width: 10,),
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
                              );
                            },
                            // 40 list items
                            childCount: 3,
                          ),
                        ),
                      ),
                    ])
                ):Container(),
                newsType=="LATEST NEWS"?Container(
                    height: 500,
                    child: CustomScrollView(slivers: [
                      SliverAnimatedPaintExtent(
                        duration: const Duration(milliseconds: 150),
                        child: SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                                child: Container(
                                  color: Color(0xffFFFFFF),
                                  height:420,
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 90,bottom: 30),
                                        child: Container(

                                          child: Image.asset("image/Rectangle (3).png",fit: BoxFit.cover,width: MediaQuery.of(context).size.width*.90,),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                                        child: Column(
                                          children: [
                                            Image.asset("image/Rectangle 2.png",fit: BoxFit.cover,),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text("Jan 10, 2022",textAlign: TextAlign.center,
                                                  style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0XFF3C5233),
                                                    fontWeight: FontWeight.w500,
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
                                            Text("Lorem ipsum dolor sit amet, consecte tur adipiscing elit, Lore ipsum dolor sit Lorem ipsum dolor sit amet.",
                                              textAlign: TextAlign.left,
                                              style:
                                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: Color(0xff747474),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text("Read More",textAlign: TextAlign.center,
                                                  style:
                                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                                    color: Color(0XFF5D7E4D),
                                                    fontWeight: FontWeight.w700,
                                                    decoration: TextDecoration.underline,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],

                                  ),
                                ),
                              );
                            },
                            // 40 list items
                            childCount: 3,
                          ),
                        ),
                      ),
                    ])
                ):Container(),
                newsType=="VIDEOS"?Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text("MOST WATCHED",textAlign: TextAlign.start,
                            style:
                            Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.888889
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        child: CustomScrollView(slivers: [
                          SliverAnimatedPaintExtent(
                            duration: const Duration(milliseconds: 150),
                            child: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 16,bottom: 10),
                                    child: Container(

                                      height:140,

                                      // alignment: Alignment.center,

                                      child: Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width*.25,
                                            height: 140,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("image/Rectangle (3).png",),
                                                fit: BoxFit.cover,
                                              ),
                                              color: Color(0xffFFFFFF),
                                            ),
                                            child: Stack(
                                              children: [
                                               Container(
                                                 child: Image.asset("image/Rectangle 1741.png",height: 150,fit: BoxFit.cover,),
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
                                          SizedBox(width: 10,),
                                          Container(
                                            width: MediaQuery.of(context).size.width*.67,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Jan 10, 2022",textAlign: TextAlign.start,
                                                      style:
                                                      Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        color: Color(0XFF3C5233),
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 8,),
                                                Text("Lorem ipsum dolor sit",
                                                  textAlign: TextAlign.left,
                                                  style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0xff2D2D2D),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(height: 8,),
                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Text("Lorem ipsum dolor sit amet, consecte tur adipiscing elit,",
                                                    textAlign: TextAlign.left,
                                                    style:
                                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Color(0xff747474),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 8,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text("watch More",textAlign: TextAlign.center,
                                                      style:
                                                      Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        color: Color(0XFF5D7E4D),
                                                        fontWeight: FontWeight.w600,
                                                        decoration: TextDecoration.underline,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                // 40 list items
                                childCount: 3,
                              ),
                            ),
                          ),
                        ])
                    ),
                    SizedBox(height: 30,),
                    Container(
                        height: 370,
                        child: CustomScrollView(slivers: [
                          SliverAnimatedPaintExtent(
                            duration: const Duration(milliseconds: 150),
                            child: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 32.0,right: 32.0),
                                    child: Container(
                                      color: Color(0xffFFFFFF),
                                      height:370,
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 200,
                                            width: MediaQuery.of(context).size.width*.8,
                                            child: Stack(
                                              children: [
                                              Image.asset("image/Rectangle 2.png",fit: BoxFit.cover,height: 200,),
                                              Center(child: Image.asset("image/6.png",height: 45,)),
                                              Center(
                                                child: CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor: Color(0xff526D46),),
                                              ),
                                              Center(child: Image.asset("image/7.png",height: 13,)),

                                            ],
                                         ),
                                          ),
                                          SizedBox(height: 16,),
                                          Row(
                                            children: [
                                              Text("Jamini Roy",textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                                  color: Color(0XFF747474),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              SizedBox(
                                                  width: 14,
                                                  child: Divider(color: Color(0xff3C5233),thickness: 1,)),
                                              // Image.asset("image/Line.png",width: 18,color: Color(0xff3C5233),),
                                              SizedBox(width: 10,),
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
                                  );
                                },
                                // 40 list items
                                childCount: 3,
                              ),
                            ),
                          ),
                        ])
                    )
                  ],
                ):Container(),
                const SizedBox(height: 30,),
                ElevatedButton(
                  style:   ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0XFFFFFFFF)),
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
                    padding: const EdgeInsets.only(right: 16.0,left: 16,top: 12,bottom: 12),
                    child: Text('LOAD MORE', style:
                    Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0XFF000000),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2
                    ),),
                  ),
                ),
                SizedBox(height: 30,),

                const SizedBox(height: 16,),
                SizedBox(

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

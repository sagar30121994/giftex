import 'package:flutter/material.dart';
import 'package:giftex/screens/artistpage/artistpage.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';
import 'package:giftex/screens/components/footer/footer.dart';
import 'package:giftex/screens/components/header.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ArtMovementPage extends StatefulWidget {
  @override
  _ArtMovementPageState createState() => _ArtMovementPageState();
}

class _ArtMovementPageState extends State<ArtMovementPage> {
  int _pageIndex = 0;
  Color tabColor = Color(0xff6D905D);
  String newsType = "LATEST NEWS";
  PageController _controller = PageController();
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  // final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  // final GlobalKey<ExpansionTileCardState> cardB= new GlobalKey();
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
              Text(
                "ART MOVEMENT",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "start Doing work that matters",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0xff466D33),
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .80,
                child: Text(
                  "we host over 200 auctions annually and offer a cross-category selection of items available for immediate purchase via both digital and physical shopping experiences as well as private sales.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                      padding: EdgeInsets.only(top: 70, bottom: 0),
                      child: Container(
                        //replace this Container with your Card
                        color: Color(0Xff3C5233),
                        height: 200.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 70, bottom: 0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
                      padding: const EdgeInsets.only(top: 20, bottom: 0, left: 120),
                      child: Image.asset(
                        "image/6 1.png",
                        height: 210,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100, bottom: 0, left: 70),
                      child: Image.asset(
                        "image/7 1.png",
                        height: 130,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              Container(
                color: Color(0xffFFFFFF),
                child: DefaultTabController(
                  length: 4,
                  child: SingleChildScrollView(
                    child: TabBar(
                      onTap: (index) {
                        setState(() {
                          // if(index==0) { tabColor = Color(0xff6D905D);}
                          // if(index==1) {tabColor =  Color(0xff6D905D);}
                          // if(index==2) {tabColor =  Color(0xff6D905D);}
                        });
                        print(index);
                      },
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: Color(0xff8DAB7F), width: 2.0),
                      ),
                      isScrollable: true,
                      padding: EdgeInsets.all(0),
                      unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.6),
                      labelColor: const Color(0xFF000000),
                      unselectedLabelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0xff2D2D2D).withOpacity(0.4), fontWeight: FontWeight.w500, letterSpacing: 1),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Color(0xff2D2D2D), fontWeight: FontWeight.w500, letterSpacing: 1),
                      tabs: [
                        Tab(text: "ABOUT ART"),
                        Tab(text: "HISTORY"),
                        Tab(text: "ARTIST"),
                        Tab(text: "STORIES & VIDEOS"),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ABOUT ART",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black, fontWeight: FontWeight.w700, letterSpacing: 2.14286),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Modern Art",
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Color(0xff466D33), fontWeight: FontWeight.w600, letterSpacing: 2.14286),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo",
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Color(0XFF000000), fontWeight: FontWeight.w400, letterSpacing: 1),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo",
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Color(0XFF000000), fontWeight: FontWeight.w400, letterSpacing: 1),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "image/Shape (8).png",
                          height: 20,
                          fit: BoxFit.fill,
                          color: Color(0xff80A071),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "HISTORY",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black, fontWeight: FontWeight.w700, letterSpacing: 2),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 32.0, top: 16),
                      child: Container(
                        color: Color(0xffFFFFFF),
                        height: 470,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * .9,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 100.0),
                              child: Image.asset(
                                "image/Rectangle (4).png",
                                width: MediaQuery.of(context).size.width * 9,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * .7,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "image/Rectangle 2.png",
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "2023",
                                          textAlign: TextAlign.left,
                                          style: Theme.of(context).textTheme.headline3!.copyWith(
                                              color: Color(0xff466D33).withOpacity(0.1),
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Lorem ipsum dolor sit amet, consecte tur adipiscing elit, Lore ipsum dolor sit Lorem ipsum dolor sit amet, consecte tur adipiscing elit, Lorem ipsum dolor sit Lorem ipsum dolor sit amet, consecte tur adipiscing elit, Lorem ipsum dolor sit Lore ipsum dolor sit amet, consecte tur adipiscing elit, Lorem ipsu dolor sit....",
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0xff747474),
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 16),
                child: Container(
                  color: Color(0xffFFFFFF),
                  height: 360,
                  alignment: Alignment.topLeft,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  child: PageView.builder(
                    controller: controller,
                    itemBuilder: (BuildContext context, int pos) {
                      return Container(
                        padding: EdgeInsets.all(0),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50.0),
                              child: Image.asset(
                                "image/Rectangle 1545.png",
                                width: MediaQuery.of(context).size.width * .6,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * .6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "image/Rectangle 1576.png",
                                      fit: BoxFit.cover,
                                      height: 150,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Suhas Bahulakr",
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context).textTheme.headline6!.copyWith(
                                            color: Color(0xff2D2D2D),
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Eminent Artist",
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0xff2D2D2D),
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(Color(0XFF466D33)),
                                          shape:
                                              MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                            // side: BorderSide(color: Colors.red)
                                          ))),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ArtistPage()));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                                        child: Text(
                                          'View Profile',
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: 3,
                  ),
                ),
              ),
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
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "STORIES/VIDEOS ON\nART NAME",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 16),
                child: Container(
                  color: Color(0xffFFFFFF),
                  height: 400,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * .9,
                  padding: EdgeInsets.all(16),
                  child: ListView.builder(
                      // itemExtent: 150,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.only(bottom: 16),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 100.0),
                                  child: Image.asset(
                                    "image/Rectangle (13).png",
                                    fit: BoxFit.cover,
                                    height: 230,
                                    width: MediaQuery.of(context).size.width * .9,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Image.asset(
                                          "image/Rectangle 2.png",
                                          fit: BoxFit.cover,
                                          height: 200,
                                          width: MediaQuery.of(context).size.width * .7,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 88.0, left: 100),
                                          child: Image.asset(
                                            "image/6.png",
                                            height: 45,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 97.0, left: 107),
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Color(0xff526D46),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(top: 106.0, left: 118),
                                            child: Image.asset(
                                              "image/7.png",
                                              height: 13,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0),
                                      child: Row(
                                        children: [
                                          // Image.asset("image/Line.png",width: 18,color: Color(0xff3C5233),),

                                          Text(
                                            "January 10, 2022",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                  color: Color(0XFF747474),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Story Title: Lorem ipsum \ndolor sit amet",
                                            textAlign: TextAlign.left,
                                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Color(0xff2D2D2D),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      itemCount: 2),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0XFFFFFFFF)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Color(0xff747474), width: 0.38)))),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 16, top: 12, bottom: 12),
                  child: Text(
                    'Load More',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Color(0XFF2D2D2D), fontWeight: FontWeight.w600, letterSpacing: 2),
                  ),
                ),
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
      bottomNavigationBar: Dashboard2Ui(),
    );
  }
}

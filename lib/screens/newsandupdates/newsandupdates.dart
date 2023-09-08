import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/viewmodel/service/serviceviewmodel.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../components/header.dart';

ServiceViewModel serviceViewModel = ServiceViewModel();

class NewsAndUpdatesPage extends StatefulWidget {
  NewsAndUpdatesPage(this.type);

  String type;

  @override
  _NewsAndUpdatesPageState createState() => _NewsAndUpdatesPageState();
}

class _NewsAndUpdatesPageState extends State<NewsAndUpdatesPage> {
  int _pageIndex = 0;
  Color tabColor = Color(0xff6D905D);
  String newsType = "LATEST NEWS";

  @override
  void initState() {
    // TODO: implement initState
    newsType = widget.type;
    callApi();
    super.initState();
  }

  callApi() async {
    if (newsType == "LATEST NEWS") {
      serviceViewModel.getNews();
    } else if (newsType == "VIDEOS") {
    } else {
      serviceViewModel.getBlogs();
    }
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: Observer(builder: (context) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "NEWS AND UPDATES",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w600, letterSpacing: 0.888889),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "FIND YOUR SERVICES THAT FITS YOUR NEEDS",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      // style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      //       color: Color(0xff466D33),
                      //       fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width * .90,
                child: Text(
                  "We feature premium artworks including modern, contemporary, and street art",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Color(0XFF000000), fontWeight: FontWeight.w500, letterSpacing: 1),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
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
                          "image/5 1.png",
                          height: 200,
                        )),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverPinnedHeader(
              child: Container(
                color: Color(0xffFFFFFF),
                child: DefaultTabController(
                  length: 3,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      //This is for background color
                      color: Colors.white.withOpacity(0.0),

                      //This is for bottom border that
                      // is needed
                      border: Border(bottom: BorderSide(color: Color(0xffDFDFDF), width: 2)),
                    ),
                    child: TabBar(
                      onTap: (index) {
                        setState(() {
                          if (index == 0) {
                            tabColor = Theme.of(context).primaryColor;
                            newsType = "LATEST NEWS";
                            callApi();
                          }
                          if (index == 1) {
                            tabColor = Theme.of(context).primaryColor;
                            newsType = "VIDEOS";
                            callApi();
                          }
                          if (index == 2) {
                            tabColor = Theme.of(context).primaryColor;
                            newsType = "BLOGS";
                            callApi();
                          }
                        });
                        print(index);
                      },
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
                      ),
                      padding: EdgeInsets.all(0),
                      labelPadding: EdgeInsets.all(0),
                      unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.59),
                      labelColor: const Color(0xFF2D2D2D),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Color(0xff2D2D2D), fontWeight: FontWeight.w600, letterSpacing: 1),
                      unselectedLabelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0xff2D2D2D).withOpacity(0.4), fontWeight: FontWeight.w600, letterSpacing: 1),
                      tabs: [
                        Tab(text: "LATEST NEWS"),
                        Tab(text: "VIDEOS"),
                        Tab(text: "BLOGS"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                child: serviceViewModel.isloading ? LinearProgressIndicator() : Container(),
              ),
            ),
            newsType == "BLOGS"
                ? serviceViewModel.isloading
                    ? SliverToBoxAdapter()
                    : SliverAnimatedPaintExtent(
                        duration: const Duration(milliseconds: 150),
                        child: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  color: Color(0xffFFFFFF),
                                  height: 360,
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12.0),
                                        child: Image.network(
                                          "${serviceViewModel.blogsResponse!.pageContent!.blogArray![index].image!.mobile}",
                                          fit: BoxFit.cover,
                                          height: 180,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${serviceViewModel.blogsResponse!.pageContent!.blogArray![index].authorName}",
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                  color: Color(0XFF747474),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                            height: 8,
                                          ),
                                          // SizedBox(
                                          //     width: 8,
                                          //     child: Divider(
                                          //       color: Color(0xff3C5233),
                                          //       thickness: 1,
                                          //     )),
                                          // Image.asset("image/Line.png",width: 18,color: Color(0xff3C5233),),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${serviceViewModel.blogsResponse!.pageContent!.blogArray![index].timestamp}",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.overline!.copyWith(
                                                  color: Color(0XFF747474),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ],
                                      ),
                                      // const SizedBox(
                                      //   height: 10,
                                      // ),

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${serviceViewModel.blogsResponse!.pageContent!.blogArray![index].title!.toUpperCase()}",
                                          textAlign: TextAlign.left,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0xff2D2D2D),
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // Text(
                                      //   "${serviceViewModel.blogsResponse!.pageContent!.blogArray![index].desc}",
                                      //   textAlign: TextAlign.left,
                                      //   style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      //         color: Color(0xff747474),
                                      //         fontWeight: FontWeight.w400,
                                      //       ),
                                      // ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            // 40 list items
                            childCount: serviceViewModel.blogsResponse!.pageContent!.blogArray!.length,
                          ),
                        ),
                      )
                : SliverToBoxAdapter(),
            newsType == "LATEST NEWS"
                ? serviceViewModel.isloading
                    ? SliverToBoxAdapter()
                    : SliverAnimatedPaintExtent(
                        duration: const Duration(milliseconds: 150),
                        child: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                                child: Container(
                                  color: Color(0xffFFFFFF),
                                  height: 420,
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 90, bottom: 30),
                                        child: Container(
                                          child: Image.asset(
                                            "image/Rectangle (3).png",
                                            fit: BoxFit.cover,
                                            width: MediaQuery.of(context).size.width * .90,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                                        child: Column(
                                          children: [
                                            Image.network(
                                              height: 220,
                                              serviceViewModel
                                                      .pressResponse!.pageContent!.array![index].image!.mobile ??
                                                  "",
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${serviceViewModel.pressResponse!.pageContent!.array![index].timestamp}",
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                        color: Color(0XFF3C5233),
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${serviceViewModel.pressResponse!.pageContent!.array![index].title}",
                                              textAlign: TextAlign.left,
                                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0xff2D2D2D),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            // Text(
                                            //   "${serviceViewModel.pressResponse!.pageContent!.array![index].}",
                                            //   textAlign: TextAlign.left,
                                            //   style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            //         color: Color(0xff747474),
                                            //         fontWeight: FontWeight.w400,
                                            //       ),
                                            // ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Read More",
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                            childCount: serviceViewModel.pressResponse!.pageContent!.array!.length,
                          ),
                        ),
                      )
                : SliverToBoxAdapter(),
            newsType == "VIDEOS"
                ? serviceViewModel.isloading
                    ? SliverToBoxAdapter()
                    : SliverAnimatedPaintExtent(
                        duration: const Duration(milliseconds: 150),
                        child: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16, bottom: 10),
                                child: Container(
                                  height: 140,

                                  // alignment: Alignment.center,

                                  child: Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * .25,
                                        height: 140,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "image/Rectangle (3).png",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          color: Color(0xffFFFFFF),
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              child: Image.asset(
                                                "image/Rectangle 1741.png",
                                                height: 150,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Center(
                                                child: Image.asset(
                                              "image/6.png",
                                              height: 45,
                                            )),
                                            Center(
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Color(0xff526D46),
                                              ),
                                            ),
                                            Center(
                                                child: Image.asset(
                                              "image/7.png",
                                              height: 13,
                                            ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width * .67,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Jan 10, 2022",
                                                  textAlign: TextAlign.start,
                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        color: Color(0XFF3C5233),
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              "Lorem ipsum dolor sit",
                                              textAlign: TextAlign.left,
                                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0xff2D2D2D),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width,
                                              child: Text(
                                                "Lorem ipsum dolor sit amet, consecte tur adipiscing elit,",
                                                textAlign: TextAlign.left,
                                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Color(0xff747474),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "watch More",
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                      )
                : SliverToBoxAdapter(),
          ],
          // children: [
          //   const
          //   ,
          //   const ,
          //   ,
          //   const ,
          //   ,
          //   const ,
          //   ,
          //   SizedBox(
          //     height: 16,
          //   ),
          //   Container(
          //     color: Color(0xffFFFFFF),
          //     child: DefaultTabController(
          //       length: 3,
          //       child: DecoratedBox(
          //         decoration: BoxDecoration(
          //           //This is for background color
          //           color: Colors.white.withOpacity(0.0),
          //
          //           //This is for bottom border that is needed
          //           border: Border(bottom: BorderSide(color: Color(0xffDFDFDF), width: 2)),
          //         ),
          //         child: TabBar(
          //           onTap: (index) {
          //             setState(() {
          //               if (index == 0) {
          //                 tabColor = Color(0xff6D905D);
          //                 newsType = "LATEST NEWS";
          //               }
          //               if (index == 1) {
          //                 tabColor = Color(0xff6D905D);
          //                 newsType = "VIDEOS";
          //               }
          //               if (index == 2) {
          //                 tabColor = Color(0xff6D905D);
          //                 newsType = "BLOGS";
          //               }
          //             });
          //             print(index);
          //           },
          //           indicator: UnderlineTabIndicator(
          //             borderSide: BorderSide(color: Color(0xff8DAB7F), width: 2.0),
          //           ),
          //           padding: EdgeInsets.all(0),
          //           labelPadding: EdgeInsets.all(0),
          //           unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.59),
          //           labelColor: const Color(0xFF2D2D2D),
          //           labelStyle: Theme.of(context)
          //               .textTheme
          //               .bodyText1!
          //               .copyWith(color: Color(0xff2D2D2D), fontWeight: FontWeight.w600, letterSpacing: 1),
          //           unselectedLabelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
          //               color: Color(0xff2D2D2D).withOpacity(0.4), fontWeight: FontWeight.w600, letterSpacing: 1),
          //           tabs: [
          //             Tab(text: "LATEST NEWS"),
          //             Tab(text: "VIDEOS"),
          //             Tab(text: "BLOGS"),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          //   SizedBox(
          //     height: 16,
          //   ),
          //
          //   const SizedBox(
          //     height: 30,
          //   ),
          //   ElevatedButton(
          //     style: ButtonStyle(
          //         backgroundColor: MaterialStateProperty.all(Color(0XFFFFFFFF)),
          //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(20.0),
          //             side: BorderSide(color: Color(0xff747474), width: 0.38)))),
          //     onPressed: () {},
          //     child: Padding(
          //       padding: const EdgeInsets.only(right: 16.0, left: 16, top: 12, bottom: 12),
          //       child: Text(
          //         'LOAD MORE',
          //         style: Theme.of(context)
          //             .textTheme
          //             .bodyText1!
          //             .copyWith(color: Color(0XFF000000), fontWeight: FontWeight.w600, letterSpacing: 2),
          //       ),
          //     ),
          //   ),
          //   SizedBox(
          //     height: 30,
          //   ),
          //   const SizedBox(
          //     height: 16,
          //   ),
          //   SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
          //   Container(
          //     color: Color(0xff1F2A52),
          //     height: 30,
          //     width: MediaQuery.of(context).size.width,
          //   ),
          // ],
        );
      }),
    );
  }
}

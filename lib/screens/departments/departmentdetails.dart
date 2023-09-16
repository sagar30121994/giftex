import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:giftex/screens/departments/departments.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/footer/footer.dart';
import '../components/header.dart';

class DepartmentDetails extends StatefulWidget {
  @override
  _DepartmentDetails createState() => _DepartmentDetails();
}

class _DepartmentDetails extends State<DepartmentDetails> {
  PageController sliderController = PageController();
  final controller1 = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  void initState() {
    homeViewModel.getDepartmentDetails();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        controller: controller,
        child: Observer(builder: (context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height*.90,
              child: homeViewModel.isloadingdepartmentdetails
                  ? LinearProgressIndicator()
                  : SingleChildScrollView(
                      child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          homeViewModel.getDepartmentDetailsResponse == null
                              ? ''
                              : homeViewModel.getDepartmentDetailsResponse!.pageContent == null
                                  ? ''
                                  : homeViewModel.getDepartmentDetailsResponse!.pageContent!.banner == null
                                      ? ''
                                      : homeViewModel.getDepartmentDetailsResponse!.pageContent!.banner!.title ?? '',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 0.888889),
                          // style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          //     color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 260,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 150 / 2.0, bottom: 0),
                              child: Container(
                                //replace this Container with your Card
                                color: Color(0Xff1F2A52),
                                height: 160.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 150 / 2.0, bottom: 0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xff8C9FB1),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(250),
                                      bottomRight: Radius.circular(250),
                                    ),
                                  ),
                                  height: 140.0,
                                ),
                              ),
                            ),
                            Positioned(
                                left: 0,
                                right: 0,
                                child: Image.network(
                                  homeViewModel.getDepartmentDetailsResponse == null
                                      ? ''
                                      : homeViewModel.getDepartmentDetailsResponse!.pageContent == null
                                          ? ''
                                          : homeViewModel.getDepartmentDetailsResponse!.pageContent!.banner == null
                                              ? ''
                                              : homeViewModel.getDepartmentDetailsResponse!.pageContent!.banner!.image!
                                                      .mobile ??
                                                  "",
                                  height: 180,
                                )),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: HtmlWidget(
                              '${homeViewModel.getDepartmentDetailsResponse == null ? '' : homeViewModel.getDepartmentDetailsResponse!.pageContent == null ? '' : homeViewModel.getDepartmentDetailsResponse!.pageContent!.banner == null ? '' : homeViewModel.getDepartmentDetailsResponse!.pageContent!.banner!.desc ?? ""}',
                              // textStyle: TextStyle(fontSize: 14),
                            ),
                          ),

                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    homeViewModel.getDepartmentDetailsResponse == null
                                        ? ''
                                        : homeViewModel.getDepartmentDetailsResponse!.pageContent == null
                                            ? ''
                                            : homeViewModel.getDepartmentDetailsResponse!.pageContent!.banner == null
                                                ? ''
                                                : homeViewModel.getDepartmentDetailsResponse!.pageContent!.talkToExpert!
                                                        .title ??
                                                    "",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),

                          Observer(builder: (context) {
                            return homeViewModel.isloadingdepartmentdetails
                                ? Container()
                                : Container(
                                    height: 320,
                                    width: MediaQuery.of(context).size.width,
                                    // padding: EdgeInsets.all(12),
                                    child: PageView.builder(
                                        controller: controller1,
                                        padEnds: true,
                                        itemBuilder: (BuildContext context, int pos) {
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 15.0, right: 5),
                                                child: Image.network(
                                                  "${homeViewModel.getDepartmentDetailsResponse!.pageContent!.talkToExpert!.expertProfile![pos].image!.mobile ?? ""}",
                                                  width: MediaQuery.of(context).size.width / 2,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Container(
                                                  width: 200,
                                                  padding: EdgeInsets.only(top: 2.0, bottom: 0, left: 25.0, right: 0),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      SizedBox(
                                                        height: 0,
                                                      ),
                                                      Text(
                                                        "${homeViewModel.getDepartmentDetailsResponse!.pageContent!.talkToExpert!.expertProfile![pos].name ?? ""}",
                                                        textAlign: TextAlign.start,
                                                        maxLines: 1,
                                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                            color: Color(0xff2D2D2D),
                                                            fontWeight: FontWeight.w400,
                                                            letterSpacing: 1,
                                                            fontSize: 14,
                                                            overflow: TextOverflow.ellipsis),
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        "${homeViewModel.getDepartmentDetailsResponse!.pageContent!.talkToExpert!.expertProfile![pos].designation ?? ""}",
                                                        textAlign: TextAlign.center,
                                                        maxLines: 1,
                                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                            color: Color(0xff2D2D2D),
                                                            fontWeight: FontWeight.w400,
                                                            letterSpacing: 1,
                                                            fontSize: 12,
                                                            overflow: TextOverflow.ellipsis),
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        "${homeViewModel.getDepartmentDetailsResponse!.pageContent!.talkToExpert!.expertProfile![pos].mail ?? ""}",
                                                        textAlign: TextAlign.center,
                                                        maxLines: 1,
                                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                            color: Color(0xff2D2D2D),
                                                            fontWeight: FontWeight.w400,
                                                            letterSpacing: 1,
                                                            fontSize: 12,
                                                            overflow: TextOverflow.ellipsis),
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          );
                                        },
                                        itemCount: homeViewModel.getDepartmentDetailsResponse == null
                                            ? 0
                                            : homeViewModel.getDepartmentDetailsResponse!.pageContent!.talkToExpert!
                                                .expertProfile!.length),
                                  );
                          }),
                          SizedBox(
                            height: 24,
                          ),
                          Observer(builder: (context) {
                            return homeViewModel.isloadingdepartmentdetails
                                ? Container()
                                : homeViewModel.getDepartmentDetailsResponse == null
                                    ? Container()
                                    : Center(
                                        child: SmoothPageIndicator(
                                          controller: controller1,
                                          count: homeViewModel.getDepartmentDetailsResponse == null
                                              ? 0
                                              : homeViewModel.getDepartmentDetailsResponse!.pageContent!.talkToExpert!
                                                  .expertProfile!.length,
                                          effect: WormEffect(
                                              dotHeight: 10,
                                              dotWidth: 10,
                                              type: WormType.thin,
                                              activeDotColor: Color(0xff3C5233),
                                              dotColor: Color(0xffD1D1D1)
                                              // strokeWidth: 5,
                                              ),
                                        ),
                                      );
                          }),

                          SizedBox(
                            height: 24,
                          ),

                          // Row(
                          //   children: [
                          //     Padding(
                          //         padding: EdgeInsets.all(16),
                          //         child: Text(
                          //           " Past Auctions",
                          //           style: TextStyle(
                          //             fontSize: 16,
                          //             fontWeight: FontWeight.w600,
                          //           ),
                          //         )),
                          //   ],
                          // ),

                          // Observer(builder: (context) {
                          //   return homeViewModel.isloadingdepartmentdetails
                          //       ? Container()
                          //       : Container(
                          //           height: 320,
                          //           width: MediaQuery.of(context).size.width,
                          //           // padding: EdgeInsets.all(12),
                          //           child: ListView.builder(
                          //               controller: controller,
                          //               scrollDirection: Axis.horizontal,
                          //               itemBuilder: (BuildContext context, int pos) {
                          //                 return Padding(
                          //                   padding: const EdgeInsets.all(0.0),
                          //                   child: Stack(
                          //                     children: [
                          //                       Positioned(
                          //                         bottom: 0,
                          //                         left: 50,
                          //                         right: 50,
                          //                         child: Container(
                          //                           //replace this Container with your Card
                          //                           // height: 385,
                          //                           width: 180,
                          //                         ),
                          //                       ),
                          //                       Padding(
                          //                         padding: const EdgeInsets.only(left: 15.0, right: 5),
                          //                         child: Image.network(
                          //                           "${homeViewModel.getDepartmentDetailsResponse!.pageContent!.result!.auctions![pos].image ?? ""}",
                          //                           height: 210,
                          //                           width: 180,
                          //                           fit: BoxFit.fill,
                          //                         ),
                          //                       ),
                          //                       Container(
                          //                           width: 200,
                          //                           padding: EdgeInsets.only(
                          //                               top: 430 / 2.0, bottom: 0, left: 25.0, right: 0),
                          //                           child: Column(
                          //                             mainAxisAlignment: MainAxisAlignment.center,
                          //                             crossAxisAlignment: CrossAxisAlignment.center,
                          //                             mainAxisSize: MainAxisSize.min,
                          //                             children: [
                          //                               SizedBox(
                          //                                 height: 0,
                          //                               ),
                          //                               Text(
                          //                                 "${homeViewModel.getDepartmentDetailsResponse!.pageContent!.result!.auctions![pos].auctionName ?? ""}",
                          //                                 textAlign: TextAlign.start,
                          //                                 maxLines: 1,
                          //                                 style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          //                                     color: Color(0xff2D2D2D),
                          //                                     fontWeight: FontWeight.w400,
                          //                                     letterSpacing: 1,
                          //                                     fontSize: 14,
                          //                                     overflow: TextOverflow.ellipsis),
                          //                               ),
                          //                               SizedBox(
                          //                                 height: 4,
                          //                               ),
                          //                               Text(
                          //                                 "${homeViewModel.getDepartmentDetailsResponse!.pageContent!.result!.auctions![pos].displayDate}",
                          //                                 textAlign: TextAlign.center,
                          //                                 maxLines: 1,
                          //                                 style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          //                                     color: Color(0xff2D2D2D),
                          //                                     fontWeight: FontWeight.w400,
                          //                                     letterSpacing: 1,
                          //                                     fontSize: 12,
                          //                                     overflow: TextOverflow.ellipsis),
                          //                               ),
                          //                               SizedBox(
                          //                                 height: 4,
                          //                               ),
                          //                               Text(
                          //                                 "${homeViewModel.getDepartmentDetailsResponse!.pageContent!.result!.auctions![pos].totalSaleValue ?? ""}",
                          //                                 textAlign: TextAlign.center,
                          //                                 maxLines: 1,
                          //                                 style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          //                                     color: Color(0xff2D2D2D),
                          //                                     fontWeight: FontWeight.w400,
                          //                                     letterSpacing: 1,
                          //                                     fontSize: 12,
                          //                                     overflow: TextOverflow.ellipsis),
                          //                               ),
                          //                             ],
                          //                           )),
                          //                     ],
                          //                   ),
                          //                 );
                          //               },
                          //               itemCount:
                          //                   homeViewModel.getDepartmentDetailsResponse!.pageContent!.result == null
                          //                       ? 0
                          //                       : homeViewModel.getDepartmentDetailsResponse!.pageContent!.result!
                          //                           .auctions!.length),
                          //         );
                          // }),
                          // SizedBox(
                          //   height: 24,
                          // ),
                          //
                          // const SizedBox(
                          //   height: 16,
                          // ),

                          // Observer(builder: (context) {
                          //   return homeViewModel.isloadingdepartmentdetails
                          //       ? Container()
                          //       : Container(
                          //           color: Color(0xffFFFFFF),
                          //           height: 340,
                          //           width: MediaQuery.of(context).size.width,
                          //           padding: EdgeInsets.all(0),
                          //           child: PageView.builder(
                          //             controller: controller1,
                          //             itemBuilder: (BuildContext context, int pos) {
                          //               return Container(
                          //                 color: Color(0xffFFFFFF),
                          //                 height: 350,
                          //                 alignment: Alignment.center,
                          //                 margin: EdgeInsets.only(right: 16),
                          //                 width: MediaQuery.of(context).size.width * 0.8,
                          //                 child: Stack(
                          //                   children: [
                          //                     Padding(
                          //                       padding: EdgeInsets.only(left: 0, right: 0, top: 50),
                          //                       child: Container(
                          //                         color: Color(0xffEAEEF2),
                          //                       ),
                          //                     ),
                          //                     Padding(
                          //                       padding: const EdgeInsets.only(left: 16, right: 16),
                          //                       child: Column(
                          //                         // crossAxisAlignment: CrossAxisAlignment.start,
                          //                         children: [
                          //                           homeViewModel.selectedNewsTabIndex == 0
                          //                               ? Image.network(
                          //                                   "${homeViewModel.homeNewsVideosBlogsResponse!.news![pos].image!.mobile}",
                          //                                   fit: BoxFit.contain,
                          //                                   height: 200)
                          //                               : homeViewModel.selectedNewsTabIndex == 1
                          //                                   ? Image.network(
                          //                                       "${homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].image!.mobile}",
                          //                                       fit: BoxFit.contain,
                          //                                       height: 200)
                          //                                   : Image.network(
                          //                                       "${homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].image!.mobile}",
                          //                                       fit: BoxFit.contain,
                          //                                       height: 200),
                          //                           SizedBox(
                          //                             height: 16,
                          //                           ),
                          //                           homeViewModel.selectedNewsTabIndex == 0
                          //                               ? Text(
                          //                                   "${homeViewModel.homeNewsVideosBlogsResponse!.news![pos].timestamp}",
                          //                                   textAlign: TextAlign.center,
                          //                                   style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          //                                         color: Theme.of(context).colorScheme.primary,
                          //                                         fontWeight: FontWeight.w700,
                          //                                       ),
                          //                                 )
                          //                               : homeViewModel.selectedNewsTabIndex == 1
                          //                                   ? Text(
                          //                                       "${homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].timestamp}",
                          //                                       textAlign: TextAlign.center,
                          //                                       style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          //                                             color: Theme.of(context).colorScheme.primary,
                          //                                             fontWeight: FontWeight.w700,
                          //                                           ),
                          //                                     )
                          //                                   : Text(
                          //                                       "${homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].timestamp}",
                          //                                       textAlign: TextAlign.center,
                          //                                       style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          //                                             color: Theme.of(context).colorScheme.primary,
                          //                                             fontWeight: FontWeight.w700,
                          //                                           ),
                          //                                     ),
                          //                           const SizedBox(
                          //                             height: 10,
                          //                           ),
                          //                           homeViewModel.selectedNewsTabIndex == 0
                          //                               ? Container(
                          //                                   height: 70,
                          //                                   child: HtmlWidget(
                          //                                     textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                          //                                     "${homeViewModel.homeNewsVideosBlogsResponse!.news![pos].title}",
                          //                                   ),
                          //                                 )
                          //                               : homeViewModel.selectedNewsTabIndex == 1
                          //                                   ? Container(
                          //                                       height: 70,
                          //                                       child: HtmlWidget(
                          //                                         textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                          //                                         "${homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].title}",
                          //                                       ),
                          //                                     )
                          //                                   : Container(
                          //                                       height: 70,
                          //                                       child: HtmlWidget(
                          //                                         textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                          //                                         "${homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].title}",
                          //                                       ),
                          //                                     ),
                          //                           const SizedBox(
                          //                             height: 10,
                          //                           ),
                          //                           // homeViewModel.selectedNewsTabIndex == 0
                          //                           //     ? SizedBox(
                          //                           //         height: 40,
                          //                           //         child: HtmlWidget(
                          //                           //           textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                          //                           //           "${homeViewModel.homeNewsVideosBlogsResponse!.news![pos].desc!.length > 200 ? homeViewModel.homeNewsVideosBlogsResponse!.news![pos].desc!.substring(0, 150) : homeViewModel.homeNewsVideosBlogsResponse!.news![pos].desc}",
                          //                           //         ),
                          //                           //       )
                          //                           //     : homeViewModel.selectedNewsTabIndex == 1
                          //                           //         ? SizedBox(
                          //                           //             height: 40,
                          //                           //             child: HtmlWidget(
                          //                           //               textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                          //                           //               "${homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].desc!.length > 200 ? homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].desc!.substring(0, 150) : homeViewModel.homeNewsVideosBlogsResponse!.videos![pos].desc}",
                          //                           //             ),
                          //                           //           )
                          //                           //         : SizedBox(
                          //                           //             height: 40,
                          //                           //             child: HtmlWidget(
                          //                           //               textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                          //                           //               "${homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].desc!.length > 200 ? homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].desc!.substring(0, 150) : homeViewModel.homeNewsVideosBlogsResponse!.blogs![pos].desc}",
                          //                           //             ),
                          //                           //           ),
                          //                           const SizedBox(
                          //                             height: 10,
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               );
                          //             },
                          //             itemCount: homeViewModel.selectedNewsTabIndex == 0
                          //                 ? homeViewModel.homeNewsVideosBlogsResponse == null
                          //                     ? 0
                          //                     : homeViewModel.homeNewsVideosBlogsResponse!.news!.length
                          //                 : homeViewModel.selectedNewsTabIndex == 1
                          //                     ? homeViewModel.homeNewsVideosBlogsResponse!.videos!.length
                          //                     : homeViewModel.homeNewsVideosBlogsResponse!.blogs!.length,
                          //           ),
                          //         );
                          // }),
                          // const SizedBox(
                          //   height: 16,
                          // ),
                          SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
                        ],
                      ),
                    ])));
        }),
      ),
      // bottomNavigationBar: Dashboard2Ui(),
    );
  }
}

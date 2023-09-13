import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:giftex/screens/components/footer/footer.dart';
import 'package:giftex/screens/components/header.dart';
import 'package:giftex/viewmodel/home/homeviewmodel.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:url_launcher/url_launcher.dart';

class ArtMovement extends StatefulWidget {
  @override
  _ArtMovement createState() => _ArtMovement();
}

class _ArtMovement extends State<ArtMovement> {
  HomeViewModel homeViewModel = HomeViewModel();
  int _pageIndex = 0;
  Color tabColor = Color(0xff6D905D);
  String newsType = "ABOUT ART";

  @override
  void initState() {
    homeViewModel.getArtsMovement();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: Observer(builder: (context) {
        return homeViewModel.isloadingartmovement
            ? LinearProgressIndicator(
                minHeight: 2,
              )
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      "${homeViewModel.getArtMovementResponse!.pageContent!.bannerItem!.title ?? ''}",
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
                      "START DOING WORK THAT MATTERS",
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
                        "We host our 200 auctions annually and offer a cross-category selection of items available for immediate purchase via both digital and physical shopping experience as well as private sales.",
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
                              child: Image.network(
                                "${homeViewModel.getArtMovementResponse!.pageContent!.bannerItem!.image!.mobile ?? ''}",
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
                                  newsType = "ABOUT ART";
                                }
                                if (index == 1) {
                                  tabColor = Theme.of(context).primaryColor;
                                  newsType = "HISTORY";
                                }
                                if (index == 2) {
                                  tabColor = Theme.of(context).primaryColor;
                                  newsType = "ARTIST";
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
                                color: Color(0xff2D2D2D).withOpacity(0.4),
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                            tabs: [
                              Tab(text: "ABOUT ART "),
                              Tab(text: "HISTORY"),
                              Tab(text: "ARTIST"),
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
                      child: homeViewModel.isloadingartmovement ? LinearProgressIndicator() : Container(),
                    ),
                  ),
                  newsType == "ARTIST"
                      ? homeViewModel.isloadingartmovement
                          ? SliverToBoxAdapter()
                          : SliverToBoxAdapter(
                              child: Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${homeViewModel.getArtMovementResponse!.pageContent!.artVideos!.title}",
                                          style: Theme.of(context).textTheme.headline6!.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.888889),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Wrap(
                                      spacing: 20,
                                      runSpacing: 20,
                                      children:
                                          homeViewModel.getArtMovementResponse!.pageContent!.artVideos!.array!.map((e) {
                                        return Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width, // Half the screen width

                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Container(
                                                        child: Image.network(
                                                          "${e.image!.mobile ?? ''}",
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          Uri _url = Uri.parse("${e.videoUrl}");
                                                          if (!await launchUrl(_url)) {
                                                            throw Exception('Could not launch $_url');
                                                          }
                                                        },
                                                        child: Image.asset(
                                                          "image/Playsymbol.png",
                                                          height: 45,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 18),
                                                Text(
                                                  style: TextStyle(fontWeight: FontWeight.w400),
                                                  e!.date ?? "",
                                                ),
                                                SizedBox(height: 12),
                                                HtmlWidget(
                                                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                                                  e!.title ?? "",
                                                ),
                                                /* HtmlWidget(
                                        textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                        "${e!.videoUrl ?? ""}",
                                      ),*/
                                              ],
                                            ),
                                            // child: Text('Furniture & Decorative Art'),
                                          ),
                                        );
                                      }).toList())
                                ],
                              ),
                            ))
                      : SliverToBoxAdapter(
                          child: SizedBox(
                            child: homeViewModel.isloadingartmovement ? LinearProgressIndicator() : Container(),
                          ),
                        ),
                  newsType == "ABOUT ART"
                      ? homeViewModel.isloadingartmovement
                          ? SliverToBoxAdapter()
                          : SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HtmlWidget(
                                      '${homeViewModel.getArtMovementResponse!.pageContent!.aboutArt!.title}',
                                      textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Theme.of(context).colorScheme.primary,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(height: 8),
                                    HtmlWidget('${homeViewModel.getArtMovementResponse!.pageContent!.aboutArt!.desc}'),
                                  ],
                                ),
                              ),
                            )
                      : SliverToBoxAdapter(),
                  newsType == "HISTORY"
                      ? homeViewModel.isloadingartmovement
                          ? SliverToBoxAdapter()
                          : SliverToBoxAdapter(
                              child: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: SingleChildScrollView(
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: homeViewModel.historyYearList
                                            .map((e) => Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 24,
                                                      margin: EdgeInsets.only(right: 0),
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            shape: StadiumBorder(),
                                                            backgroundColor: Colors.white,
                                                            alignment: Alignment.center),
                                                        onPressed: () {
                                                          setState(() {
                                                            homeViewModel.selectedyear = e;
                                                          });
                                                        },
                                                        child: Text(
                                                          '${e ?? ''}',
                                                          style: Theme.of(context).textTheme!.subtitle1!.copyWith(
                                                                fontWeight: FontWeight.bold,
                                                                color: homeViewModel.selectedyear == e
                                                                    ? Colors.red
                                                                    : Colors.grey,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (homeViewModel.historyYearList.indexOf(e) <
                                                        (homeViewModel.historyYearList.length - 1))
                                                      Container(
                                                        height: 20,
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          ' ---> ',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold, color: Colors.grey),
                                                        ),
                                                      ),
                                                  ],
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Observer(builder: (context) {
                                    return Wrap(
                                        spacing: 0,
                                        runSpacing: 0,
                                        children:
                                            homeViewModel.getArtMovementResponse!.pageContent!.history!.array!.map((e) {
                                          return homeViewModel.selectedyear == e.year
                                              ? Padding(
                                                  padding: const EdgeInsets.all(16.0),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.of(context).size.width, // Half the screen width

                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            InkWell(
                                                              onTap: () async {
                                                                /* Uri _url=Uri.parse("${e.videoUrl}");
                                                    if (!await launchUrl(_url)) {
                                                      throw Exception('Could not launch $_url');
                                                    }
*/
                                                              },
                                                              child: Image.network(
                                                                "${e.image!.mobile ?? ''}",
                                                                fit: BoxFit.contain,
                                                              ),
                                                            ),
                                                            SizedBox(height: 8),
                                                            Text(
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.w900,
                                                                  fontSize: 48,
                                                                  color: Colors.blueGrey.withOpacity(.3)),
                                                              e!.year ?? "",
                                                            ),
                                                            SizedBox(height: 8),
                                                            HtmlWidget(
                                                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                                                              '<center>' + (e!.desc ?? "") + "</center>",
                                                            ),
                                                            /* HtmlWidget(
                                                textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                                "${e!.videoUrl ?? ""}",
                                              ),*/
                                                          ],
                                                        ), // child: Text('Furniture & Decorative Art'),
                                                      ),
                                                      Divider(color: Colors.grey),
                                                    ],
                                                  ),
                                                )
                                              : Container();
                                        }).toList());
                                  })
                                ],
                              ),
                            ))
                      : SliverToBoxAdapter(),
                  SliverToBoxAdapter(child: SizedBox(width: MediaQuery.of(context).size.width, child: Footer())),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 100,
                      color: Color(0xff1F2A52),
                      width: MediaQuery.of(context).size.width,
                    ),
                  )
                ],
              );
      }),
    );
  }
}

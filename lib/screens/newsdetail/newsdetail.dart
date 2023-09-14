import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/footer/footer.dart';
import '../components/header.dart';
import '../newsandupdates/newsandupdates.dart';

class NewsDetails extends StatefulWidget {
  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  int _pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState

    serviceViewModel.getpressDetails(serviceViewModel.newsArry!.id!);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _launchURL(String readMoreUrl) async {
    String url = readMoreUrl; // Replace with the URL you want to open
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
            child: serviceViewModel.isloading
                ? LinearProgressIndicator()
                : SingleChildScrollView(
                    child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "News",
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 0.888889),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          // widget.array!.title ?? '',
                          serviceViewModel.pressDetailsResponse!.pageContent!.pressDetail!.title ?? "",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 16,
                      // ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * .80,
                      //   child: Text(
                      //     serviceViewModel.pressDetailsResponse!.pageContent!.pressDetail!.credits ?? "",
                      //     textAlign: TextAlign.center,
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .subtitle1!
                      //         .copyWith(color: Color(0XFF000000), fontWeight: FontWeight.w600, letterSpacing: 1),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 16,
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
                                  serviceViewModel.pressDetailsResponse!.pageContent!.pressDetail!.image!.mobile ?? "",
                                  height: 180,
                                )),
                          ],
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16, right: 16),
                                child: Text(
                                  "By ${serviceViewModel.pressDetailsResponse!.pageContent!.pressDetail!.credits ?? ""}",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0XFF000000), fontWeight: FontWeight.w500, letterSpacing: 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              children: [
                                Image.asset("image/date.png"),
                                SizedBox(width: 4),
                                Text(
                                  serviceViewModel.pressDetailsResponse!.pageContent!.pressDetail!.timestamp ?? "",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0XFF000000), fontWeight: FontWeight.w500, letterSpacing: 1),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: HtmlWidget(
                              '${serviceViewModel.pressDetailsResponse!.pageContent!.pressDetail!.desc ?? ""}',
                              // textStyle: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          padding: EdgeInsets.all(8),
                        ),
                        onPressed: () {
                          _launchURL(
                              serviceViewModel.pressDetailsResponse!.pageContent!.pressDetail!.readMoreUrl ?? "");
                        },
                        child: Text(
                          "Read More",
                          style: Theme.of(context)
                              .textTheme!
                              .button!
                              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
                      /*SliverToBoxAdapter(
                    child: Container(
                      color: Color(0xff1F2A52),
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),*/
                    ],
                  )),
          );
        }),
      ),
      // bottomNavigationBar: Dashboard2Ui(),
    );
  }
}

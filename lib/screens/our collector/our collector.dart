import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:giftex/screens/components/footer/footer.dart';
import 'package:giftex/screens/components/header.dart';

import '../homepage/homapage.dart';

class OurCollectors extends StatefulWidget {
  const OurCollectors({super.key});

  @override
  State<OurCollectors> createState() => _OurCollectorsState();
}

class _OurCollectorsState extends State<OurCollectors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Observer(builder: (context) {
        return homeViewModel.isloadingdepartments
            ? LinearProgressIndicator(
                minHeight: 2,
              )
            // : homeViewModel.getDepartmentsResponse == null
            //     ? Container()
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Our Collector",
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 0.888889),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .90,
                        child:
                            HtmlWidget('${homeViewModel.getDepartmentsResponse!.pageContent!.bannerItem!.desc ?? ''}'),
                        // Text(
                        //
                        //   // "${homeViewModel.getDepartmentsResponse!.pageContent!.bannerItem!.desc ?? ''}",
                        //   // "We host our 200 auctions annually and offer a cross-category selection of items available for immediate purchase via both digital and physical shopping experience as well as private sales.",
                        //   textAlign: TextAlign.center,
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .bodyText1!
                        //       .copyWith(
                        //           color: Color(0XFF000000),
                        //           fontWeight: FontWeight.w600,
                        //           letterSpacing: 1),
                        // ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
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
                                  "${homeViewModel.getDepartmentsResponse!.pageContent!.bannerItem!.image!.mobile ?? ''}",
                                  height: 200,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        child: Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: homeViewModel.getDepartmentsResponse!.pageContent!.departments!.map((e) {
                              return Container(
                                width: MediaQuery.of(context).size.width / 2.2, // Half the screen width

                                child: Column(
                                  children: [
                                    Image.network(
                                      "${e.image!.mobile ?? ''}",
                                      fit: BoxFit.contain,
                                    ),
                                    Text(
                                      e!.title ?? "",
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                // child: Text('Furniture & Decorative Art'),
                              );
                            }).toList()),
                        // GridView.builder(
                        //   gridDelegate:
                        //       SliverGridDelegateWithFixedCrossAxisCount(
                        //     crossAxisCount: 2,
                        //     mainAxisSpacing: 4,
                        //     crossAxisSpacing: 4,
                        //   ),
                        //   itemCount: 10,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return Container(
                        //       height: 5,
                        //       width: 5,
                        //       color: Colors.white,
                        //       child: Center(
                        //         child: Image.network(
                        //             "${homeViewModel.getDepartmentsResponse!.pageContent!.departments![0].image!.mobile ?? ''}"),
                        //       ),
                        //     );
                        //   },
                        // ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
                      Container(
                        height: 100,
                        color: Color(0xff1F2A52),
                        width: MediaQuery.of(context).size.width,
                      )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}

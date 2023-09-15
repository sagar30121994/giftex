import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:giftex/screens/homepage/homapage.dart';

import '../components/footer/footer.dart';
import '../components/header.dart';

class DepartmentDetails extends StatefulWidget {
  @override
  _DepartmentDetails createState() => _DepartmentDetails();
}

class _DepartmentDetails extends State<DepartmentDetails> {
  @override
  void initState() {
    // TODO: implement initState

    homeViewModel.getDepartmentDetails("");
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
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: HtmlWidget(
                                  '${homeViewModel.getDepartmentDetailsResponse == null ? '' : homeViewModel.getDepartmentDetailsResponse!.pageContent == null ? '' : homeViewModel.getDepartmentDetailsResponse!.pageContent!.banner == null ? '' : homeViewModel.getDepartmentDetailsResponse!.pageContent!.banner!.desc ?? ""}',
                                  // textStyle: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(),
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
                                    // textStyle: TextStyle(fontSize: 14),
                                  )),
                            ],
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
                      ),
                    ])));
        }),
      ),
      // bottomNavigationBar: Dashboard2Ui(),
    );
  }
}

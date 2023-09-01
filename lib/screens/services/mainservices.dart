import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:giftex/viewmodel/service/serviceviewmodel.dart';

import '../components/footer/footer.dart';
import '../components/header.dart';

ServiceViewModel serviceViewModel = ServiceViewModel();

class ServiceAll extends StatefulWidget {
  ServiceAll(this.api, this.heading);

  String heading;
  String api;

  @override
  _ServiceAllState createState() => _ServiceAllState();
}

class _ServiceAllState extends State<ServiceAll> {
  int _pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState

    serviceViewModel.getServices(widget.api);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
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
                        "${widget.heading}",
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
                        "FIND YOUR SERVICES THAT FITS YOUR NEEDS",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .80,
                        child: Text(
                          "We feature premium artworks including modern, contemporary, and street art",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Color(0XFF000000), fontWeight: FontWeight.w500, letterSpacing: 1),
                        ),
                      ),
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
                                child: Image.asset(
                                  "image/services.png",
                                  height: 180,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: HtmlWidget(
                          // the first parameter (`html`) is required

                          // all other parameters are optional, a few notable params:

                          // specify custom styling for an element
                          '${serviceViewModel.serviceResponse!.pageContent!.banner!.desc}',

                          // render a custom widget

                          // these callbacks are called when a complicated element is loading
                          // or failed to render allowing the app to render progress indicator
                          // and fallback widget

                          // select the render mode for HTML body
                          // by default, a simple `Column` is rendered
                          // consider using `ListView` or `SliverList` for better performance

                          // set the default styling for text
                          textStyle: TextStyle(fontSize: 14),

                          // turn on `webView` if you need IFRAME support (it's disabled by default)
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

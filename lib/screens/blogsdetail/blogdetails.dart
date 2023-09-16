import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../components/footer/footer.dart';
import '../components/header.dart';
import '../newsandupdates/newsandupdates.dart';

class BlogDetails extends StatefulWidget {
  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  int _pageIndex = 0;

  @override
  void initState() {
    serviceViewModel.getblogsDetails(serviceViewModel.blogsArray!.id!);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),

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
                        "Blogs",
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
                          serviceViewModel.blogDetailsResponse == null
                              ? ''
                              : serviceViewModel.blogDetailsResponse!.pageContent == null
                                  ? ''
                                  : serviceViewModel.blogDetailsResponse!.pageContent!.blogDetail == null
                                      ? ''
                                      : serviceViewModel.blogDetailsResponse!.pageContent!.blogDetail!.title ?? "",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w500, fontSize: 16),
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
                                child: Image.network(
                                  serviceViewModel.blogDetailsResponse == null
                                      ? ''
                                      : serviceViewModel.blogDetailsResponse!.pageContent == null
                                          ? ''
                                          : serviceViewModel.blogDetailsResponse!.pageContent!.blogDetail == null
                                              ? ''
                                              : serviceViewModel
                                                      .blogDetailsResponse!.pageContent!.blogDetail!.image!.mobile ??
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
                                padding: const EdgeInsets.only(left: 16.0, right: 16),
                                child: Text(
                                  "By ${serviceViewModel.blogDetailsResponse == null ? '' : serviceViewModel.blogDetailsResponse!.pageContent == null ? '' : serviceViewModel.blogDetailsResponse!.pageContent!.blogDetail == null ? '' : serviceViewModel.blogDetailsResponse!.pageContent!.blogDetail!.credits ?? ""}",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0XFF000000), fontWeight: FontWeight.w500, letterSpacing: 1),
                                ),
                              ),
                            ],
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
                              serviceViewModel.blogDetailsResponse!.pageContent!.blogDetail!.timestamp ?? "",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: Color(0XFF000000), fontWeight: FontWeight.w500, letterSpacing: 1),
                            )
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: HtmlWidget(
                          serviceViewModel.blogDetailsResponse == null
                              ? ''
                              : serviceViewModel.blogDetailsResponse!.pageContent == null
                                  ? ''
                                  : serviceViewModel.blogDetailsResponse!.pageContent!.blogDetail == null
                                      ? ''
                                      : '${serviceViewModel.blogDetailsResponse!.pageContent!.blogDetail!.desc ?? ''}',
                          // textStyle: TextStyle(fontSize: 14),
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

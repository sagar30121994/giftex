import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:giftex/screens/components/footer/footer.dart';
import 'package:giftex/screens/components/header.dart';
import 'package:giftex/viewmodel/service/serviceviewmodel.dart';

ServiceViewModel serviceViewModel = ServiceViewModel();

class CareerPage extends StatefulWidget {
  @override
  _CareerPageState createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  int _pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    serviceViewModel.getCareeres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Observer(builder: (context) {
          return serviceViewModel.isloading
              ? LinearProgressIndicator()
              : Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .90,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "${serviceViewModel.careersResponse!.pageContent!.title}",
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
                        "${serviceViewModel.careersResponse!.pageContent!.bannerItem!.title}",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      Padding(
                        padding: EdgeInsets.all(16),
                        child: HtmlWidget(
                          "${serviceViewModel.careersResponse!.pageContent!.bannerItem!.desc}",
                          // textStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * .80,
                      //   child: Text(
                      //     "${serviceViewModel.careersResponse!.pageContent!.bannerItem!.desc}",
                      //     textAlign: TextAlign.center,
                      //     style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      //           color: Color(0XFF000000),
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //   ),
                      // ),
                      // const SizedBox(height: 16,),
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
                                  "${serviceViewModel.careersResponse!.pageContent!.bannerItem!.image!.mobile}",
                                  // "",
                                  height: 220,
                                )),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        color: Color(0xffFFFFFF),
                        child: DefaultTabController(
                          length: 3,
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
                              // indicator: BoxDecoration(
                              //     color: tabColor
                              // ),
                              isScrollable: true,
                              padding: EdgeInsets.all(0),
                              unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.6),
                              labelColor: const Color(0xFF000000),
                              labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                              tabs: [
                                Tab(text: "Show All"),
                                Tab(text: "Full time opportunities "),
                                Tab(text: "internship opportunities"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: serviceViewModel.careersResponse!.pageContent!.vacancies!.array!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _buildPlayerModelList(index);
                          },
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
                      Container(
                        color: Color(0xff1F2A52),
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  )),
                );
        }),
      ),
    );
  }

  Widget _buildPlayerModelList(int index) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 0,
      child: ExpansionTile(
        backgroundColor: Color(0xffF9F9F9),
        leading: Image.asset("image/Group.png", color: Color(0XffB45156)),
        title: Text(
          serviceViewModel.careersResponse!.pageContent!.vacancies!.array![index].title ?? "",
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Color(0XFF000000),
                fontWeight: FontWeight.w600,
              ),
        ),
        subtitle: Row(
          children: [
            Image.asset(
              "image/Vector (11).png",
              color: Color(0XffB45156),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Mumbai",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Color(0XFF000000),
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Job Description",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: HtmlWidget(
                    serviceViewModel.careersResponse!.pageContent!.vacancies!.array![index].desc ?? "",
                    // textStyle: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 410,
                  child: Stack(
                    children: [
                      Container(
                        height: 380,
                        width: 410,
                        color: Color(0xffF9F9F9).withOpacity(0.7),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lets Work Together",
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0XFF000000),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Fill the form below and get in touch",
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0XFF000000),
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Name',
                                    hintText: 'Enter Your Name',
                                    prefixIcon: Icon(Icons.person_outline_sharp),
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email Id',
                                    hintText: 'Enter Your Email',
                                    prefixIcon: Icon(Icons.email_outlined),
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Mobile No',
                                    hintText: 'Enter Your No',
                                    prefixIcon: Icon(Icons.add_ic_call),
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Upload Resume',
                                    hintText: '',
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 340.0),
                        child: Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color(0XffB45156)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  // side: BorderSide(color: Colors.red)
                                ))),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                              child: Text(
                                'Apply Now',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0XFFFFFFFF),
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemModel {
  bool expanded;
  String? headerItem;
  String? discription;
  Color? colorsItem;
  String? img;

  ItemModel({this.expanded: false, this.headerItem, this.discription, this.colorsItem, this.img});
}

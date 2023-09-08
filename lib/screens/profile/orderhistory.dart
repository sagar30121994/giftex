import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/components/footer/footer.dart';
import 'package:giftex/screens/components/header.dart';
import 'package:giftex/viewmodel/profile/profileviewmodel.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';

class MyOrderHistorypage extends StatefulWidget {
  MyOrderHistorypage(this.profileViewModel);

  ProfileViewModel profileViewModel;

  @override
  _MyOrderHistorypageState createState() => _MyOrderHistorypageState();
}

class _MyOrderHistorypageState extends State<MyOrderHistorypage> {
  int _pageIndex = 0;
  String type = "auction";
  TextEditingController nameController = TextEditingController();
  List<Menu> data = [];
  static const countdownDuration = Duration(minutes: 10);
  Duration duration = Duration();

  // Timer? timer;
  String auctionType = "";
  bool countDown = true, selected = false;

  Widget _buildList(Menu list) {
    if (list.subMenu!.isEmpty)
      return Builder(builder: (context) {
        return ListTile(
            // onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategory(list.name))),
            leading: Checkbox(
              value: selected,
              onChanged: (bool? value) {},
            ),
            title: Text(
              list.name!,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
            ));
      });
    return ExpansionTile(
      title: Text(
        list.name!,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
      ),
      children: list.subMenu!.map(_buildList).toList(),
    );
  }

  @override
  void initState() {
    // dataList.forEach((element) {
    //   data.add(Menu.fromJson(element));
    // });
    // nameController.text = "Aryan Raj";
    bottomViewModel.profileViewModel!.getUserAllDetails();
    widget.profileViewModel.getMyPurchase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 16, right: 16),
          child: Observer(builder: (context) {
            return SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset(
                            "image/Ellipse 94.png",
                            height: 95,
                            color: Color(0xffF3E8E9),
                          ),
                          CircleAvatar(
                            radius: 37,
                            backgroundImage: NetworkImage(
                                '${(widget.profileViewModel.getUserAllDetailsResponse!.result!.profile!.basicDetails!.profilePicUrl ?? '')}'),
                            // child: Image.asset("image/image 40.png",fit: BoxFit.fill,),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    // textAlign: TextAlign.center,
                                    text: TextSpan(
                                      // Note: Styles for TextSpans must be explicitly defined.
                                      // Child text spans will inherit styles from parent
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Hello ',
                                          style: Theme.of(context).textTheme.headline6!.copyWith(
                                                color: Color(0xffE74B52),
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${(widget.profileViewModel.getUserAllDetailsResponse!.result!.profile!.basicDetails!.firstName ?? '')}',
                                          style: Theme.of(context).textTheme.headline6!.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "image/Vector (11).png",
                                        height: 16,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      widget.profileViewModel.getUserAllDetailsResponse!.result!.profile!.address!
                                              .isEmpty
                                          ? Container()
                                          : Text(
                                              '${(widget.profileViewModel.getUserAllDetailsResponse!.result!.profile!.address!.first!.city ?? '')}',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                    color: Color(0xff2D2D2D),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Color(0XFFFFFFFF)),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                    side: BorderSide(color: Color(0xff747474), width: 0.38)))),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context, MaterialPageRoute(builder: (context) => DashboardUi(12)));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                                          child: Row(
                                            children: [
                                              Text(
                                                'EDIT',
                                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                    color: Theme.of(context).colorScheme.primary,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 2),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                Icons.edit_outlined,
                                                color: Color(0XFF2D2D2D),
                                                size: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width * .6,
                          //   child: Text(
                          //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
                          //     textAlign: TextAlign.left,
                          //     style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          //           color: Color(0xff959595),
                          //           fontWeight: FontWeight.w400,
                          //         ),
                          //   ),
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "My Order History",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(
                  height: 10,
                ),
                widget.profileViewModel.isloading
                    ? Container()
                    : Text(
                        "${widget.profileViewModel.myPurchaseReponse!.data!.length} Products found",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: DefaultTabController(
                    length: 2,
                    child: SingleChildScrollView(
                      child: TabBar(
                        onTap: (index) {
                          setState(() {
                            if (index == 0) {
                              type = "auction";
                            }
                            if (index == 1) {
                              type = "store";
                            }
                          });
                          print(index);
                        },
                        // indicator: BoxDecoration(
                        //     color: tabColor
                        // ),
                        // isScrollable: true,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                        ),
                        padding: EdgeInsets.all(0),
                        unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.6),
                        labelColor: const Color(0xFF000000),
                        labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                        tabs: [
                          Tab(text: "AUCTION"),
                          Tab(text: "STORE"),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                type == "auction"
                    ? Container(
                        padding: EdgeInsets.only(top: 0, left: 24, right: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Order Placed",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0xff2D2D2D),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            widget.profileViewModel.isloading
                                ? LinearProgressIndicator()
                                : (widget.profileViewModel.myPurchaseReponse!.data ?? []).length == 0
                                    ? Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(24),
                                          child: Container(
                                            child: Text("No Orders Found",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall!
                                                    .copyWith(color: Colors.black)),
                                          ),
                                        ),
                                      )
                                    : Column(
                                        children: widget.profileViewModel.myPurchaseReponse!.data!.map((e) {
                                          return Padding(
                                            padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 10),
                                            child: Container(
                                                height: 180,
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context).size.width,
                                                padding: const EdgeInsets.only(left: 0.0, right: 5.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${e.deliveryDate ?? ""}",
                                                      textAlign: TextAlign.center,
                                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                            color: Color(0xff747474),
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        e.lot!.thumbImage == null
                                                            ? Container(
                                                                height: 140,
                                                                width: 90,
                                                              )
                                                            : InkWell(
                                                                onTap: () async {
                                                                  // Navigator.push(
                                                                  //     context,
                                                                  //     MaterialPageRoute(
                                                                  //         builder: (context) => ProductDetailPage()));
                                                                },
                                                                child: Image.network(
                                                                  "${e.lot!.thumbImage}",
                                                                  height: 140,
                                                                  width: 90,
                                                                  fit: BoxFit.contain,
                                                                ),
                                                              ),
                                                        SizedBox(
                                                          width: 14,
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(context).size.width * .55,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Column(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      SizedBox(
                                                                        height: 16,
                                                                      ),
                                                                      Text(
                                                                        "ORDER ID",
                                                                        textAlign: TextAlign.center,
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyText1!
                                                                            .copyWith(
                                                                              color: Color(0xff2D2D2D),
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        "#${e.orderNumber}",
                                                                        textAlign: TextAlign.center,
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .caption!
                                                                            .copyWith(
                                                                              color: Color(0xff747474),
                                                                              fontWeight: FontWeight.w400,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Spacer(),
                                                                  Column(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      SizedBox(
                                                                        height: 16,
                                                                      ),
                                                                      Text(
                                                                        "Status",
                                                                        textAlign: TextAlign.center,
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyText1!
                                                                            .copyWith(
                                                                              color: Color(0xff747474),
                                                                              fontWeight: FontWeight.w400,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        "${getOrderStatus("${e.completedStage}")}",
                                                                        textAlign: TextAlign.center,
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .subtitle1!
                                                                            .copyWith(
                                                                              color:
                                                                                  Theme.of(context).colorScheme.primary,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Spacer(),
                                                                  InkWell(
                                                                      onTap: () {
                                                                        // Navigator.push(
                                                                        //     context,
                                                                        //     MaterialPageRoute(
                                                                        //         builder: (context) =>
                                                                        //             MyOrderProductpage()));
                                                                      },
                                                                      child: Icon(
                                                                        Icons.arrow_forward_ios_rounded,
                                                                        size: 16,
                                                                        color: Color(0xff747474),
                                                                      )),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Column(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      SizedBox(
                                                                        height: 16,
                                                                      ),
                                                                      Text(
                                                                        "Price",
                                                                        textAlign: TextAlign.center,
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyText1!
                                                                            .copyWith(
                                                                              color: Color(0xff747474),
                                                                              fontWeight: FontWeight.w400,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        "₹${e.buyerInvoiceTotalAmount}",
                                                                        textAlign: TextAlign.center,
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodySmall!
                                                                            .copyWith(
                                                                              color: Color(0xff202232),
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Spacer(),
                                                                  Column(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      SizedBox(
                                                                        height: 16,
                                                                      ),
                                                                      Text(
                                                                        "In Transit",
                                                                        textAlign: TextAlign.center,
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyText1!
                                                                            .copyWith(
                                                                              color: Color(0xff747474),
                                                                              fontWeight: FontWeight.w400,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        "20th Jan, 2022",
                                                                        textAlign: TextAlign.center,
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .subtitle1!
                                                                            .copyWith(
                                                                              color: Color(0xff202232),
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                          );
                                        }).toList(),
                                      ),

                            // SizedBox(
                            //   height: 400,
                            //   width: MediaQuery.of(context).size.width,
                            //   child: ListView.builder(
                            //       // itemExtent: 150,
                            //       scrollDirection: Axis.vertical,
                            //       itemBuilder: (context, index) =>
                            //
                            //
                            //       itemCount: 2),
                            // ),
                            SizedBox(
                              height: 16,
                            ),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     InkWell(
                            //       onTap: () {
                            //         showDialog(
                            //             context: context,
                            //             builder: (BuildContext dialogContext) {
                            //               return AlertDialog(
                            //                 contentPadding: EdgeInsets.all(0),
                            //                 content: Container(
                            //                     padding: EdgeInsets.all(16),
                            //                     height: 550,
                            //                     color: Color(0xffF5F5F5),
                            //                     child: Column(
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment.start,
                            //                       children: [
                            //                         Row(
                            //                           children: [
                            //                             Icon(
                            //                               Icons.sort,
                            //                               size: 30,
                            //                               color: Colors.black,
                            //                             ),
                            //                             SizedBox(
                            //                               width: 8,
                            //                             ),
                            //                             Text(
                            //                               "Filters",
                            //                               textAlign:
                            //                                   TextAlign.center,
                            //                               style: Theme.of(context)
                            //                                   .textTheme
                            //                                   .subtitle1!
                            //                                   .copyWith(
                            //                                     color: Color(
                            //                                         0xff000000),
                            //                                     fontWeight:
                            //                                         FontWeight
                            //                                             .w400,
                            //                                   ),
                            //                             ),
                            //                             Spacer(),
                            //                             Text(
                            //                               "Reset",
                            //                               textAlign:
                            //                                   TextAlign.center,
                            //                               style: Theme.of(context)
                            //                                   .textTheme
                            //                                   .subtitle1!
                            //                                   .copyWith(
                            //                                     color: Color(
                            //                                         0xff7B9B6C),
                            //                                     fontWeight:
                            //                                         FontWeight
                            //                                             .w400,
                            //                                   ),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                         SizedBox(
                            //                           height: 16,
                            //                         ),
                            //                         SingleChildScrollView(
                            //                           child: SizedBox(
                            //                             height: 400,
                            //                             child: ListView.builder(
                            //                               shrinkWrap: true,
                            //                               // physics: ScrollPhysics(),
                            //                               itemCount: data.length,
                            //                               itemBuilder:
                            //                                   (BuildContext
                            //                                               context,
                            //                                           int
                            //                                               index) =>
                            //                                       _buildList(data[
                            //                                           index]),
                            //                             ),
                            //                           ),
                            //                         ),
                            //                         SizedBox(
                            //                           height: 20,
                            //                         ),
                            //                         Row(
                            //                           mainAxisAlignment:
                            //                               MainAxisAlignment.end,
                            //                           children: [
                            //                             ElevatedButton(
                            //                               style: ButtonStyle(
                            //                                   backgroundColor:
                            //                                       MaterialStateProperty.all(
                            //                                           Color(
                            //                                               0XFFF9F9F9)),
                            //                                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            //                                       borderRadius:
                            //                                           BorderRadius
                            //                                               .circular(
                            //                                                   20.0),
                            //                                       side: BorderSide(
                            //                                           color: Color(
                            //                                               0xff747474),
                            //                                           width:
                            //                                               0.38)))),
                            //                               onPressed: () {},
                            //                               child: Padding(
                            //                                 padding:
                            //                                     const EdgeInsets
                            //                                             .only(
                            //                                         right: 8.0,
                            //                                         left: 8,
                            //                                         top: 12,
                            //                                         bottom: 12),
                            //                                 child: Text(
                            //                                   'Close',
                            //                                   style: Theme.of(
                            //                                           context)
                            //                                       .textTheme
                            //                                       .bodyText1!
                            //                                       .copyWith(
                            //                                         color: Color(
                            //                                             0XFF2D2D2D),
                            //                                         fontWeight:
                            //                                             FontWeight
                            //                                                 .w600,
                            //                                       ),
                            //                                 ),
                            //                               ),
                            //                             ),
                            //                             SizedBox(
                            //                               width: 10,
                            //                             ),
                            //                             ElevatedButton(
                            //                               style: ButtonStyle(
                            //                                   backgroundColor:
                            //                                       MaterialStateProperty
                            //                                           .all(Color(
                            //                                               0XFF8DAB7F)),
                            //                                   shape: MaterialStateProperty.all<
                            //                                           RoundedRectangleBorder>(
                            //                                       RoundedRectangleBorder(
                            //                                     borderRadius:
                            //                                         BorderRadius
                            //                                             .circular(
                            //                                                 20.0),
                            //                                     // side: BorderSide(color: Colors.red)
                            //                                   ))),
                            //                               onPressed: () {},
                            //                               child: Padding(
                            //                                 padding:
                            //                                     const EdgeInsets
                            //                                             .only(
                            //                                         right: 8.0,
                            //                                         left: 8,
                            //                                         top: 12,
                            //                                         bottom: 12),
                            //                                 child: Text(
                            //                                   'Apply',
                            //                                   style: Theme.of(
                            //                                           context)
                            //                                       .textTheme
                            //                                       .bodyText1!
                            //                                       .copyWith(
                            //                                         color: Color(
                            //                                             0XFFFFFFFF),
                            //                                         fontWeight:
                            //                                             FontWeight
                            //                                                 .w600,
                            //                                       ),
                            //                                 ),
                            //                               ),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                       ],
                            //                     )),
                            //               );
                            //             });
                            //       },
                            //       child: Container(
                            //         color: Color(0xffF4F4F4),
                            //         padding: EdgeInsets.only(
                            //             left: 20, top: 12, right: 20, bottom: 12),
                            //         child: Row(
                            //           children: [
                            //             Icon(
                            //               Icons.sort,
                            //               size: 30,
                            //               color: Colors.black,
                            //             ),
                            //             SizedBox(
                            //               width: 8,
                            //             ),
                            //             Text(
                            //               "FILTTERS",
                            //               textAlign: TextAlign.center,
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .subtitle1!
                            //                   .copyWith(
                            //                     color: Color(0xff000000),
                            //                     fontWeight: FontWeight.w400,
                            //                   ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: 30,
                            //     ),
                            //     InkWell(
                            //       onTap: () {
                            //         showModalBottomSheet(
                            //             context: context,
                            //             builder: (context) {
                            //               return Container(
                            //                 decoration: BoxDecoration(
                            //                     borderRadius: BorderRadius.only(
                            //                         topRight: Radius.circular(20),
                            //                         topLeft:
                            //                             Radius.circular(20))),
                            //                 padding: const EdgeInsets.all(16.0),
                            //                 child: Column(
                            //                   mainAxisSize: MainAxisSize.min,
                            //                   children: <Widget>[
                            //                     Row(
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment.start,
                            //                       children: [
                            //                         Text(
                            //                           "Sort By",
                            //                           textAlign: TextAlign.center,
                            //                           style: Theme.of(context)
                            //                               .textTheme
                            //                               .subtitle1!
                            //                               .copyWith(
                            //                                 color:
                            //                                     Color(0xff000000),
                            //                                 fontWeight:
                            //                                     FontWeight.w600,
                            //                               ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                     SizedBox(
                            //                       height: 16,
                            //                     ),
                            //                     ListTile(
                            //                       leading: Checkbox(
                            //                         value: selected,
                            //                         onChanged: (bool? value) {},
                            //                       ),
                            //                       title: Text(
                            //                         "Contemporary Art",
                            //                         style: Theme.of(context)
                            //                             .textTheme
                            //                             .bodyText1!
                            //                             .copyWith(
                            //                               color: Colors.black,
                            //                               fontWeight:
                            //                                   FontWeight.w400,
                            //                             ),
                            //                       ),
                            //                       onTap: () {
                            //                         Navigator.pop(context);
                            //                       },
                            //                     ),
                            //                     ListTile(
                            //                       leading: Checkbox(
                            //                         value: selected,
                            //                         onChanged: (bool? value) {},
                            //                       ),
                            //                       title: Text(
                            //                         "M. F. Hussian",
                            //                         style: Theme.of(context)
                            //                             .textTheme
                            //                             .bodyText1!
                            //                             .copyWith(
                            //                               color: Colors.black,
                            //                               fontWeight:
                            //                                   FontWeight.w400,
                            //                             ),
                            //                       ),
                            //                       onTap: () {
                            //                         Navigator.pop(context);
                            //                       },
                            //                     ),
                            //                     ListTile(
                            //                       leading: Checkbox(
                            //                         value: selected,
                            //                         onChanged: (bool? value) {},
                            //                       ),
                            //                       title: Text(
                            //                         "Antique",
                            //                         style: Theme.of(context)
                            //                             .textTheme
                            //                             .bodyText1!
                            //                             .copyWith(
                            //                               color: Colors.black,
                            //                               fontWeight:
                            //                                   FontWeight.w400,
                            //                             ),
                            //                       ),
                            //                       onTap: () {
                            //                         Navigator.pop(context);
                            //                       },
                            //                     ),
                            //                     ListTile(
                            //                       leading: Checkbox(
                            //                         value: selected,
                            //                         onChanged: (bool? value) {},
                            //                       ),
                            //                       title: Text(
                            //                         "Impressionist & Modern Art",
                            //                         style: Theme.of(context)
                            //                             .textTheme
                            //                             .bodyText1!
                            //                             .copyWith(
                            //                               color: Colors.black,
                            //                               fontWeight:
                            //                                   FontWeight.w400,
                            //                             ),
                            //                       ),
                            //                       onTap: () {
                            //                         Navigator.pop(context);
                            //                       },
                            //                     ),
                            //                     SizedBox(
                            //                       height: 20,
                            //                     ),
                            //                     Row(
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment.center,
                            //                       crossAxisAlignment:
                            //                           CrossAxisAlignment.center,
                            //                       children: [
                            //                         ElevatedButton(
                            //                           style: ButtonStyle(
                            //                               backgroundColor:
                            //                                   MaterialStateProperty.all(
                            //                                       Color(
                            //                                           0XFFF9F9F9)),
                            //                               shape: MaterialStateProperty.all<
                            //                                       RoundedRectangleBorder>(
                            //                                   RoundedRectangleBorder(
                            //                                       borderRadius:
                            //                                           BorderRadius.circular(
                            //                                               20.0),
                            //                                       side: BorderSide(
                            //                                           color: Color(
                            //                                               0xff747474),
                            //                                           width:
                            //                                               0.38)))),
                            //                           onPressed: () {},
                            //                           child: Padding(
                            //                             padding:
                            //                                 const EdgeInsets.only(
                            //                                     right: 8.0,
                            //                                     left: 8,
                            //                                     top: 12,
                            //                                     bottom: 12),
                            //                             child: Text(
                            //                               'Close',
                            //                               style: Theme.of(context)
                            //                                   .textTheme
                            //                                   .bodyText1!
                            //                                   .copyWith(
                            //                                     color: Color(
                            //                                         0XFF2D2D2D),
                            //                                     fontWeight:
                            //                                         FontWeight
                            //                                             .w600,
                            //                                   ),
                            //                             ),
                            //                           ),
                            //                         ),
                            //                         SizedBox(
                            //                           width: 10,
                            //                         ),
                            //                         ElevatedButton(
                            //                           style: ButtonStyle(
                            //                               backgroundColor:
                            //                                   MaterialStateProperty
                            //                                       .all(Color(
                            //                                           0XFF8DAB7F)),
                            //                               shape: MaterialStateProperty.all<
                            //                                       RoundedRectangleBorder>(
                            //                                   RoundedRectangleBorder(
                            //                                 borderRadius:
                            //                                     BorderRadius
                            //                                         .circular(
                            //                                             20.0),
                            //                                 // side: BorderSide(color: Colors.red)
                            //                               ))),
                            //                           onPressed: () {},
                            //                           child: Padding(
                            //                             padding:
                            //                                 const EdgeInsets.only(
                            //                                     right: 8.0,
                            //                                     left: 8,
                            //                                     top: 12,
                            //                                     bottom: 12),
                            //                             child: Text(
                            //                               'Apply',
                            //                               style: Theme.of(context)
                            //                                   .textTheme
                            //                                   .bodyText1!
                            //                                   .copyWith(
                            //                                     color: Color(
                            //                                         0XFFFFFFFF),
                            //                                     fontWeight:
                            //                                         FontWeight
                            //                                             .w600,
                            //                                   ),
                            //                             ),
                            //                           ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ],
                            //                 ),
                            //               );
                            //             });
                            //       },
                            //       child: Container(
                            //         color: Color(0xffF4F4F4),
                            //         padding: EdgeInsets.only(
                            //             left: 20, top: 12, right: 20, bottom: 12),
                            //         child: Row(
                            //           children: [
                            //             Icon(
                            //               Icons.sort,
                            //               size: 30,
                            //               color: Colors.black,
                            //             ),
                            //             SizedBox(
                            //               width: 8,
                            //             ),
                            //             Text(
                            //               "SORT BY",
                            //               textAlign: TextAlign.center,
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .subtitle1!
                            //                   .copyWith(
                            //                     color: Color(0xff000000),
                            //                     fontWeight: FontWeight.w400,
                            //                   ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     )
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 16,
                            // ),
                          ],
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 16,
                ),
                SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                )
              ],
            ));
          }),
        ),
      ),
    );
  }
}

class Menu {
  String? name;
  IconData? icon;
  List<Menu>? subMenu = [];

  Menu({this.name, this.subMenu, this.icon});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    if (json['subMenu'] != null) {
      subMenu!.clear();
      json['subMenu'].forEach((v) {
        subMenu?.add(new Menu.fromJson(v));
      });
    }
  }
}

List dataList = [
  {
    "name": "Category",
    "icon": Icons.payment,
    "subMenu": [
      {"name": "Contemporary Art"},
      {"name": "Paintings"},
      {"name": "Antique Furniture"},
      {"name": "Antique"}
    ]
  },
  {
    "name": "Artist Name",
    "icon": Icons.volume_up,
    "subMenu": [
      {"name": "Jamini Roy"},
      {"name": "M. F. Hussain"},
      {"name": "Horace Van Ruth"},
      {"name": "Sailoz Mookherhea"}
    ]
  },
  {
    "name": "Price",
    "subMenu": [
      {"name": "0-500"},
      {"name": "500-1000"},
      {"name": "1000-2000"},
      {"name": "above 2000"}
    ]
  },
];

String getOrderStatus(String status) {
  if (status == "1") {
    return "Order Placed";
  }

  if (status == "2") {
    return "Processing";
  }

  if (status == "3") {
    return "Preparing For Shopping";
  }

  if (status == "4") {
    return "Shipped";
  }

  if (status == "5") {
    return "Shipped";
  }

  if (status == "6") {
    return "Delivered";
  }

  if (status == "7") {
    return "Delivered";
  }

  return "Order Placed";
}

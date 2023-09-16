import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/liveauction/browsitemlistitem.dart';
import 'package:giftex/screens/profile/orderproductdetails.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:giftex/viewmodel/profile/profileviewmodel.dart';
import 'package:intl/intl.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../components/header.dart';

class MyAuctionDashboard extends StatefulWidget {
  MyAuctionDashboard(this.profileViewModel);

  ProfileViewModel profileViewModel;

  @override
  _MyAuctionDashboardState createState() => _MyAuctionDashboardState();
}

class _MyAuctionDashboardState extends State<MyAuctionDashboard> {
  int _pageIndex = 0;
  String type = "LAST 5 BIDS";
  TextEditingController nameController = TextEditingController();
  List<Menu> data = [];
  static const countdownDuration = Duration(minutes: 10);
  Duration duration = Duration();

  AuctionViewModel auctionViewModel = AuctionViewModel();

  // Timer? timer;
  String auctionType = "";
  bool countDown = true, selected = false;

  @override
  void initState() {
    // TODO: implement initState
    // dataList.forEach((element) {
    //   data.add(Menu.fromJson(element));
    // });
    // nameController.text = "Aryan Raj";

    widget.profileViewModel.getDashboardOverview();
    widget.profileViewModel.getLast5Bids();
    widget.profileViewModel.getLast5Purchases();
    super.initState();
  }

  String formateNumber(String number) {
    var f = NumberFormat('##,##,##,##,###.##', 'HI');

    return f.format(double.parse(number));
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
            height: MediaQuery.of(context).size.height * .9,
            // padding: EdgeInsets.only(top: 16,left: 16,right: 16),
            child: SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Auction Dashboard",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0xff2D2D2D),
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                widget.profileViewModel.isloading ? LinearProgressIndicator() : Container(),
                widget.profileViewModel.isloading
                    ? Container()
                    : widget.profileViewModel.dashboradOverviewResponse != null
                        ? Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              // height: 200,
                              decoration:
                                  BoxDecoration(color: Color(0xffEAEEF2), borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                children: [
                                  SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text.rich(TextSpan(
                                            text: 'Available Amount \n',
                                            style: Theme.of(context).textTheme.bodyLarge,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                text:
                                                    " ₹${formateNumber('${widget.profileViewModel.dashboradOverviewResponse!.availableAmount}')}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(fontWeight: FontWeight.bold),
                                              )
                                            ])),
                                        Text.rich(TextSpan(
                                            text: 'Deposit Amount \n',
                                            style: Theme.of(context).textTheme.bodyLarge,
                                            children: <InlineSpan>[
                                              TextSpan(
                                                text:
                                                    " ₹${formateNumber('${widget.profileViewModel.dashboradOverviewResponse!.actualAmount}')}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(fontWeight: FontWeight.bold),
                                              )
                                            ])),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Slider(
                                    value: 1,
                                    onChanged: (val) {},
                                    activeColor: Color(0XffE74B52),
                                    inactiveColor: Colors.white,
                                  ),
                                  SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text.rich(TextSpan(
                                            text: 'Bid Limit \n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(color: Color(0xffE74B52)),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                text:
                                                    " ₹${formateNumber('${widget.profileViewModel.dashboradOverviewResponse!.totalSpent}')}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(fontWeight: FontWeight.bold),
                                              )
                                            ])),
                                        // Text.rich(TextSpan(
                                        //     text: 'Deposit Amount \n',
                                        //     style: Theme.of(context).textTheme.bodyLarge,
                                        //     children: <InlineSpan>[
                                        //       TextSpan(
                                        //         text:
                                        //             " ₹${formateNumber('${widget.profileViewModel.dashboradOverviewResponse!.actualAmount}')}",
                                        //         style: Theme.of(context)
                                        //             .textTheme
                                        //             .bodyLarge!
                                        //             .copyWith(fontWeight: FontWeight.bold),
                                        //       )
                                        //     ])),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                const SizedBox(
                  height: 16,
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        //This is for background color
                        color: Colors.white.withOpacity(0.0),

                        //This is for bottom border that is needed
                        border: Border(bottom: BorderSide(color: Color(0xffDFDFDF), width: 2)),
                      ),
                      child: TabBar(
                        onTap: (index) {
                          if (index == 0) {
                            // tabColor = Color(0xffE74B52);
                            // setState(() {
                            //   widget.auctionViewModel.liveAuctionType = "browselist";
                            //   // widget.auctionViewModel.getLotById(
                            //   //     widget.auctionViewModel!.selectedAuction!
                            //   //         .auctionId!,
                            //   //     widget.auctionViewModel.liveAuctionType);
                            // });

                            setState(() {
                              type = "LAST 5 BIDS";
                            });
                          }
                          if (index == 1) {
                            setState(() {
                              type = "LAST 5 PURCHASES";
                            });

                            // tabColor = Color(0xffE74B52);
                            // setState(() {
                            //   widget.auctionViewModel.liveAuctionType = "mygallery";
                            //   widget.auctionViewModel.myAuctionGallery();
                            // });
                          }

                          print(index);
                        },
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(color: Color(0xffE74B52), width: 2.0),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        padding: EdgeInsets.all(0),
                        labelPadding: EdgeInsets.only(right: 10, left: 5),
                        unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.59),
                        labelColor: const Color(0xFF2D2D2D),
                        labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0xff2D2D2D),
                              fontWeight: FontWeight.w600,
                            ),
                        tabs: [
                          Tab(text: "LAST 5 BIDS"),
                          Tab(text: "LAST 5 PURCHASES"),
                        ],
                      ),
                    ),
                  ),
                ),

                type == "LAST 5 BIDS"
                    ? Container(
                        child: widget.profileViewModel.getLastBidsResponce == null
                            ? Container()
                            : Column(
                                children: widget.profileViewModel.getLastBidsResponce!.result!.lots!
                                    .map(
                                      (e) => BrowseItemListItem(e, false, auctionViewModel),
                                    )
                                    .toList(),
                              ),
                      )
                    : Container(),

                type == "LAST 5 PURCHASES"
                    ? Container(
                        child: widget.profileViewModel.mylast5PurchaseReponse == null
                            ? Container()
                            : Column(
                                children: widget.profileViewModel.mylast5PurchaseReponse!.data!
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 10),
                                        child: Container(
                                            height: 180,
                                            alignment: Alignment.center,
                                            width: MediaQuery.of(context).size.width,
                                            padding: const EdgeInsets.only(left: 0.0, right: 0.0),
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
                                                            width: 60,
                                                          )
                                                        : InkWell(
                                                            onTap: () async {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) => MyOrderProductpage(
                                                                          widget.profileViewModel, e)));
                                                            },
                                                            child: Image.network(
                                                              "${e.lot!.thumbImage}",
                                                              height: 140,
                                                              width: 90,
                                                              fit: BoxFit.contain,
                                                            ),
                                                          ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width * .60,
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
                                                                    style:
                                                                        Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                              color: Color(0xff2D2D2D),
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                  ),
                                                                  Text(
                                                                    "#${e.orderNumber}",
                                                                    textAlign: TextAlign.center,
                                                                    style:
                                                                        Theme.of(context).textTheme.caption!.copyWith(
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
                                                                    style:
                                                                        Theme.of(context).textTheme.bodyText1!.copyWith(
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
                                                                          color: Theme.of(context).colorScheme.primary,
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
                                                                    style:
                                                                        Theme.of(context).textTheme.bodyText1!.copyWith(
                                                                              color: Color(0xff747474),
                                                                              fontWeight: FontWeight.w400,
                                                                            ),
                                                                  ),
                                                                  Text(
                                                                    "₹${e.buyerInvoiceTotalAmount}",
                                                                    textAlign: TextAlign.center,
                                                                    style:
                                                                        Theme.of(context).textTheme.bodySmall!.copyWith(
                                                                              color: Color(0xff202232),
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Spacer(),
                                                              // Column(
                                                              //   mainAxisAlignment: MainAxisAlignment.start,
                                                              //   crossAxisAlignment: CrossAxisAlignment.start,
                                                              //   children: [
                                                              //     SizedBox(
                                                              //       height: 16,
                                                              //     ),
                                                              //     // Text(
                                                              //     //   "In Transit",
                                                              //     //   textAlign: TextAlign.center,
                                                              //     //   style:
                                                              //     //       Theme.of(context).textTheme.bodyText1!.copyWith(
                                                              //     //             color: Color(0xff747474),
                                                              //     //             fontWeight: FontWeight.w400,
                                                              //     //           ),
                                                              //     // ),
                                                              //     // Text(
                                                              //     //   "20th Jan, 2022",
                                                              //     //   textAlign: TextAlign.center,
                                                              //     //   style:
                                                              //     //       Theme.of(context).textTheme.subtitle1!.copyWith(
                                                              //     //             color: Color(0xff202232),
                                                              //     //             fontWeight: FontWeight.w500,
                                                              //     //           ),
                                                              //     // ),
                                                              //   ],
                                                              // ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ),
                                    )
                                    .toList(),
                              ),
                      )
                    : Container(),

                const SizedBox(
                  height: 16,
                ),

                Footer(),
                // SizedBox(
                //   height: 60,
                //   width: MediaQuery.of(context).size.width,
                // )
              ],
            )),
          );
        }),
      ),
    );
  }

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

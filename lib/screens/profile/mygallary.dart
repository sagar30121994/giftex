import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/liveauction/browsitemlistitem.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:giftex/viewmodel/profile/profileviewmodel.dart';
import 'package:intl/intl.dart';

import '../components/footer/footer.dart';
import '../components/header.dart';

class MyGallarypage extends StatefulWidget {
  MyGallarypage(this.profileViewModel);
  ProfileViewModel profileViewModel;
  @override
  _MyGallarypageState createState() => _MyGallarypageState();
}

class _MyGallarypageState extends State<MyGallarypage> {
  int _pageIndex = 0;
  String type = "auction";

  AuctionViewModel auctionViewModel = AuctionViewModel();

  @override
  void initState() {
    // TODO: implement initState
    // dataList.forEach((element) {
    //   data.add(Menu.fromJson(element));
    // });

    widget.profileViewModel.getAuctionGallery();

    // nameController.text="Aryan Raj";
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
      body: Container(
        width: MediaQuery.of(context).size.width,

        // padding: EdgeInsets.only(top: 16,left: 16,right: 16),
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
                                    widget.profileViewModel.getUserAllDetailsResponse!.result!.profile!.address!.isEmpty
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
                                      onPressed: () {},
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
                  "My Gallery",
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
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Your curated list of wishlist",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w400,
                      ),
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
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                      ),
                      isScrollable: true,
                      padding: EdgeInsets.all(0),
                      unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.6),
                      labelColor: const Color(0xFF000000),
                      labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                      tabs: [
                        Tab(text: "AUCTION GALLERY"),
                        Tab(text: "STORE GALLERY"),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   crossAxisAlignment: CrossAxisAlignment.end,
                          //   children: [
                          //     Icon(
                          //       Icons.menu_sharp,
                          //       size: 30,
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     Icon(
                          //       Icons.dashboard_outlined,
                          //       size: 30,
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //   ],
                          // ),

                          widget.profileViewModel.isloading
                              ? LinearProgressIndicator()
                              : Column(
                                  children: widget.profileViewModel.myAuctionGalleryResponce!.result!.lots!
                                      .map(
                                        (e) => BrowseItemListItem(e, false, auctionViewModel),
                                      )
                                      .toList(),
                                ),

                          // SizedBox(
                          //   height: 500,
                          //   width: MediaQuery.of(context).size.width,
                          //   child: ListView.builder(
                          //       // itemExtent: 150,
                          //       scrollDirection: Axis.vertical,
                          //       itemBuilder: (context, index) =>
                          //
                          //
                          //       itemCount: 2),
                          // ),
                        ],
                      ),
                    )
                  : Container(),
              type == "store"
                  ? Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.menu_sharp,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.dashboard_outlined,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 500,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                // itemExtent: 150,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 16),
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          height: 210,
                                          decoration: BoxDecoration(
                                              // image: DecorationImage(
                                              //   // image: AssetImage("image/Rectangle (7).png"),
                                              //   fit: BoxFit.cover,
                                              // ),
                                              color: Color(0xffF9F9F9)),
                                          // alignment: Alignment.center,
                                          width: MediaQuery.of(context).size.width,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                    "image/Bitmap1.png",
                                                    height: 80,
                                                    width: 90,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Jamini Roy",
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Mother & Child",
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                              color: Color(0xff747474),
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Image.asset(
                                                    "image/Vector (15).png",
                                                    height: 30,
                                                    color: Theme.of(context).colorScheme.secondary,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Category Name",
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                              color: Color(0xff747580),
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "20cm X 25cm",
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                              color: Color(0xff202232),
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "MRP.",
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                              color: Color(0xff747580),
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "₹50,000",
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                              color: Theme.of(context).colorScheme.secondary,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(16.0),
                                                                side: BorderSide(
                                                                    color: Color(0xff747474), width: 0.38)))),
                                                    onPressed: () {},
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(
                                                          right: 0.0, left: 0, top: 12, bottom: 12),
                                                      child: Text(
                                                        'ADD TO CART',
                                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                                              color: Color(0XFF2D2D2D),
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                    ),
                                itemCount: 4),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              const SizedBox(
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
      // bottomNavigationBar: Dashboard2Ui(),
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

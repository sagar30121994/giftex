import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/liveauction/browsitemlistitem.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:giftex/viewmodel/profile/profileviewmodel.dart';

import '../components/footer/footer.dart';
import '../components/header.dart';

class MyAuctionReviewpage extends StatefulWidget {
  MyAuctionReviewpage(this.profileViewModel);

  ProfileViewModel profileViewModel;

  @override
  _MyAuctionReviewpageState createState() => _MyAuctionReviewpageState();
}

class _MyAuctionReviewpageState extends State<MyAuctionReviewpage> {
  int _pageIndex = 0;
  String type = "auction";
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
    auctionViewModel.getReviewauctions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) {
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
                                                '${widget.profileViewModel.getUserAllDetailsResponse!.result!.profile!.basicDetails!.firstName ?? ''}',
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
                                        Text(
                                          '${widget.profileViewModel.getUserAllDetailsResponse!.result!.profile!.address!.first.city ?? ''},${widget.profileViewModel.getUserAllDetailsResponse!.result!.profile!.address!.first.country ?? ''}',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: Color(0xff2D2D2D),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Color(0XFFFFFFFF)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
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
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .6,
                              child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff959595),
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
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
                      "My Auction Review",
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
                  auctionViewModel.isLoadingForlots
                      ? LinearProgressIndicator()
                      : Column(
                          children: auctionViewModel.getliveauctionsResponse!.result!.lots!
                              .map(
                                (e) => BrowseItemListItem(e, false, auctionViewModel),
                              )
                              .toList(),
                        ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(height: 1100, width: MediaQuery.of(context).size.width, child: Footer()),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                  )
                ],
              )),
            );
          }
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

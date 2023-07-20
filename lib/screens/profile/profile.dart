import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/components/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:giftex/screens/liveauction/liveauction.dart';
import 'package:giftex/screens/signup/login.dart';

import '../components/header.dart';

// ProfileViewModel profileViewModel = ProfileViewModel();

class Profilepage extends StatefulWidget {
  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  int _pageIndex = 0;

  @override
  void initState() {
    bottomViewModel.profileViewModel!.getUserAllDetails();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      backgroundColor: Colors.white,
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: Observer(builder: (context) {
        return bottomViewModel.profileViewModel!.isloading
            ? Center(child: CircularProgressIndicator())
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .90,
                // padding: EdgeInsets.only(top: 16,left: 16,right: 16),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
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
                                    '${(bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.basicDetails!.profilePicUrl ?? '')}'),
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
                                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                                    color: Color(0xffE74B52),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.basicDetails!.firstName ?? ''}',
                                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                                          bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!
                                                  .address!.isEmpty
                                              ? Container()
                                              : Text(
                                                  '${bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address!.first.city ?? ''},${bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address!.first.country ?? ''}',
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
                    Container(
                      height: 510,
                      margin: EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Color(0xffF7FAFD)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "MY ACCOUNT",
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 12;

                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MyProfilepage(
                                    //             profileViewModel.getUserAllDetailsResponse!, profileViewModel)));
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "image/pprofile.png",
                                        height: 23,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "MY PROFILE",
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Color(0xff1F2A52),
                                              fontWeight: FontWeight.w900,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Image.asset(
                                  "image/Line 45.png",
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 13;

                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             MyOrderHistorypage(bottomViewModel.profileViewModel!)));
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "image/orderhis.png",
                                        height: 32,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "MY ORDER HISTORY",
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Color(0xff1F2A52),
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Image.asset(
                                  "image/Line 45.png",
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 14;
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MyGallarypage(bottomViewModel.profileViewModel!)));
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "image/mgallery.png",
                                        height: 23,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "MY GALLERY",
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Color(0xff1F2A52),
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Image.asset(
                                  "image/Line 45.png",
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 15;
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             MyAuctionReviewpage(bottomViewModel.profileViewModel!)));
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "image/auctionreview.png",
                                        height: 32,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "MY AUCTION REVIEW",
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Color(0xff1F2A52),
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Image.asset(
                                  "image/Line 45.png",
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 16;
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             MyAuctionDashboard(bottomViewModel.profileViewModel!)));
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "image/auction_dash.png",
                                        height: 27,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "AUCTION DASHBOARD",
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Color(0xff1F2A52),
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  "image/Line 45.png",
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                                InkWell(
                                  onTap: () async {
                                    await auctionViewModel.logout();

                                    Navigator.pushReplacement(
                                        context, MaterialPageRoute(builder: (BuildContext context) => Loginpage()));
                                  },
                                  child: Container(
                                    color: Color(0xffE6EEF0),
                                    padding: EdgeInsets.only(top: 16, bottom: 16, left: 10),
                                    child: Row(
                                      children: [
                                        Image.asset("image/logout.png", height: 24),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Log Out",
                                          textAlign: TextAlign.left,
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: Color(0xff3A3C38),
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
              );
      }),
      // bottomNavigationBar: Dashboard2Ui(),
    );
  }
}

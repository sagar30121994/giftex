import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';

class LiveTabs extends StatefulWidget {
  LiveTabs(this.auctionViewModel);

  AuctionViewModel auctionViewModel;

  @override
  State<LiveTabs> createState() => _LiveTabsState();
}

class _LiveTabsState extends State<LiveTabs> {
  Color tabColor = Color(0xffE74B52);

  @override
  void initState() {
    // TODO: implement initState
    widget.auctionViewModel.liveAuctionType = "browselist";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Observer(builder: (context) {
        return widget.auctionViewModel.auctionType == "live"
            ? Container(
                child: Column(
                  children: [
                    Container(
                      color: Color(0xffFFFFFF),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: DefaultTabController(
                        length: 4,
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
                                tabColor = Color(0xffE74B52);
                                setState(() {
                                  widget.auctionViewModel.liveAuctionType = "browselist";
                                  // widget.auctionViewModel.getLotById(
                                  //     widget.auctionViewModel!.selectedAuction!
                                  //         .auctionId!,
                                  //     widget.auctionViewModel.liveAuctionType);
                                });
                              }
                              if (index == 1) {
                                tabColor = Color(0xffE74B52);
                                setState(() {
                                  widget.auctionViewModel.liveAuctionType = "mygallery";
                                  widget.auctionViewModel.myAuctionGallery();
                                });
                              }
                              if (index == 2) {
                                tabColor = Color(0xffE74B52);
                                setState(() {
                                  widget.auctionViewModel.liveAuctionType = "review";
                                  widget.auctionViewModel
                                      .getReviewauctions(lot: widget.auctionViewModel.selectedAuction!);
                                });
                              }
                              if (index == 3) {
                                setState(() {
                                  tabColor = Color(0xffE74B52);
                                  widget.auctionViewModel.liveAuctionType = "closingschedule";
                                });
                              }

                              print(index);
                            },
                            indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(color: Color(0xffE74B52), width: 2.0),
                            ),
                            isScrollable: true,
                            padding: EdgeInsets.all(0),
                            labelPadding: EdgeInsets.only(right: 10, left: 5),
                            unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.59),
                            labelColor: const Color(0xFF2D2D2D),
                            labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Color(0xff2D2D2D),
                                  fontWeight: FontWeight.w600,
                                ),
                            tabs: [
                              Tab(
                                text: "BROWSE LOTS",
                              ),
                              Tab(text: "MY AUCTION GALLERY"),
                              Tab(text: "LIVE AUCTION REVIEW"),
                              Tab(text: "CLOSING SCHEDULE"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    widget.auctionViewModel.liveAuctionType == "browselist" ||
                            widget.auctionViewModel.liveAuctionType == "review" ||
                            widget.auctionViewModel.liveAuctionType == "mygallery"
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // Icon(Icons.menu_sharp,size: 30,),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.auctionViewModel.isGrid = false;
                                        });
                                      },
                                      child: Image.asset("image/list.png", height: 30)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.auctionViewModel.isGrid = true;
                                        });
                                        // auctionViewModel.isGrid=true;
                                      },
                                      child: Image.asset("image/grid.png", height: 30)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Container(),
                    widget.auctionViewModel.liveAuctionType == "closingschedule"
                        ? Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "image/Vector (21).png",
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width * .8,
                                      child: Text(
                                        "CLOSING SCHEDULE FOR ${widget.auctionViewModel.selectedAuction!.auctionName}, ${widget.auctionViewModel.selectedAuction!.displayDate}",
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                            color: Colors.black, fontWeight: FontWeight.w500, letterSpacing: 2),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .9,
                                  child: Text(
                                    "Auction Closing \nFor your convenience, especially if you are bidding on multiple lots are scheduled to close at different times on July 31, 2022. \n\nPre-determined groups of lots will close according to the bid-closing schedule unless a bid is recorded within a span of 3 minutes prior to the lot's scheduled closing time. In this case, the lot closing time will be extended by 3 minutes from the time of the last bid. If this time extension takes place, bidding on any lot will only end if there is no bid recorded for a span of 3 minutes. Bidders are requested to refresh the page for updates on latest bids and time extension if any. ",
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: Colors.black, fontWeight: FontWeight.w400, letterSpacing: 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .9,
                                  child: Text(
                                    "Lots have been allotted into groups, and the closing schedule for the various groups is follows:",
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 55,
                                              padding: EdgeInsets.all(15),
                                              width: MediaQuery.of(context).size.width / 3.6,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffEAEEF2),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        "image/maskbtn.png",
                                                      ),
                                                      fit: BoxFit.fill)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'GROUP',
                                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                                          color: Color(0XFF2D2D2D),
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              height: 55,
                                              padding: EdgeInsets.all(15),
                                              width: MediaQuery.of(context).size.width / 2.4,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffEAEEF2),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        "image/maskbtn.png",
                                                      ),
                                                      fit: BoxFit.fill)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'NO.OF LOTS',
                                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                                          color: Color(0XFF2D2D2D),
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              padding: EdgeInsets.all(10),
                                              width: MediaQuery.of(context).size.width / 2.4,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffEAEEF2),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        "image/maskbtn.png",
                                                      ),
                                                      fit: BoxFit.fill)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'CLOSING TIME',
                                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                                              color: Color(0XFF2D2D2D),
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                      ),
                                                      Text(
                                                        'IST',
                                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                                              color: Color(0XFF2D2D2D),
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              padding: EdgeInsets.all(10),
                                              width: MediaQuery.of(context).size.width / 2.4,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffEAEEF2),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        "image/maskbtn.png",
                                                      ),
                                                      fit: BoxFit.fill)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'CLOSING TIME',
                                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                                              color: Color(0XFF2D2D2D),
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                      ),
                                                      Text(
                                                        'US Eastern Time',
                                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                                              color: Color(0XFF2D2D2D),
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              padding: EdgeInsets.all(10),
                                              width: MediaQuery.of(context).size.width / 2.4,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffEAEEF2),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        "image/maskbtn.png",
                                                      ),
                                                      fit: BoxFit.fill)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'CLOSING TIME',
                                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                                              color: Color(0XFF2D2D2D),
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                      ),
                                                      Text(
                                                        'US Western Time',
                                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                                              color: Color(0XFF2D2D2D),
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              padding: EdgeInsets.all(10),
                                              width: MediaQuery.of(context).size.width / 2.4,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffEAEEF2),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        "image/maskbtn.png",
                                                      ),
                                                      fit: BoxFit.fill)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'CLOSING TIME',
                                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                                              color: Color(0XFF2D2D2D),
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                      ),
                                                      Text(
                                                        'UK',
                                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                                              color: Color(0XFF2D2D2D),
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              padding: EdgeInsets.all(10),
                                              width: MediaQuery.of(context).size.width / 2.4,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffEAEEF2),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        "image/maskbtn.png",
                                                      ),
                                                      fit: BoxFit.fill)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'CLOSING TIME',
                                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                                              color: Color(0XFF2D2D2D),
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                      ),
                                                      Text(
                                                        'Japan',
                                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                                              color: Color(0XFF2D2D2D),
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              padding: EdgeInsets.all(10),
                                              width: MediaQuery.of(context).size.width / 2.4,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffEAEEF2),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        "image/maskbtn.png",
                                                      ),
                                                      fit: BoxFit.fill)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'CLOSING TIME',
                                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                                              color: Color(0XFF2D2D2D),
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                      ),
                                                      Text(
                                                        'Hongkong',
                                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                                              color: Color(0XFF2D2D2D),
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: widget.auctionViewModel.singleAuctionDetsilaResponse!.result!
                                                  .closingScheduleList!
                                                  .map((e) => Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets.only(left: 20),
                                                                width: MediaQuery.of(context).size.width / 3.6,
                                                                child: Text(
                                                                  '${e.groups}',
                                                                  textAlign: TextAlign.center,
                                                                  style:
                                                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                            color: Color(0XFF2D2D2D),
                                                                            fontWeight: FontWeight.w400,
                                                                          ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.only(left: 20),
                                                                width: MediaQuery.of(context).size.width / 2.4,
                                                                child: Text(
                                                                  '${e.lotNumber}',
                                                                  textAlign: TextAlign.center,
                                                                  style:
                                                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                            color: Color(0XFF2D2D2D),
                                                                            fontWeight: FontWeight.w400,
                                                                          ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.only(left: 20),
                                                                width: MediaQuery.of(context).size.width / 2.4,
                                                                child: Text(
                                                                  '${e.iST}',
                                                                  textAlign: TextAlign.center,
                                                                  style:
                                                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                            color: Color(0XFF2D2D2D),
                                                                            fontWeight: FontWeight.w400,
                                                                          ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.only(left: 20),
                                                                width: MediaQuery.of(context).size.width / 2.4,
                                                                child: Text(
                                                                  '10:30PM',
                                                                  textAlign: TextAlign.center,
                                                                  style:
                                                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                            color: Color(0XFF2D2D2D),
                                                                            fontWeight: FontWeight.w400,
                                                                          ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.only(left: 20),
                                                                width: MediaQuery.of(context).size.width / 2.4,
                                                                child: Text(
                                                                  '07:30PM',
                                                                  textAlign: TextAlign.center,
                                                                  style:
                                                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                            color: Color(0XFF2D2D2D),
                                                                            fontWeight: FontWeight.w400,
                                                                          ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.only(left: 20),
                                                                width: MediaQuery.of(context).size.width / 2.4,
                                                                child: Text(
                                                                  ' ${e.uK}',
                                                                  textAlign: TextAlign.center,
                                                                  style:
                                                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                            color: Color(0XFF2D2D2D),
                                                                            fontWeight: FontWeight.w400,
                                                                          ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.only(left: 20),
                                                                width: MediaQuery.of(context).size.width / 2.4,
                                                                child: Text(
                                                                  ' ${e.japan}',
                                                                  textAlign: TextAlign.center,
                                                                  style:
                                                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                            color: Color(0XFF2D2D2D),
                                                                            fontWeight: FontWeight.w400,
                                                                          ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.only(left: 20),
                                                                width: MediaQuery.of(context).size.width / 2.4,
                                                                child: Text(
                                                                  ' ${e.china}',
                                                                  textAlign: TextAlign.center,
                                                                  style:
                                                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                                                            color: Color(0XFF2D2D2D),
                                                                            fontWeight: FontWeight.w400,
                                                                          ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Image.asset(
                                                            "image/Line 4.png",
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ],
                                                      ))
                                                  .toList()
                                              // children: [
                                              //
                                              //
                                              //
                                              //
                                              //
                                              //   Container(
                                              //     padding: EdgeInsets.only(left: 20),
                                              //
                                              //     width: MediaQuery.of(context).size.width/3.6,
                                              //     child: Text('1', textAlign: TextAlign.center,style:
                                              //     Theme.of(context).textTheme.subtitle1!.copyWith(
                                              //       color: Color(0XFF2D2D2D),
                                              //       fontWeight: FontWeight.w400,
                                              //     ),),
                                              //   ),
                                              //   SizedBox(width: 5,),
                                              //   Container(
                                              //     padding: EdgeInsets.only(left: 20),
                                              //     width: MediaQuery.of(context).size.width/2.4,
                                              //     child: Text('1-10',  textAlign: TextAlign.center,style:
                                              //     Theme.of(context).textTheme.subtitle1!.copyWith(
                                              //       color: Color(0XFF2D2D2D),
                                              //       fontWeight: FontWeight.w400,
                                              //     ),),
                                              //   ),
                                              //   SizedBox(width: 5,),
                                              //   Container(
                                              //     padding: EdgeInsets.only(left: 20),
                                              //     width: MediaQuery.of(context).size.width/2.4,
                                              //     child: Text('8PM', textAlign: TextAlign.center, style:
                                              //     Theme.of(context).textTheme.subtitle1!.copyWith(
                                              //       color: Color(0XFF2D2D2D),
                                              //       fontWeight: FontWeight.w400,
                                              //     ),),
                                              //   ),
                                              //   SizedBox(width: 5,),
                                              //   Container(
                                              //     padding: EdgeInsets.only(left: 20),
                                              //     width: MediaQuery.of(context).size.width/2.4,
                                              //     child: Text('10:30PM', textAlign: TextAlign.center, style:
                                              //     Theme.of(context).textTheme.subtitle1!.copyWith(
                                              //       color: Color(0XFF2D2D2D),
                                              //       fontWeight: FontWeight.w400,
                                              //     ),),
                                              //   ),
                                              //   SizedBox(width: 5,),
                                              //   Container(
                                              //     padding: EdgeInsets.only(left: 20),
                                              //     width: MediaQuery.of(context).size.width/2.4,
                                              //     child: Text('07:30PM',  textAlign: TextAlign.center,style:
                                              //     Theme.of(context).textTheme.subtitle1!.copyWith(
                                              //       color: Color(0XFF2D2D2D),
                                              //       fontWeight: FontWeight.w400,
                                              //     ),),
                                              //   ),
                                              //   SizedBox(width: 5,),
                                              //   Container(
                                              //     padding: EdgeInsets.only(left: 20),
                                              //     width: MediaQuery.of(context).size.width/2.4,
                                              //     child: Text(' 3PM', textAlign: TextAlign.center, style:
                                              //     Theme.of(context).textTheme.subtitle1!.copyWith(
                                              //       color: Color(0XFF2D2D2D),
                                              //       fontWeight: FontWeight.w400,
                                              //     ),),
                                              //   ),
                                              //   SizedBox(width: 5,),
                                              //   Container(
                                              //     padding: EdgeInsets.only(left: 20),
                                              //     width: MediaQuery.of(context).size.width/2.4,
                                              //     child: Text(' 11:30PM', textAlign: TextAlign.center, style:
                                              //     Theme.of(context).textTheme.subtitle1!.copyWith(
                                              //       color: Color(0XFF2D2D2D),
                                              //       fontWeight: FontWeight.w400,
                                              //     ),),
                                              //   ),
                                              //   SizedBox(width: 5,),
                                              //   Container(
                                              //     padding: EdgeInsets.only(left: 20),
                                              //     width: MediaQuery.of(context).size.width/2.4,
                                              //     child: Text(' 10:30PM', textAlign: TextAlign.center, style:
                                              //     Theme.of(context).textTheme.subtitle1!.copyWith(
                                              //       color: Color(0XFF2D2D2D),
                                              //       fontWeight: FontWeight.w400,
                                              //     ),),
                                              //   ),
                                              //
                                              //
                                              //
                                              // ],
                                              ),
                                        ),

                                        // Image.asset("image/Line 4.png",fit: BoxFit.cover, ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
                // Container()
              )
            : Container();
      }),
    );
  }
}

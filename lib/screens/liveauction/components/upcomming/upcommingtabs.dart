import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';

class UpcommingTabs extends StatefulWidget {
  UpcommingTabs(this.auctionViewModel);

  AuctionViewModel auctionViewModel;

  @override
  State<UpcommingTabs> createState() => _UpcommingTabsState();
}

class _UpcommingTabsState extends State<UpcommingTabs> {
  Color tabColor = Color(0xffE74B52);

  @override
  void initState() {
    // TODO: implement initState
    widget.auctionViewModel.liveAuctionType = "lots";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Observer(builder: (context) {
        return Column(
          children: [
            Container(
              color: Color(0xffFFFFFF),
              padding: EdgeInsets.only(left: 10, right: 10),
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
                        tabColor = Color(0xffE74B52);
                        setState(() {
                          widget.auctionViewModel.liveAuctionType = "lots";
                        });
                        // widget.auctionViewModel.getLotById(
                        //     widget.auctionViewModel.selectedAuction!
                        //         .auctionId!,
                        //     widget.auctionViewModel.liveAuctionType);
                      }
                      // if (index == 1) {
                      //   tabColor = Color(0xffE74B52);
                      //   setState(() {
                      //     widget.auctionViewModel.liveAuctionType =
                      //         "overview";
                      //     widget.auctionViewModel.getReviewauctions(
                      //         widget.auctionViewModel.selectedAuction!);
                      //
                      //     // widget.auctionViewModel.getReviewauctions(widget.auctionViewModel.selectedAuction!.auctionId!);
                      //   });
                      // }
                      if (index == 1) {
                        tabColor = Color(0xffE74B52);
                        setState(() {
                          widget.auctionViewModel.liveAuctionType = "closingschedule";
                          widget.auctionViewModel.getReviewauctions(lot: widget.auctionViewModel.selectedAuction!);
                        });
                      }

                      print(index);
                    },
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(color: Color(0xffE74B52), width: 2.0),
                    ),
                    // isScrollable: true,

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
                      // Tab(text: "LIVE AUCTION REVIEW"),
                      Tab(text: "CLOSING SCHEDULE"),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            widget.auctionViewModel.liveAuctionType == "lots" || widget.auctionViewModel.liveAuctionType == "overview"
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
                              child: Image.asset(
                                "image/list.png",
                                height: 30,
                                color: !widget.auctionViewModel.isGrid ? Colors.indigo : Colors.black,
                              )),
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
                              child: Image.asset(
                                "image/grid.png",
                                height: 30,
                                color: widget.auctionViewModel.isGrid ? Colors.indigo : Colors.black,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  )
                : Container(),
          ],
        );
      }),
    );
  }
}

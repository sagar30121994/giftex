import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:sliver_tools/sliver_tools.dart';

class PastTabs extends StatefulWidget {
  PastTabs(this.auctionViewModel);

  AuctionViewModel auctionViewModel;

  @override
  State<PastTabs> createState() => _LiveTabsState();
}

class _LiveTabsState extends State<PastTabs> {
  Color tabColor = Color(0xffE74B52);

  @override
  void initState() {
    // TODO: implement initState
    widget.auctionViewModel.liveAuctionType = "browselots";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPinnedHeader(
      child: Observer(builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                color: Color(0xffFFFFFF),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: DefaultTabController(
                  length: 2,
                  animationDuration: Duration(milliseconds: 500),
                  initialIndex: 0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      //This is for background color
                      color: Colors.white.withOpacity(0.0),

                      //This is for bottom border that is needed
                      border: Border(bottom: BorderSide(color: Color(0xffDFDFDF), width: 2)),
                    ),
                    child: TabBar(
                      //    tabAlignment: TabAlignment.fill,
                      onTap: (index) {
                        if (index == 0) {
                          tabColor = Color(0xffE74B52);
                          setState(() {
                            widget.auctionViewModel.liveAuctionType = "browselots";
                          });
                          widget.auctionViewModel
                              .getSingleAuctionDetails(widget.auctionViewModel.selectedAuction!.auctionId!);
                          widget.auctionViewModel
                              .getUpcommingBidAuction(widget.auctionViewModel.selectedAuction!.auctionId!);
                        }
                        if (index == 1) {
                          tabColor = Color(0xffE74B52);
                          setState(() {
                            widget.auctionViewModel.liveAuctionType = "auctionresult";
                            // widget.auctionViewModel.myAuctionGallery();
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
                        Tab(text: "AUCTION RESULT"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              widget.auctionViewModel.liveAuctionType == "browselots"
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
          ),
          // Container()
        );
      }),
    );
  }
}

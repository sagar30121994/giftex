

import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/components/bottomappbar.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';
import 'package:giftex/screens/filltersearch/filltersearch.dart';
import 'package:giftex/screens/homepage/liveitem.dart';
import 'package:giftex/screens/productdetailspage/productdetailpage.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../components/header.dart';
import '../customepaint.dart';
import 'dart:math';
AuctionViewModel auctionViewModel=AuctionViewModel();
class LiveAuctionUi extends StatefulWidget {
  String auction;
  LiveAuctionUi(this.auction);
  @override
  _LiveAuctionUiState createState() => _LiveAuctionUiState();
}

class _LiveAuctionUiState extends State<LiveAuctionUi> {
  int _pageIndex = 0;

  Color tabColor= Color(0xffE74B52);
  List<Menu> data = [];
  static const countdownDuration = Duration(minutes: 10);
  Duration duration = Duration();
  Timer? timer;

  bool countDown =true, selected=false;

  @override
  void initState() {
    // TODO: implement initState
    dataList.forEach((element) {
      data.add(Menu.fromJson(element));
    });
    auctionViewModel.auctionType=widget.auction;

    if(widget.auction == "live"){
      auctionViewModel.getUpcommingAuction("Live");
    }else if (widget.auction == "past"){

      auctionViewModel.getUpcommingAuction("Past");
    }else{
      auctionViewModel.getUpcommingAuction("UpComing");
    }

    super.initState();
    reset();
  }

  void reset(){
    if (countDown){
      setState(() =>
      duration = countdownDuration);
    } else{
      setState(() =>
      duration = Duration());
    }
  }

  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1),(_) => addTime());
  }

  void addTime(){
    final addSeconds = countDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0){
        timer?.cancel();
      } else{
        duration = Duration(seconds: seconds);

      }
    });
  }

  void stopTimer({bool resets = true}){
    if (resets){
      reset();
    }
    setState(() => timer?.cancel());
  }
  Widget _buildList(Menu list) {
    if (list.subMenu!.isEmpty)
      return Builder(
          builder: (context) {
            return ListTile(
                // onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategory(list.name))),
                leading: Checkbox(
                  value: selected,
                  shape: RoundedRectangleBorder(),
                  onChanged: (bool? value){},
                ),
                title: Text(list!.name!, style:
                Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),)
            );
          }
      );
    return ExpansionTile(


      title: Text(
        list.name!,
        style:
        Theme.of(context).textTheme.subtitle1!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: list.subMenu!.map(_buildList).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child:  NavBar(),
              ),

              SliverToBoxAdapter(
                child:  SizedBox(height: 16,),
              ),
              SliverToBoxAdapter(
                child:  Align(
                  child: Text("OPULENT COLLECTIBLES",
                    textAlign: TextAlign.left,
                    style:
                    Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

          SliverToBoxAdapter(
                child:  Observer(
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width*.80,
                      child: Text("Bid on works you love with auctions. With bidding opening daily, connects collectors like you to art from leading auction houses, nonprofit organizations, and sellers across the globe.",
                        textAlign: TextAlign.justify,
                        style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }
                ),
              ),


          SliverToBoxAdapter(
                child:  Observer(
                    builder: (context) {
                      return Container(
                      width: MediaQuery.of(context).size.width*.80,
                      child:   Container(
                        height: 250,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20,bottom: 0),
                              child: Container(
                                //replace this Container with your Card
                                color: Theme.of(context).colorScheme.onPrimary,
                                height: 250.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0,right: 25),
                              child: Image.asset("image/Bitmap.png"),
                            ),

                            Padding(
                                padding: EdgeInsets.only(top: 400 / 2.0,bottom: 0,left: 25.0,right: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("image/calender.png",color: Colors.white,height: 22,),
                                    // Icon(Icons.calendar_today,size: 22,color: Color(0xff80A071),),
                                    SizedBox(width: 20,),
                                    Text("25th-27th Aug, 2022",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    Image.asset("image/share.png",height: 32,),

                                    SizedBox(width: 20,),
                                    Image.asset("image/save.png",height: 32,),
                                    // SizedBox(width: 10,),
                                  ],
                                )
                            ),

                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   crossAxisAlignment: CrossAxisAlignment.end,
                            //   children: [
                            //     Divider(color: Color(0xff466D33),thickness: 1,),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),


          SliverToBoxAdapter(
                child:   Observer(
                    builder: (context) {
                    return Container(
                      color: Theme.of(context).colorScheme.onPrimary,
                      child: DefaultTabController(
                        length: 3,

                        initialIndex: widget.auction=="live"?0:widget.auction=="upcoming"?1:2,
                        child:  TabBar(
                          onTap: (index) async{
                            setState(() async{

                              if(index==0) {
                                tabColor =  Color(0xffE74B52);
                              auctionViewModel.auctionType = "live";
                             await auctionViewModel.getUpcommingAuction("Live");
                              }
                             else if(index==1) {
                                tabColor =  Color(0xffE74B52);
                              auctionViewModel.auctionType="upcoming";
                              auctionViewModel.getUpcommingAuction("UpComing");
                              }

                             else if(index==2) {
                                tabColor =  Color(0xffE74B52);
                              auctionViewModel.auctionType="past";
                              auctionViewModel.getUpcommingAuction("Past");
                              }

                            });
                            print(index);
                          },
                          isScrollable: true,
                          indicator: BoxDecoration(
                              color: tabColor
                          ),
                          padding: EdgeInsets.all(0),
                          unselectedLabelColor: Color(0xffFFFFFF).withOpacity(0.6),
                          labelColor: const Color(0xFFFFFFFF),

                          unselectedLabelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,),
                          labelStyle:Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,),
                          tabs: [
                            Tab(
                              text: "LIVE AUCTION",


                            ),
                            Tab(
                                text: "UPCOMING AUCTION"
                            ),
                            Tab(
                                text: "PAST AUCTION"
                            ),

                          ],
                        ),

                      ),
                    );
                  }
                ),
              ),




          // SliverToBoxAdapter(
          //       child:   Observer(
          //         builder: (context) {
          //           return auctionViewModel.auctionType=="live"?
          //           Container(
          //
          //            child: Column(
          //               children: [
          //                 Container(
          //                   color: Color(0xffFFFFFF),
          //                   padding: EdgeInsets.only(left: 10,right: 10),
          //                   child: DefaultTabController(
          //                     length: 4,
          //                     initialIndex: 0,
          //
          //                     child:  DecoratedBox(
          //                       decoration: BoxDecoration(
          //                         //This is for background color
          //                         color: Colors.white.withOpacity(0.0),
          //
          //                   //This is for bottom border that is needed
          //                   border: Border(
          //                       bottom: BorderSide(color: Color(0xffDFDFDF), width: 2)),
          //                 ),
          //                 child: TabBar(
          //                   onTap: (index) {
          //
          //
          //                             if(index==0) { tabColor =  Color(0xffE74B52);
          //                             auctionViewModel.liveAuctionType="browselist";
          //                             }
          //                             if(index==1) {tabColor =   Color(0xffE74B52);
          //                             auctionViewModel.liveAuctionType="mygallery";
          //                             }
          //                             if(index==2) {tabColor =   Color(0xffE74B52);
          //                             auctionViewModel.liveAuctionType="review";
          //                             }
          //                             if(index==3) {tabColor =   Color(0xffE74B52);
          //                             auctionViewModel.liveAuctionType="closingschedule";
          //                             }
          //
          //                           print(index);
          //                         },
          //                         indicator: UnderlineTabIndicator(
          //                           borderSide:
          //                           BorderSide(color:  Color(0xffE74B52), width: 2.0),
          //                         ),
          //                         isScrollable: true,
          //
          //                         padding: EdgeInsets.all(0),
          //                         labelPadding:  EdgeInsets.only(right: 10,left: 5),
          //                         unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.59),
          //                         labelColor: const Color(0xFF2D2D2D),
          //                         labelStyle:
          //                         Theme.of(context).textTheme.bodyText1!.copyWith(
          //                           color: Color(0xff2D2D2D),
          //                           fontWeight: FontWeight.w600,),
          //                         tabs: [
          //                           Tab(
          //                             text: "BROWSE LOTS",
          //                           ),
          //                           Tab(
          //                               text: "MY AUCTION GALLERY"
          //                           ),
          //                           Tab(
          //                               text: "LIVE AUCTION REVIEW"
          //                           ),
          //                           Tab(
          //                               text: "CLOSING SCHEDULE"
          //                           ),
          //
          //                         ],
          //                       ),
          //                     ),
          //
          //                   ),
          //                 ),
          //                 SizedBox(height: 20,),
          //                 auctionViewModel.liveAuctionType=="browselist" ||auctionViewModel.liveAuctionType=="review" ||auctionViewModel.liveAuctionType=="mygallery"?
          //                  Column(
          //                   children: [
          //                     Row(
          //                       mainAxisAlignment: MainAxisAlignment.end,
          //                       crossAxisAlignment: CrossAxisAlignment.end,
          //                       children: [
          //                         Icon(Icons.menu_sharp,size: 30,),
          //                         SizedBox(width: 10,),
          //                         Icon(Icons.dashboard_outlined,size: 30,),
          //                         SizedBox(width: 10,),
          //                       ],
          //                     ),
          //                     // SliverList(
          //                     //   delegate: SliverChildBuilderDelegate(
          //                     //         (BuildContext context, int index) {
          //                     //       return Padding(
          //                     //         padding: const EdgeInsets.all(15.0),
          //                     //         child: Container(
          //                     //             color: Color(0xffFFFFFF),
          //                     //             height:550,
          //                     //             alignment: Alignment.center,
          //                     //             child: Stack(
          //                     //               children: [
          //                     //                 Padding(
          //                     //                   padding: EdgeInsets.only(top: 150 / 2.0,bottom: 0),
          //                     //                   child: Container(
          //                     //                     //replace this Container with your Card
          //                     //                     color: Color(0xffF9F9F9),
          //                     //                     height:500.0,
          //                     //                   ),
          //                     //                 ),
          //                     //                 InkWell(
          //                     //                   onTap: (){
          //                     //                     Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
          //                     //                   },
          //                     //                   child: Padding(
          //                     //                     padding: const EdgeInsets.only(left: 25.0,right: 25),
          //                     //                     child: Image.asset("image/Bitmap6.png",height: 250,
          //                     //                       width: MediaQuery.of(context).size.width*.65,
          //                     //                       fit: BoxFit.contain,
          //                     //
          //                     //                     ),
          //                     //                   ),
          //                     //                 ),
          //                     //                 Padding(
          //                     //                     padding: EdgeInsets.only(top: 250,bottom: 0,left: 25.0,right: 25),
          //                     //                     child:Column(
          //                     //                       mainAxisAlignment: MainAxisAlignment.start,
          //                     //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                     //                       children: [
          //                     //                         SizedBox(width: 20,),
          //                     //                         Text("JAMINI ROY",
          //                     //                           textAlign: TextAlign.center,
          //                     //                           style:
          //                     //                           Theme.of(context).textTheme.headline6!.copyWith(
          //                     //                             color: Colors.black,
          //                     //                             letterSpacing: 2,
          //                     //                             fontWeight: FontWeight.bold,
          //                     //                           ),
          //                     //                         ),
          //                     //                         SizedBox(height: 10,),
          //                     //                         Text("Mother & Child",
          //                     //                           textAlign: TextAlign.center,
          //                     //                           style:
          //                     //                           Theme.of(context).textTheme.subtitle1!.copyWith(
          //                     //                             color: Color(0xff747474),
          //                     //                             fontWeight: FontWeight.w400,
          //                     //                           ),
          //                     //                         ),
          //                     //                         SizedBox(height: 20,),
          //                     //                         Row(
          //                     //                           mainAxisAlignment: MainAxisAlignment.start,
          //                     //                           crossAxisAlignment: CrossAxisAlignment.start,
          //                     //                           children: [
          //                     //                             Column(
          //                     //                               mainAxisAlignment: MainAxisAlignment.start,
          //                     //                               crossAxisAlignment: CrossAxisAlignment.start,
          //                     //                               children: [
          //                     //                                 Text("Estimate Value ",
          //                     //                                   textAlign: TextAlign.center,
          //                     //                                   style:
          //                     //                                   Theme.of(context).textTheme.subtitle1!.copyWith(
          //                     //                                     color: Color(0xff747474),
          //                     //                                     fontWeight: FontWeight.w400,
          //                     //                                   ),
          //                     //                                 ),
          //                     //                                 SizedBox(height: 10,),
          //                     //                                 Text("₹50,000- ₹75,000",
          //                     //                                   textAlign: TextAlign.center,
          //                     //                                   style:
          //                     //                                   Theme.of(context).textTheme.bodyText1!.copyWith(
          //                     //                                     color: Color(0xff202232),
          //                     //                                     fontWeight: FontWeight.bold,
          //                     //                                   ),
          //                     //                                 ),
          //                     //                               ],
          //                     //                             ),
          //                     //                             Spacer(),
          //                     //                             Column(
          //                     //                               mainAxisAlignment: MainAxisAlignment.start,
          //                     //                               crossAxisAlignment: CrossAxisAlignment.start,
          //                     //                               children: [
          //                     //                                 Text("Bid Closing in",
          //                     //                                   textAlign: TextAlign.center,
          //                     //                                   style:
          //                     //                                   Theme.of(context).textTheme.subtitle1!.copyWith(
          //                     //                                     color: Color(0xff747474),
          //                     //                                     fontWeight: FontWeight.w400,
          //                     //                                   ),
          //                     //                                 ),
          //                     //                                 SizedBox(height: 10,),
          //                     //                                 Row(
          //                     //                                   children: [
          //                     //                                     Container(
          //                     //                                         decoration: BoxDecoration(
          //                     //                                           borderRadius: BorderRadius.circular(8),
          //                     //                                           color: Color(0xff8C9FB1),
          //                     //                                         ),
          //                     //                                         padding: EdgeInsets.all(4),
          //                     //                                         child:Text("02",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
          //                     //                                     ),
          //                     //                                     Container(
          //                     //                                       // color: Colors.black,
          //                     //                                         padding: EdgeInsets.all(4),
          //                     //                                         child:Text(":")
          //                     //                                     ),
          //                     //                                     Container(
          //                     //                                         decoration: BoxDecoration(
          //                     //                                           borderRadius: BorderRadius.circular(8),
          //                     //                                           color: Color(0xff8C9FB1),
          //                     //                                         ),
          //                     //
          //                     //                                         padding: EdgeInsets.all(4),
          //                     //                                         child:Text("14",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
          //                     //                                     ),
          //                     //
          //                     //                                     Container(
          //                     //                                       // color: Colors.black,
          //                     //                                         padding: EdgeInsets.all(4),
          //                     //                                         child:Text(":")
          //                     //                                     ),
          //                     //
          //                     //                                     Container(
          //                     //                                         decoration: BoxDecoration(
          //                     //                                           borderRadius: BorderRadius.circular(8),
          //                     //                                           color: Color(0xff8C9FB1),
          //                     //                                         ),
          //                     //                                         padding: EdgeInsets.all(4),
          //                     //                                         child:Text("59",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
          //                     //                                     ),
          //                     //                                   ],
          //                     //                                 ),
          //                     //                               ],
          //                     //                             ),
          //                     //                           ],
          //                     //                         ),
          //                     //                         SizedBox(height: 20,),
          //                     //                         Row(
          //                     //                           mainAxisAlignment: MainAxisAlignment.start,
          //                     //                           crossAxisAlignment: CrossAxisAlignment.start,
          //                     //                           children: [
          //                     //                             Column(
          //                     //                               mainAxisAlignment: MainAxisAlignment.start,
          //                     //                               crossAxisAlignment: CrossAxisAlignment.start,
          //                     //                               children: [
          //                     //                                 Text("Current Bid",
          //                     //                                   textAlign: TextAlign.center,
          //                     //                                   style:
          //                     //                                   Theme.of(context).textTheme.subtitle1!.copyWith(
          //                     //                                     color: Color(0xff747474),
          //                     //                                     fontWeight: FontWeight.w400,
          //                     //                                   ),
          //                     //                                 ),
          //                     //                                 SizedBox(height: 10,),
          //                     //                                 Text("₹50,000",
          //                     //                                   textAlign: TextAlign.center,
          //                     //                                   style:
          //                     //                                   Theme.of(context).textTheme.bodyText1!.copyWith(
          //                     //                                     color: Color(0xff202232),
          //                     //                                     fontWeight: FontWeight.w600,
          //                     //                                   ),
          //                     //                                 ),
          //                     //                               ],
          //                     //                             ),
          //                     //                             Spacer(),
          //                     //                             Column(
          //                     //                               mainAxisAlignment: MainAxisAlignment.start,
          //                     //                               crossAxisAlignment: CrossAxisAlignment.start,
          //                     //                               children: [
          //                     //                                 Text("Next Valid Bid",
          //                     //                                   textAlign: TextAlign.center,
          //                     //                                   style:
          //                     //                                   Theme.of(context).textTheme.subtitle1!.copyWith(
          //                     //                                     color: Color(0xff747474),
          //                     //                                     fontWeight: FontWeight.w400,
          //                     //                                   ),
          //                     //                                 ),
          //                     //                                 SizedBox(height: 10,),
          //                     //                                 Text("₹75,000",
          //                     //                                   textAlign: TextAlign.center,
          //                     //                                   style:
          //                     //                                   Theme.of(context).textTheme.bodyText1!.copyWith(
          //                     //                                     color: Theme.of(context).colorScheme.primary,
          //                     //                                     fontWeight: FontWeight.w600,
          //                     //                                   ),
          //                     //                                 ),
          //                     //                               ],
          //                     //                             ),
          //                     //                           ],
          //                     //                         ),
          //                     //                         SizedBox(height: 20,),
          //                     //                         Row(
          //                     //                           mainAxisAlignment: MainAxisAlignment.end,
          //                     //                           children: [
          //                     //                             ElevatedButton(
          //                     //                               style:   ButtonStyle(
          //                     //                                   backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
          //                     //                                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //                     //                                       RoundedRectangleBorder(
          //                     //                                           borderRadius: BorderRadius.circular(20.0),
          //                     //                                           side: BorderSide(color: Color(0xff747474),width: 0.38)
          //                     //                                       )
          //                     //                                   )
          //                     //                               ),
          //                     //                               onPressed: (){
          //                     //                               },
          //                     //                               child: Padding(
          //                     //                                 padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
          //                     //                                 child: Text('PROXY BID', style:
          //                     //                                 Theme.of(context).textTheme.bodyText1!.copyWith(
          //                     //                                   color: Color(0XFF2D2D2D),
          //                     //                                   fontWeight: FontWeight.bold,
          //                     //                                 ),),
          //                     //                               ),
          //                     //                             ),
          //                     //                             SizedBox(width: 10,),
          //                     //                             InkWell(
          //                     //                               onTap: (){
          //                     //                                 // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
          //                     //                               },
          //                     //                               child: Container(
          //                     //                                 height: 50,
          //                     //                                 // width: 150,
          //                     //                                 decoration: BoxDecoration(
          //                     //                                     gradient: LinearGradient(
          //                     //                                         colors: [Color(0xffE74B52),Color(0xffE74B52),]
          //                     //                                     ),
          //                     //                                     // color: Color(0xff466D33),
          //                     //                                     borderRadius: BorderRadius.circular(24)
          //                     //                                 ),
          //                     //                                 child: Center(
          //                     //                                   child: Padding(
          //                     //                                     padding: const EdgeInsets.only(right: 32.0,left: 32,top: 12,bottom: 12),
          //                     //                                     child: Text('BID NOW', style:
          //                     //                                     Theme.of(context).textTheme.bodyText1!.copyWith(
          //                     //                                       color: Color(0XFFFFFFFF),
          //                     //                                       fontWeight: FontWeight.bold,
          //                     //                                     ),),
          //                     //                                   ),
          //                     //                                 ),
          //                     //                               ),),
          //                     //                           ],
          //                     //                         ),
          //                     //                         SizedBox(height: 8,),
          //                     //                       ],
          //                     //                     )
          //                     //                 ),
          //                     //
          //                     //                 Positioned(
          //                     //                   right: 16,
          //                     //                   top: 50,
          //                     //                   child: Column(
          //                     //                     children: [
          //                     //                       Container(
          //                     //
          //                     //
          //                     //                         child: Text("Lot 01"),
          //                     //                         decoration: BoxDecoration(
          //                     //                           borderRadius: BorderRadius.circular(16),
          //                     //                           color: Colors.lightBlueAccent.withOpacity(.2),
          //                     //
          //                     //                         ),
          //                     //                         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
          //                     //
          //                     //                       ),
          //                     //
          //                     //                       SizedBox(height:12),
          //                     //                       Container(
          //                     //                         decoration: BoxDecoration(
          //                     //                             borderRadius: BorderRadius.circular(16),
          //                     //                             color: Color(0xffEAF1DB)
          //                     //
          //                     //                         ),
          //                     //                         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
          //                     //                         child: Text("5 BIDS"),
          //                     //
          //                     //                       ),
          //                     //                       SizedBox(height:12),
          //                     //                       Icon(Icons.favorite_border,color: Colors.grey,),
          //                     //                       SizedBox(height:12),
          //                     //                       Icon(Icons.open_in_full,color: Colors.grey,),
          //                     //                       SizedBox(height:12),
          //                     //                       // Container(
          //                     //                       //   padding: EdgeInsets.all(16),
          //                     //                       //   decoration: BoxDecoration(
          //                     //                       //     color:  Colors.lightBlueAccent.withOpacity(.2),
          //                     //                       //     borderRadius: BorderRadius.circular(32)
          //                     //                       //
          //                     //                       //   ),
          //                     //                       // )
          //                     //                       Image.asset("image/earth.png",height: 50,)
          //                     //                     ],
          //                     //                   ),
          //                     //                 )
          //                     //
          //                     //               ],
          //                     //             )
          //                     //         ),
          //                     //       );
          //                     //     },
          //                     //     // 40 list items
          //                     //     childCount: 3,
          //                     //   ),
          //                     // )
          //                   ],
          //                  )
          //                 :Container(),
          //                 auctionViewModel.liveAuctionType=="closingschedule"?Container(
          //                   padding: EdgeInsets.all(16),
          //                   child: Column(
          //                     children: [
          //                       Row(
          //                         mainAxisAlignment: MainAxisAlignment.start,
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           Image.asset("image/Vector (21).png",color: Theme.of(context).colorScheme.primary,),
          //                           SizedBox(width: 10,),
          //                           Container(
          //                             width: MediaQuery.of(context).size.width*.8,
          //                             child: Text("CLOSING SCHEDULE FOR OPULENT COLLECTIBLES, JULY 31, 2022",
          //                               textAlign: TextAlign.start,
          //                               style:
          //                               Theme.of(context).textTheme.headline6!.copyWith(
          //                                   color: Colors.black,
          //                                   fontWeight: FontWeight.w500,
          //                                   letterSpacing: 2
          //                               ),
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                       SizedBox(height: 20,),
          //                       Container(
          //                         width: MediaQuery.of(context).size.width*.9,
          //                         child: Text("Auction Closing \nFor your convenience, especially if you are bidding on multiple lots are scheduled to close at different times on July 31, 2022. \n\nPre-determined groups of lots will close according to the bid-closing schedule unless a bid is recorded within a span of 3 minutes prior to the lot's scheduled closing time. In this case, the lot closing time will be extended by 3 minutes from the time of the last bid. If this time extension takes place, bidding on any lot will only end if there is no bid recorded for a span of 3 minutes. Bidders are requested to refresh the page for updates on latest bids and time extension if any. ",
          //                           textAlign: TextAlign.start,
          //                           style:
          //                           Theme.of(context).textTheme.bodyText1!.copyWith(
          //                               color: Colors.black,
          //                               fontWeight: FontWeight.w400,
          //                               letterSpacing: 1
          //                           ),
          //                         ),
          //                       ),
          //                       SizedBox(height: 20,),
          //                       Container(
          //                         width: MediaQuery.of(context).size.width*.9,
          //                         child: Text("Lots have been allotted into groups, and the closing schedule for the various groups is follows:",textAlign: TextAlign.start,
          //                           style:
          //                           Theme.of(context).textTheme.subtitle1!.copyWith(
          //                               color: Colors.black,
          //                               fontWeight: FontWeight.bold,
          //                               letterSpacing: 1
          //                           ),
          //                         ),
          //                       ),
          //                       SizedBox(height: 20,),
          //                       Container(
          //                         child: Column(
          //
          //                           children: [
          //                             Row(
          //                               children: [
          //                                 Container(
          //                                   height: 55,
          //                                   padding: EdgeInsets.all(15),
          //                                   width: MediaQuery.of(context).size.width/3.6,
          //                                   decoration: BoxDecoration(
          //                                       color: Color(0xffEAEEF2),
          //                                       image: DecorationImage(
          //                                           image: AssetImage("image/maskbtn.png",),
          //                                           fit: BoxFit.fill
          //                                       )
          //                                   ),
          //                                   child: Row(
          //                                     mainAxisAlignment: MainAxisAlignment.center,
          //                                     crossAxisAlignment: CrossAxisAlignment.center,
          //                                     children: [
          //
          //                                       Text('GROUP', style:
          //                                       Theme.of(context).textTheme.caption!.copyWith(
          //                                         color: Color(0XFF2D2D2D),
          //                                         fontWeight: FontWeight.w600,
          //                                       ),),
          //                                     ],
          //                                   ),
          //                                 ),
          //                                 SizedBox(width: 5,),
          //                                 Container(
          //                                   height: 55,
          //                                   padding: EdgeInsets.all(15),
          //                                   width: MediaQuery.of(context).size.width/2.4,
          //                                   decoration: BoxDecoration(
          //                                       color: Color(0xffEAEEF2),
          //                                       image: DecorationImage(
          //                                           image: AssetImage("image/maskbtn.png",),
          //                                           fit: BoxFit.fill
          //                                       )
          //                                   ),
          //                                   child: Row(
          //                                     mainAxisAlignment: MainAxisAlignment.center,
          //                                     crossAxisAlignment: CrossAxisAlignment.center,
          //                                     children: [
          //
          //                                       Text('NO.OF LOTS', style:
          //                                       Theme.of(context).textTheme.caption!.copyWith(
          //                                         color: Color(0XFF2D2D2D),
          //                                         fontWeight: FontWeight.w600,
          //                                       ),),
          //                                     ],
          //                                   ),
          //                                 ),
          //                                 Container(
          //                                   height: 60,
          //                                   padding: EdgeInsets.all(10),
          //                                   width: MediaQuery.of(context).size.width/2.4,
          //                                   decoration: BoxDecoration(
          //                                       color: Color(0xffEAEEF2),
          //                                       image: DecorationImage(
          //                                           image: AssetImage("image/maskbtn.png",),
          //                                           fit: BoxFit.fill
          //                                       )
          //                                   ),
          //                                   child: Row(
          //                                     mainAxisAlignment: MainAxisAlignment.center,
          //                                     crossAxisAlignment: CrossAxisAlignment.center,
          //                                     children: [
          //
          //                                       Column(
          //                                         children: [
          //                                           Text('CLOSING TIME', style:
          //                                           Theme.of(context).textTheme.caption!.copyWith(
          //                                             color: Color(0XFF2D2D2D),
          //                                             fontWeight: FontWeight.w600,
          //                                           ),),
          //                                           Text('IST', style:
          //                                           Theme.of(context).textTheme.caption!.copyWith(
          //                                             color: Color(0XFF2D2D2D),
          //                                             fontWeight: FontWeight.w400,
          //                                           ),),
          //                                         ],
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),
          //                                 Container(
          //                                   height: 60,
          //                                   padding: EdgeInsets.all(10),
          //                                   width: MediaQuery.of(context).size.width/2.4,
          //                                   decoration: BoxDecoration(
          //                                       color: Color(0xffEAEEF2),
          //                                       image: DecorationImage(
          //                                           image: AssetImage("image/maskbtn.png",),
          //                                           fit: BoxFit.fill
          //                                       )
          //                                   ),
          //                                   child: Row(
          //                                     mainAxisAlignment: MainAxisAlignment.center,
          //                                     crossAxisAlignment: CrossAxisAlignment.center,
          //                                     children: [
          //
          //                                       Column(
          //                                         children: [
          //                                           Text('CLOSING TIME', style:
          //                                           Theme.of(context).textTheme.caption!.copyWith(
          //                                             color: Color(0XFF2D2D2D),
          //                                             fontWeight: FontWeight.w600,
          //                                           ),),
          //                                           Text('US Eastern Time', style:
          //                                           Theme.of(context).textTheme.caption!.copyWith(
          //                                             color: Color(0XFF2D2D2D),
          //                                             fontWeight: FontWeight.w400,
          //                                           ),),
          //                                         ],
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),
          //                                 Container(
          //                                   height: 60,
          //                                   padding: EdgeInsets.all(10),
          //                                   width: MediaQuery.of(context).size.width/2.4,
          //                                   decoration: BoxDecoration(
          //                                       color: Color(0xffEAEEF2),
          //                                       image: DecorationImage(
          //                                           image: AssetImage("image/maskbtn.png",),
          //                                           fit: BoxFit.fill
          //                                       )
          //                                   ),
          //                                   child: Row(
          //                                     mainAxisAlignment: MainAxisAlignment.center,
          //                                     crossAxisAlignment: CrossAxisAlignment.center,
          //                                     children: [
          //
          //                                       Column(
          //                                         children: [
          //                                           Text('CLOSING TIME', style:
          //                                           Theme.of(context).textTheme.caption!.copyWith(
          //                                             color: Color(0XFF2D2D2D),
          //                                             fontWeight: FontWeight.w600,
          //                                           ),),
          //                                           Text('US Western Time', style:
          //                                           Theme.of(context).textTheme.caption!.copyWith(
          //                                             color: Color(0XFF2D2D2D),
          //                                             fontWeight: FontWeight.w400,
          //                                           ),),
          //                                         ],
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),
          //                                 Container(
          //                                   height: 60,
          //                                   padding: EdgeInsets.all(10),
          //                                   width: MediaQuery.of(context).size.width/2.4,
          //                                   decoration: BoxDecoration(
          //                                       color: Color(0xffEAEEF2),
          //                                       image: DecorationImage(
          //                                           image: AssetImage("image/maskbtn.png",),
          //                                           fit: BoxFit.fill
          //                                       )
          //                                   ),
          //                                   child: Row(
          //                                     mainAxisAlignment: MainAxisAlignment.center,
          //                                     crossAxisAlignment: CrossAxisAlignment.center,
          //                                     children: [
          //
          //                                       Column(
          //                                         children: [
          //                                           Text('CLOSING TIME', style:
          //                                           Theme.of(context).textTheme.caption!.copyWith(
          //                                             color: Color(0XFF2D2D2D),
          //                                             fontWeight: FontWeight.w600,
          //                                           ),),
          //                                           Text('UK', style:
          //                                           Theme.of(context).textTheme.caption!.copyWith(
          //                                             color: Color(0XFF2D2D2D),
          //                                             fontWeight: FontWeight.w400,
          //                                           ),),
          //                                         ],
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),
          //                                 Container(
          //                                   height: 60,
          //                                   padding: EdgeInsets.all(10),
          //                                   width: MediaQuery.of(context).size.width/2.4,
          //                                   decoration: BoxDecoration(
          //                                       color: Color(0xffEAEEF2),
          //                                       image: DecorationImage(
          //                                           image: AssetImage("image/maskbtn.png",),
          //                                           fit: BoxFit.fill
          //                                       )
          //                                   ),
          //                                   child: Row(
          //                                     mainAxisAlignment: MainAxisAlignment.center,
          //                                     crossAxisAlignment: CrossAxisAlignment.center,
          //                                     children: [
          //
          //                                       Column(
          //                                         children: [
          //                                           Text('CLOSING TIME', style:
          //                                           Theme.of(context).textTheme.caption!.copyWith(
          //                                             color: Color(0XFF2D2D2D),
          //                                             fontWeight: FontWeight.w600,
          //                                           ),),
          //                                           Text('Japan', style:
          //                                           Theme.of(context).textTheme.caption!.copyWith(
          //                                             color: Color(0XFF2D2D2D),
          //                                             fontWeight: FontWeight.w400,
          //                                           ),),
          //                                         ],
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),
          //                                 Container(
          //                                   height: 60,
          //                                   padding: EdgeInsets.all(10),
          //                                   width: MediaQuery.of(context).size.width/2.4,
          //                                   decoration: BoxDecoration(
          //                                       color: Color(0xffEAEEF2),
          //                                       image: DecorationImage(
          //                                           image: AssetImage("image/maskbtn.png",),
          //                                           fit: BoxFit.fill
          //                                       )
          //                                   ),
          //                                   child: Row(
          //                                     mainAxisAlignment: MainAxisAlignment.center,
          //                                     crossAxisAlignment: CrossAxisAlignment.center,
          //                                     children: [
          //
          //                                       Column(
          //                                         children: [
          //                                           Text('CLOSING TIME', style:
          //                                           Theme.of(context).textTheme.caption!.copyWith(
          //                                             color: Color(0XFF2D2D2D),
          //                                             fontWeight: FontWeight.w600,
          //                                           ),),
          //                                           Text('Hongkong', style:
          //                                           Theme.of(context).textTheme.caption!.copyWith(
          //                                             color: Color(0XFF2D2D2D),
          //                                             fontWeight: FontWeight.w400,
          //                                           ),),
          //                                         ],
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                             SizedBox(height: 10,),
          //                             Padding(
          //                               padding: const EdgeInsets.only(left: 8.0),
          //                               child: Row(
          //                                 mainAxisAlignment: MainAxisAlignment.start,
          //                                 children: [
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //
          //                                     width: MediaQuery.of(context).size.width/3.6,
          //                                     child: Text('1', textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('1-10',  textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('8PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('10:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('07:30PM',  textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 3PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 11:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 10:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                             SizedBox(height: 10,),
          //                             Image.asset("image/Line 4.png",fit: BoxFit.cover, ),
          //                             SizedBox(height: 10,),SizedBox(height: 10,),
          //                             Padding(
          //                               padding: const EdgeInsets.only(left: 8.0),
          //                               child: Row(
          //                                 mainAxisAlignment: MainAxisAlignment.start,
          //                                 children: [
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //
          //                                     width: MediaQuery.of(context).size.width/3.6,
          //                                     child: Text('2', textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('1-10',  textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('8PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('10:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('07:30PM',  textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 3PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 11:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 10:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                             SizedBox(height: 10,),
          //                             Image.asset("image/Line 4.png",fit: BoxFit.cover, ),
          //                             SizedBox(height: 10,),SizedBox(height: 10,),
          //                             Padding(
          //                               padding: const EdgeInsets.only(left: 8.0),
          //                               child: Row(
          //                                 mainAxisAlignment: MainAxisAlignment.start,
          //                                 children: [
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //
          //                                     width: MediaQuery.of(context).size.width/3.6,
          //                                     child: Text('3', textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('1-10',  textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('8PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('10:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('07:30PM',  textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 3PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 11:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 10:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                             SizedBox(height: 10,),
          //                             Image.asset("image/Line 4.png",fit: BoxFit.cover, ),
          //                             SizedBox(height: 10,),SizedBox(height: 10,),
          //                             Padding(
          //                               padding: const EdgeInsets.only(left: 8.0),
          //                               child: Row(
          //                                 mainAxisAlignment: MainAxisAlignment.start,
          //                                 children: [
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //
          //                                     width: MediaQuery.of(context).size.width/3.6,
          //                                     child: Text('4', textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('1-10',  textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('8PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('10:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('07:30PM',  textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 3PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 11:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 10:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                             SizedBox(height: 10,),
          //                             Image.asset("image/Line 4.png",fit: BoxFit.cover, ),
          //                             SizedBox(height: 10,),SizedBox(height: 10,),
          //                             Padding(
          //                               padding: const EdgeInsets.only(left: 8.0),
          //                               child: Row(
          //                                 mainAxisAlignment: MainAxisAlignment.start,
          //                                 children: [
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //
          //                                     width: MediaQuery.of(context).size.width/3.6,
          //                                     child: Text('5', textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('1-10',  textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('8PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('10:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text('07:30PM',  textAlign: TextAlign.center,style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 3PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 11:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                   SizedBox(width: 5,),
          //                                   Container(
          //                                     padding: EdgeInsets.only(left: 20),
          //                                     width: MediaQuery.of(context).size.width/2.4,
          //                                     child: Text(' 10:30PM', textAlign: TextAlign.center, style:
          //                                     Theme.of(context).textTheme.subtitle1!.copyWith(
          //                                       color: Color(0XFF2D2D2D),
          //                                       fontWeight: FontWeight.w400,
          //                                     ),),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                             SizedBox(height: 10,),
          //                             Image.asset("image/Line 4.png",fit: BoxFit.cover, ),
          //                             SizedBox(height: 10,),
          //                           ],
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ):Container(),
          //               ],
          //             ),
          //             // Container()
          //           ):Container();
          //         }
          //       ),
          //     ),


              auctionViewModel.isLoadingForUpCommingAuction?SliverToBoxAdapter(child: LinearProgressIndicator()):

              auctionViewModel.auctionType=="live"?

              auctionViewModel.upcomingAuctionResponse!.result == null? SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.rotate(
                        angle: - pi/ 35.13,
                        child: Image.asset("image/auctionhammer.png",width: 266)),
                    SizedBox(height: 25,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.70,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          children: <TextSpan>[
                            TextSpan(text: 'There is ',style:  Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,),),
                            TextSpan(text: 'No Live Auction', style:  Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,),),
                            TextSpan(text: '\n at this moment',style:  Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,),),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              )    :

                  SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return LiveItem(auctionViewModel.upcomingAuctionResponse!.result!.auctions![index],index);
                    },
                    // 40 list items
                    childCount:auctionViewModel.upcomingAuctionResponse!.result ==null?0:auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length,
                  ),
                ):SliverToBoxAdapter(child: Container()),




              auctionViewModel.isLoadingForUpCommingAuction?SliverToBoxAdapter(child: LinearProgressIndicator()): SliverToBoxAdapter(
                child: Observer(
                  builder: (context) {
                    return  auctionViewModel.auctionType=="upcoming"?Container(
                      child: auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length==0?Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("image/Bitmap1.png"),
                          SizedBox(height: 25,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.70,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                children: <TextSpan>[
                                  TextSpan(text: 'There is ',style:  Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,),),
                                  TextSpan(text: 'No Upcoming Auction', style:  Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,),),
                                  TextSpan(text: '\n at this moment',style:  Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,),),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ):
                      auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length>1? Container(
                        padding: EdgeInsets.all(16),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("5 Days Until Online \nBidding Opens",
                              textAlign: TextAlign.start,
                              style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                color: Color(0xff2d2d2d),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 16,),
                            InkWell(
                              onTap: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
                              },
                              child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width*.65,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [Color(0xffB45156),Color(0xffE74B52),]
                                      ),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5.0,left: 5,top: 12,bottom: 12),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        children: [
                                          Text('ADD TO CALENDER', style:
                                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0XFFFFFFFF),
                                            fontWeight: FontWeight.w600,
                                          ),),
                                          SizedBox(width: 16,),
                                          Image.asset("image/cal.png",height: 25,width: 25,color: Color(0XFFFFFFFF),)
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            ),
                            SizedBox(height: 16,),

                            Container(
                              child: Stack(
                                children: [


                                  Positioned(
                                    top: 54,
                                    child: Container(
                                      height: 500,
                                      width:MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF8F8F8)
                                      ),
                                    ),
                                  ),

                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Image.network("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].image}"),

                                        Container(

                                          child: SizedBox(
                                            width: MediaQuery.of(context).size.width,
                                            child: Wrap(
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              // mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].auctionName}",style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold,

                                                  letterSpacing: 2,
                                                  color: Color(0xff585858),
                                                )),
                                                SizedBox(width: 8,),
                                                Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].auctionName}",style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.normal)),

                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16,),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color(0xffEAEEF2),
                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                          ),
                                          child:  Text("EXPLORE",
                                            textAlign: TextAlign.start,
                                            style:
                                            Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 2
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8,),
                                        Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].displayDate!.split(",")[0].trim()}",style: Theme.of(context).textTheme.headline5!.copyWith(
                                            fontWeight: FontWeight.normal,
                                            color: Theme.of(context).colorScheme.primary,
                                            letterSpacing: 2
                                        )),
                                        SizedBox(height: 8,),
                                        Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![0].displayDate!.split(",")[1].trim()}",style: Theme.of(context).textTheme.subtitle1!.copyWith(color:Color(0xff585858))),
                                      ],
                                    ),
                                  )


                                ],
                              ),
                            ),

                            auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length>2? Container(
                              decoration: BoxDecoration(
                                color: Color(0xffEAEEF2)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 32,horizontal: 4),
                              margin: EdgeInsets.only(top: 32),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Image.network("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![1].image}",height: 120,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(height: 16,),
                                      Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![1].auctionName!}",style: Theme.of(context).textTheme.headline6!.copyWith(color:Colors.black,fontWeight: FontWeight.bold)),
                                      SizedBox(height: 32,),
                                      Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![1].displayDate!.split(",")[0].trim()}",style: Theme.of(context).textTheme.headline5!.copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          letterSpacing: 2
                                      )),
                                      SizedBox(height: 8,),
                                      Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![1].displayDate!.split(",")[1].trim()}",style: Theme.of(context).textTheme.subtitle1!.copyWith(color:Colors.black,)),

                                    ],
                                  ),
                                ],
                              ),
                            ):Container(),


                            auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length>3?

                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                image:  DecorationImage(
                                  image: NetworkImage("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![2].image}"),
                                  fit: BoxFit.fill,
                                  opacity: .2
                                )
                              ),
                              padding: EdgeInsets.symmetric(vertical: 32,horizontal: 4),
                              // margin: EdgeInsets.symmetric(vertical: 32),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  // Image.network("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![2].image}",height: 120,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 16,),
                                      Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![2].auctionName!}",style: Theme.of(context).textTheme.headline6!.copyWith(color:Colors.white,fontWeight: FontWeight.bold)),
                                      SizedBox(height: 32,),
                                      Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![2].displayDate!.split(",")[0].trim()}",style: Theme.of(context).textTheme.headline5!.copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                          letterSpacing: 2
                                      )),
                                      SizedBox(height: 8,),
                                      Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![2].displayDate!.split(",")[1].trim()}",style: Theme.of(context).textTheme.subtitle1!.copyWith(color:Colors.white,)),

                                    ],
                                  ),
                                ],
                              ),
                            ):Container(),

                            auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length>4? Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffF8F8F8)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 32,horizontal: 4),
                              // margin: EdgeInsets.symmetric(vertical: 32),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Image.network("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![3].image}",height: 120,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(height: 16,),
                                      Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![3].auctionName!}",style: Theme.of(context).textTheme.headline6!.copyWith(color:Colors.black,fontWeight: FontWeight.bold)),
                                      SizedBox(height: 32,),
                                      Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![3].displayDate!.split(",")[0].trim()}",style: Theme.of(context).textTheme.headline5!.copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          letterSpacing: 2
                                      )),
                                      SizedBox(height: 8,),
                                      Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![3].displayDate!.split(",")[1].trim()}",style: Theme.of(context).textTheme.subtitle1!.copyWith(color:Colors.black,)),

                                    ],
                                  ),
                                ],
                              ),
                            ):Container(),

                          ],
                        ),
                      ):Container(),
                    ):Container();
                  }
                ),
              ),



              auctionViewModel.isLoadingForUpCommingAuction?SliverToBoxAdapter(child: LinearProgressIndicator()): SliverToBoxAdapter(
                child:   Observer(
                  builder: (context) {
                    print(auctionViewModel.auctionType);
                    return auctionViewModel.auctionType=="past"?
                    Container(
                      child: auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length==0?Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("image/Bitmap1.png"),
                          SizedBox(height: 25,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.70,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                children: <TextSpan>[
                                  TextSpan(text: 'There is ',style:  Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,),),
                                  TextSpan(text: 'No Past Auction', style:  Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,),),
                                  TextSpan(text: '\n at this moment',style:  Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,),),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ):
                      Container(
                        padding: EdgeInsets.all(16),
                        // child: Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Container(
                        //
                        //         child: CustomScrollView(slivers: [
                        //           Column(
                        //             children: [
                        //               Row(
                        //                 mainAxisAlignment: MainAxisAlignment.center,
                        //                 crossAxisAlignment: CrossAxisAlignment.center,
                        //                 children: [
                        //                 Image.asset("image/cal.png",color: Color(0xff80A071),),
                        //                   SizedBox(width: 10,),
                        //                   Text("2022",
                        //                     textAlign: TextAlign.center,
                        //                     style:
                        //                     Theme.of(context).textTheme.headline6!.copyWith(
                        //                       color: Colors.black,
                        //                       fontWeight: FontWeight.w600,
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //               SizedBox(height: 16,)
                        //             ],
                        //           ),
                        //
                        //         ])
                        //     ),
                        //     SizedBox(height: 10,),
                        //     Center(
                        //       child: ElevatedButton(
                        //         style:   ButtonStyle(
                        //             backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                        //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        //                 RoundedRectangleBorder(
                        //                     borderRadius: BorderRadius.circular(20.0),
                        //                     side: BorderSide(color: Color(0xff747474),width: 0.38)
                        //                 )
                        //             )
                        //         ),
                        //         onPressed: (){
                        //         },
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                        //           child: Text('Load More', style:
                        //           Theme.of(context).textTheme.bodyText1!.copyWith(
                        //             color: Color(0XFF2D2D2D),
                        //             fontWeight: FontWeight.w600,
                        //           ),),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ):Container();
                  }
                ),
              ),




              auctionViewModel.isLoadingForUpCommingAuction?SliverToBoxAdapter(child: LinearProgressIndicator()):
              auctionViewModel.upcomingAuctionResponse!.result==null?SliverToBoxAdapter(child: Container()):  auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length>1?
              auctionViewModel.auctionType=="past"?SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),

                      child: Container(
                          color: Color(0xffFFFFFF),
                          height:480.0,
                          margin: const EdgeInsets.only(top:8.0),
                          width:  MediaQuery.of(context).size.width*.8,
                          alignment: Alignment.center,
                          // margin: EdgeInsets.only(bottom: 17),
                          child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 80 / 2.0,bottom: 0),
                                  child: Container(
                                    //replace this Container with your Card
                                    color: Colors.black.withOpacity(0.05),
                                    height:500.0,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 35.0,right: 25),
                                    child: Image.network("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![index].image}",height: 300,width: MediaQuery.of(context).size.width*.8,fit: BoxFit.fill,),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 310,bottom: 0,left: 25.0,right: 25),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 20,),
                                        Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![index].auctionName}",
                                          textAlign: TextAlign.center,
                                          style:
                                          Theme.of(context).textTheme.headline5!.copyWith(
                                            color: Colors.black,
                                            letterSpacing: 1,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![index].auctionDate}",
                                          textAlign: TextAlign.center,
                                          style:
                                          Theme.of(context).textTheme.subtitle1!.copyWith(
                                            color: Color(0xff747474),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Total Sales Value",
                                                  textAlign: TextAlign.center,
                                                  style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(height: 10,),
                                                Text("₹${auctionViewModel.upcomingAuctionResponse!.result!.auctions![index].totalSaleValue}",
                                                  textAlign: TextAlign.center,
                                                  style:
                                                  Theme.of(context).textTheme.headline6!.copyWith(
                                                    color: Theme.of(context).colorScheme.primary,
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
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                                  child: Text('View All', style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0XFF1F2A52),
                                                    decoration: TextDecoration.underline,
                                                    letterSpacing: 1,
                                                    fontWeight: FontWeight.bold,
                                                  ),),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20,),
                                      ],
                                    )
                                ),
                              ]
                          )
                      ),
                    );
                  },
                  // 40 list items
                  childCount: auctionViewModel.upcomingAuctionResponse!.result!.auctions!.length,
                ),
              ):SliverToBoxAdapter(child: Container()):SliverToBoxAdapter(child: Container()),

          SliverToBoxAdapter(
                child:  auctionViewModel.liveAuctionType =="closingschedule"?Container():Container()

         // ElevatedButton(
         //          style:   ButtonStyle(
         //              backgroundColor: MaterialStateProperty.all(Colors.white),
         //              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
         //                  RoundedRectangleBorder(
         //                      borderRadius: BorderRadius.circular(20.0),
         //                      side: BorderSide(color: Color(0xff747474),width: 0.38)
         //                  )
         //              )
         //          ),
         //          onPressed: (){
         //          },
         //          child: Padding(
         //            padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
         //            child: Text('LOAD MORE', style:
         //            Theme.of(context).textTheme.subtitle1!.copyWith(
         //              color: Colors.black,
         //              letterSpacing: 2,
         //              fontWeight: FontWeight.w900,
         //            ),),
         //          ),
         //        ),
              ),


              SliverToBoxAdapter(
                child:   auctionViewModel.liveAuctionType !="closingschedule"?Container(): Observer(
                  builder: (context) {
                    return SizedBox(height: 40,);
                  }
                ),
              ),


                        SliverToBoxAdapter(
                child: auctionViewModel.liveAuctionType =="closingschedule"?Container():  Observer(
                  builder: (context) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                builder: (BuildContext dialogContext)
                                {
                                  return SafeArea(
                                    child: Scaffold(
                                      body: StatefulBuilder(
                                          builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
                                            return Container(
                                                padding: EdgeInsets.all(16),
                                                height: MediaQuery.of(context).size.height,
                                                color: Color(0xffF5F5F5),
                                                child:Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 30,),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.tune_rounded,size: 30,color: Theme.of(context).colorScheme.primary,),
                                                        // Image.asset("image/filter.png",color: Theme.of(context).,),
                                                        SizedBox(width: 8,),
                                                        Text("FILTER BY",
                                                          textAlign: TextAlign.center,
                                                          style:
                                                          Theme.of(context).textTheme.subtitle1!.copyWith(
                                                            color: Color(0xff000000),
                                                            letterSpacing: 1,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Text("RESET",
                                                          textAlign: TextAlign.center,
                                                          style:
                                                          Theme.of(context).textTheme.subtitle1!.copyWith(
                                                            color: Colors.grey,
                                                            letterSpacing: 1,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        // Image.asset("image/sort.png",color: Theme.of(context).colorScheme.primary),

                                                      ],
                                                    ),
                                                    SizedBox(height: 24,),
                                                    Expanded(
                                                      child: Scrollbar(
                                                        interactive: true,
                                                        thumbVisibility: true,
                                                        child: ListView.builder(
                                                          shrinkWrap: true,
                                                          // physics: ScrollPhysics(),
                                                          itemCount: data.length,
                                                          itemBuilder: (BuildContext context, int index) =>
                                                              _buildList(data[index]),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 20,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        ElevatedButton(
                                                          style:   ButtonStyle(
                                                              backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                      side: BorderSide(color: Color(0xff747474),width: 0.38)
                                                                  )
                                                              )
                                                          ),
                                                          onPressed: (){
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(right: 32.0,left: 32,top: 12,bottom: 12),
                                                            child: Text('CLOSE', style:
                                                            Theme.of(context).textTheme.subtitle1!.copyWith(
                                                              color: Colors.black,
                                                              letterSpacing: 1,
                                                              fontWeight: FontWeight.bold,
                                                            ),),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10,),
                                                        Spacer(),
                                                        ElevatedButton(
                                                          style:   ButtonStyle(
                                                              backgroundColor: MaterialStateProperty.all(Color(0XFF8DAB7F)),
                                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                    // side: BorderSide(color: Colors.red)
                                                                  )
                                                              )
                                                          ),
                                                          onPressed: (){
                                                            Navigator.push(context, MaterialPageRoute(builder: (context) => FillterSearchpage()));
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(right: 32.0,left: 32,top: 12,bottom: 12),
                                                            child: Text('APPLY', style:
                                                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                                              color: Colors.white,
                                                              letterSpacing: 1,
                                                              fontWeight: FontWeight.bold,
                                                            ),),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 24,),
                                                  ],
                                                )
                                            );
                                          }
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            color: Color(0xffF4F4F4),
                            padding: EdgeInsets.only(left: 20,top: 12,right: 20,bottom: 12),
                            child: Row(
                              children: [
                                // Image.asset("image/filter.png",color: Colors.grey,height: 24),
                                Icon(Icons.tune_rounded, color: Colors.grey,),
                                SizedBox(width: 8,),
                                Text("FILTER BY",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                              ],
                            ),),
                        ),
                        SizedBox(width: 40,),
                        InkWell(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                                    ),
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        // Image.asset("image/sort.png",color: Theme.of(context).colorScheme.primary),
                                        Text("Sort By",style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                          color: Colors.black,

                                        ),),
                                        SizedBox(height: 16,),
                                        ListTile(
                                          leading: Checkbox(
                                            value: selected,
                                            onChanged: (bool? value){},
                                          ),
                                          title: Text("Contemporary Art", style:
                                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: Checkbox(
                                            value: selected,
                                            onChanged: (bool? value){},
                                          ),
                                          title: Text("M. F. Hussian", style:
                                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: Checkbox(
                                            value: selected,
                                            onChanged: (bool? value){},
                                          ),
                                          title: Text("Antique", style:
                                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: Checkbox(
                                            value: selected,
                                            onChanged: (bool? value){},
                                          ),
                                          title: Text("Impressionist & Modern Art", style:
                                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                              style:   ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20.0),
                                                          side: BorderSide(color: Color(0xff747474),width: 0.38)
                                                      )
                                                  )
                                              ),
                                              onPressed: (){
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 32.0,left: 32,top: 12,bottom: 12),
                                                child: Text('CLOSE', style:
                                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Colors.black,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Spacer(),
                                            ElevatedButton(
                                              style:   ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(Color(0XFF8DAB7F)),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20.0),
                                                        // side: BorderSide(color: Colors.red)
                                                      )
                                                  )
                                              ),
                                              onPressed: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => FillterSearchpage()));
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 32.0,left: 32,top: 12,bottom: 12),
                                                child: Text('APPLY', style:
                                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                                  color: Colors.white,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 24,),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            color: Color(0xffF4F4F4),
                            padding: EdgeInsets.only(left: 20,top:12,right: 20,bottom: 12),
                            child: Row(
                              children: [
                                Icon(Icons.sort,size: 30,color: Colors.grey,),
                                SizedBox(width: 8,),
                                Text("SORT BY",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),),
                        )
                      ],
                    );
                  }
                ),
              ),

                        SliverToBoxAdapter(
                child:   SizedBox(

                    width: MediaQuery.of(context).size.width,
                    child: Footer()),
              ),

                                  SliverToBoxAdapter(
                child:  SizedBox(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                ),
              ),



            ]);
      }
    );







    //
    //   Scaffold(
    //   appBar: NavBar(),
    //   // bottomNavigationBar: CustomBottomAppBar(),
    //   body: Container(
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height*.90,
    //     child: SingleChildScrollView(
    //       child:
    //       Column(
    //         children: [
    //           const SizedBox(height: 16,),
    //           Text("OPULENT COLLECTIBLES",
    //             textAlign: TextAlign.left,
    //             style:
    //             Theme.of(context).textTheme.headline6!.copyWith(
    //               color: Colors.black,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           const SizedBox(height: 16,),
    //           Container(
    //             width: MediaQuery.of(context).size.width*.80,
    //             child: Text("Bid on works you love with auctions. With bidding opening daily, connects collectors like you to art from leading auction houses, nonprofit organizations, and sellers across the globe.",
    //               textAlign: TextAlign.justify,
    //               style:
    //               Theme.of(context).textTheme.bodyText1!.copyWith(
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.w400,
    //               ),
    //             ),
    //           ),
    //           const SizedBox(height: 16,),
    //           Container(
    //             height: 250,
    //             child: Stack(
    //               children: [
    //                 Padding(
    //                   padding: EdgeInsets.only(top: 20,bottom: 0),
    //                   child: Container(
    //                     //replace this Container with your Card
    //                     color: Theme.of(context).colorScheme.onPrimary,
    //                     height: 250.0,
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(left: 25.0,right: 25),
    //                   child: Image.asset("image/Bitmap.png"),
    //                 ),
    //
    //                 Padding(
    //                   padding: EdgeInsets.only(top: 400 / 2.0,bottom: 0,left: 25.0,right: 25),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       Image.asset("image/calender.png",color: Colors.white,height: 22,),
    //                       // Icon(Icons.calendar_today,size: 22,color: Color(0xff80A071),),
    //                       SizedBox(width: 20,),
    //                       Text("25th-27th Aug, 2022",
    //                         textAlign: TextAlign.center,
    //                         style:
    //                         Theme.of(context).textTheme.bodyText1!.copyWith(
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.w400,
    //                         ),
    //                       ),
    //                       Spacer(),
    //                       Image.asset("image/share.png",height: 32,),
    //
    //                       SizedBox(width: 20,),
    //                       Image.asset("image/save.png",height: 32,),
    //                       // SizedBox(width: 10,),
    //                     ],
    //                   )
    //                 ),
    //
    //                 // Column(
    //                 //   mainAxisAlignment: MainAxisAlignment.end,
    //                 //   crossAxisAlignment: CrossAxisAlignment.end,
    //                 //   children: [
    //                 //     Divider(color: Color(0xff466D33),thickness: 1,),
    //                 //   ],
    //                 // ),
    //               ],
    //             ),
    //           ),
    //
    //           Container(
    //             margin: EdgeInsets.only(top:1),
    //             color: Theme.of(context).colorScheme.onPrimary,
    //             child: DefaultTabController(
    //               length: 3,
    //
    //               initialIndex: widget.auction=="live"?0:widget.auction=="upcoming"?1:2,
    //               child:  TabBar(
    //                 onTap: (index) {
    //                   setState(() {
    //
    //                     if(index==0) { tabColor =  Color(0xffE74B52);
    //                     auctionViewModel.auctionType="live";}
    //                     if(index==1) {tabColor =  Color(0xffE74B52);
    //                     auctionViewModel.auctionType="upcoming";}
    //                     if(index==2) {tabColor =  Color(0xffE74B52);
    //                     auctionViewModel.auctionType="past";}
    //                   });
    //                   print(index);
    //                 },
    //                 isScrollable: true,
    //                 indicator: BoxDecoration(
    //                     color: tabColor
    //                 ),
    //                 padding: EdgeInsets.all(0),
    //                 unselectedLabelColor: Color(0xffFFFFFF).withOpacity(0.6),
    //                 labelColor: const Color(0xFFFFFFFF),
    //
    //                 unselectedLabelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
    //                   color: Colors.grey,
    //                   fontWeight: FontWeight.w400,),
    //                 labelStyle:Theme.of(context).textTheme.subtitle1!.copyWith(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold,),
    //                 tabs: [
    //                   Tab(
    //                       text: "LIVE AUCTION",
    //
    //
    //                   ),
    //                   Tab(
    //                       text: "UPCOMING AUCTION"
    //                   ),
    //                   Tab(
    //                       text: "PAST AUCTION"
    //                   ),
    //
    //                 ],
    //               ),
    //
    //             ),
    //           ),
    //           const SizedBox(height: 16,),
    //
    //           auctionViewModel.auctionType=="live"?Container(
    //             child: count==0?Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 Image.asset("image/Bitmap1.png"),
    //                 SizedBox(height: 25,),
    //             SizedBox(
    //               width: MediaQuery.of(context).size.width*.70,
    //               child: RichText(
    //                 textAlign: TextAlign.center,
    //                 text: TextSpan(
    //                   // Note: Styles for TextSpans must be explicitly defined.
    //                   // Child text spans will inherit styles from parent
    //                   children: <TextSpan>[
    //                     TextSpan(text: 'There is ',style:  Theme.of(context).textTheme.headline6!.copyWith(
    //                       color: Colors.black,
    //                       fontWeight: FontWeight.w400,),),
    //                     TextSpan(text: 'No Live Auction', style:  Theme.of(context).textTheme.headline6!.copyWith(
    //                       color: Colors.black,
    //                       fontWeight: FontWeight.w600,),),
    //                     TextSpan(text: '\n at this moment',style:  Theme.of(context).textTheme.headline6!.copyWith(
    //                       color: Colors.black,
    //                       fontWeight: FontWeight.w400,),),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //
    //             ],
    //             ):
    //             Column(
    //               children: [
    //                 Container(
    //                   color: Color(0xffFFFFFF),
    //                   padding: EdgeInsets.only(left: 10,right: 10),
    //                   child: DefaultTabController(
    //                     length: 4,
    //                     child:  DecoratedBox(
    //                       decoration: BoxDecoration(
    //                         //This is for background color
    //                         color: Colors.white.withOpacity(0.0),
    //
    //                         //This is for bottom border that is needed
    //                         border: Border(
    //                             bottom: BorderSide(color: Color(0xffDFDFDF), width: 2)),
    //                       ),
    //                       child: TabBar(
    //                         onTap: (index) {
    //                           setState(() {
    //
    //                             if(index==0) { tabColor =  Color(0xffE74B52);
    //                             liveAuctionType="browselist";}
    //                             if(index==1) {tabColor =   Color(0xffE74B52);
    //                             liveAuctionType="mygallery";}
    //                             if(index==2) {tabColor =   Color(0xffE74B52);
    //                             liveAuctionType="review";}
    //                             if(index==3) {tabColor =   Color(0xffE74B52);
    //                             liveAuctionType="closingschedule";}
    //                           });
    //                           print(index);
    //                         },
    //                         indicator: UnderlineTabIndicator(
    //                           borderSide:
    //                           BorderSide(color:  Color(0xffE74B52), width: 2.0),
    //                         ),
    //                         isScrollable: true,
    //                         padding: EdgeInsets.all(0),
    //                         labelPadding:  EdgeInsets.only(right: 10,left: 5),
    //                         unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.59),
    //                         labelColor: const Color(0xFF2D2D2D),
    //                         labelStyle:
    //                         Theme.of(context).textTheme.bodyText1!.copyWith(
    //                           color: Color(0xff2D2D2D),
    //                           fontWeight: FontWeight.w600,),
    //                         tabs: [
    //                           Tab(
    //                             text: "BROWSE LOTS",
    //                           ),
    //                           Tab(
    //                               text: "MY AUCTION GALLERY"
    //                           ),
    //                           Tab(
    //                               text: "LIVE AUCTION REVIEW"
    //                           ),
    //                           Tab(
    //                               text: "CLOSING SCHEDULE"
    //                           ),
    //
    //                         ],
    //                       ),
    //                     ),
    //
    //                   ),
    //                 ),
    //                 SizedBox(height: 20,),
    //                 liveAuctionType=="browselist" ||liveAuctionType=="review" ||liveAuctionType=="mygallery" ?Container(
    //                     height: 500,
    //                     child: CustomScrollView(slivers: [
    //                       SliverPinnedHeader(
    //                           child: Row(
    //                             mainAxisAlignment: MainAxisAlignment.end,
    //                             crossAxisAlignment: CrossAxisAlignment.end,
    //                             children: [
    //                               Icon(Icons.menu_sharp,size: 30,),
    //                               SizedBox(width: 10,),
    //                               Icon(Icons.dashboard_outlined,size: 30,),
    //                               SizedBox(width: 10,),
    //                             ],
    //                           )),
    //                       SliverAnimatedPaintExtent(
    //                         duration: const Duration(milliseconds: 150),
    //                         child: SliverList(
    //                           delegate: SliverChildBuilderDelegate(
    //                                 (BuildContext context, int index) {
    //                               return Padding(
    //                                 padding: const EdgeInsets.all(15.0),
    //                                 child: Container(
    //                                     color: Color(0xffFFFFFF),
    //                                     height:550,
    //                                     alignment: Alignment.center,
    //                                     child: Stack(
    //                                       children: [
    //                                         Padding(
    //                                           padding: EdgeInsets.only(top: 150 / 2.0,bottom: 0),
    //                                           child: Container(
    //                                             //replace this Container with your Card
    //                                             color: Color(0xffF9F9F9),
    //                                             height:500.0,
    //                                           ),
    //                                         ),
    //                                         InkWell(
    //                                           onTap: (){
    //                                             Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
    //                                           },
    //                                           child: Padding(
    //                                             padding: const EdgeInsets.only(left: 25.0,right: 25),
    //                                             child: Image.asset("image/Bitmap6.png",height: 250,
    //                                             width: MediaQuery.of(context).size.width*.65,
    //                                               fit: BoxFit.contain,
    //
    //                                             ),
    //                                           ),
    //                                         ),
    //                                         Padding(
    //                                             padding: EdgeInsets.only(top: 250,bottom: 0,left: 25.0,right: 25),
    //                                             child:Column(
    //                                               mainAxisAlignment: MainAxisAlignment.start,
    //                                               crossAxisAlignment: CrossAxisAlignment.start,
    //                                               children: [
    //                                                 SizedBox(width: 20,),
    //                                                 Text("JAMINI ROY",
    //                                                   textAlign: TextAlign.center,
    //                                                   style:
    //                                                   Theme.of(context).textTheme.headline6!.copyWith(
    //                                                     color: Colors.black,
    //                                                     letterSpacing: 2,
    //                                                     fontWeight: FontWeight.bold,
    //                                                   ),
    //                                                 ),
    //                                                 SizedBox(height: 10,),
    //                                                 Text("Mother & Child",
    //                                                   textAlign: TextAlign.center,
    //                                                   style:
    //                                                   Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                                     color: Color(0xff747474),
    //                                                     fontWeight: FontWeight.w400,
    //                                                   ),
    //                                                 ),
    //                                                 SizedBox(height: 20,),
    //                                                 Row(
    //                                                   mainAxisAlignment: MainAxisAlignment.start,
    //                                                   crossAxisAlignment: CrossAxisAlignment.start,
    //                                                   children: [
    //                                                     Column(
    //                                                       mainAxisAlignment: MainAxisAlignment.start,
    //                                                       crossAxisAlignment: CrossAxisAlignment.start,
    //                                                       children: [
    //                                                         Text("Estimate Value ",
    //                                                           textAlign: TextAlign.center,
    //                                                           style:
    //                                                           Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                                             color: Color(0xff747474),
    //                                                             fontWeight: FontWeight.w400,
    //                                                           ),
    //                                                         ),
    //                                                         SizedBox(height: 10,),
    //                                                         Text("₹50,000- ₹75,000",
    //                                                           textAlign: TextAlign.center,
    //                                                           style:
    //                                                           Theme.of(context).textTheme.bodyText1!.copyWith(
    //                                                             color: Color(0xff202232),
    //                                                             fontWeight: FontWeight.bold,
    //                                                           ),
    //                                                         ),
    //                                                       ],
    //                                                     ),
    //                                                     Spacer(),
    //                                                     Column(
    //                                                       mainAxisAlignment: MainAxisAlignment.start,
    //                                                       crossAxisAlignment: CrossAxisAlignment.start,
    //                                                       children: [
    //                                                         Text("Bid Closing in",
    //                                                           textAlign: TextAlign.center,
    //                                                           style:
    //                                                           Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                                             color: Color(0xff747474),
    //                                                             fontWeight: FontWeight.w400,
    //                                                           ),
    //                                                         ),
    //                                                         SizedBox(height: 10,),
    //                                                         Row(
    //                                                           children: [
    //                                                             Container(
    //                                                                 decoration: BoxDecoration(
    //                                                                   borderRadius: BorderRadius.circular(8),
    //                                                                   color: Color(0xff8C9FB1),
    //                                                                 ),
    //                                                                 padding: EdgeInsets.all(4),
    //                                                                 child:Text("02",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
    //                                                             ),
    //                                                             Container(
    //                                                                 // color: Colors.black,
    //                                                                 padding: EdgeInsets.all(4),
    //                                                                 child:Text(":")
    //                                                             ),
    //                                                             Container(
    //                                                                 decoration: BoxDecoration(
    //                                                                   borderRadius: BorderRadius.circular(8),
    //                                                                     color: Color(0xff8C9FB1),
    //                                                                 ),
    //
    //                                                                 padding: EdgeInsets.all(4),
    //                                                                 child:Text("14",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
    //                                                             ),
    //
    //                                                             Container(
    //                                                                 // color: Colors.black,
    //                                                                 padding: EdgeInsets.all(4),
    //                                                                 child:Text(":")
    //                                                             ),
    //
    //                                                             Container(
    //                                                                 decoration: BoxDecoration(
    //                                                                   borderRadius: BorderRadius.circular(8),
    //                                                                   color: Color(0xff8C9FB1),
    //                                                                 ),
    //                                                                 padding: EdgeInsets.all(4),
    //                                                                 child:Text("59",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
    //                                                             ),
    //                                                           ],
    //                                                         ),
    //                                                       ],
    //                                                     ),
    //                                                   ],
    //                                                 ),
    //                                                 SizedBox(height: 20,),
    //                                                 Row(
    //                                                   mainAxisAlignment: MainAxisAlignment.start,
    //                                                   crossAxisAlignment: CrossAxisAlignment.start,
    //                                                   children: [
    //                                                     Column(
    //                                                       mainAxisAlignment: MainAxisAlignment.start,
    //                                                       crossAxisAlignment: CrossAxisAlignment.start,
    //                                                       children: [
    //                                                         Text("Current Bid",
    //                                                           textAlign: TextAlign.center,
    //                                                           style:
    //                                                           Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                                             color: Color(0xff747474),
    //                                                             fontWeight: FontWeight.w400,
    //                                                           ),
    //                                                         ),
    //                                                         SizedBox(height: 10,),
    //                                                         Text("₹50,000",
    //                                                           textAlign: TextAlign.center,
    //                                                           style:
    //                                                           Theme.of(context).textTheme.bodyText1!.copyWith(
    //                                                             color: Color(0xff202232),
    //                                                             fontWeight: FontWeight.w600,
    //                                                           ),
    //                                                         ),
    //                                                       ],
    //                                                     ),
    //                                                     Spacer(),
    //                                                     Column(
    //                                                       mainAxisAlignment: MainAxisAlignment.start,
    //                                                       crossAxisAlignment: CrossAxisAlignment.start,
    //                                                       children: [
    //                                                         Text("Next Valid Bid",
    //                                                           textAlign: TextAlign.center,
    //                                                           style:
    //                                                           Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                                             color: Color(0xff747474),
    //                                                             fontWeight: FontWeight.w400,
    //                                                           ),
    //                                                         ),
    //                                                         SizedBox(height: 10,),
    //                                                         Text("₹75,000",
    //                                                           textAlign: TextAlign.center,
    //                                                           style:
    //                                                           Theme.of(context).textTheme.bodyText1!.copyWith(
    //                                                             color: Theme.of(context).colorScheme.primary,
    //                                                             fontWeight: FontWeight.w600,
    //                                                           ),
    //                                                         ),
    //                                                       ],
    //                                                     ),
    //                                                   ],
    //                                                 ),
    //                                                 SizedBox(height: 20,),
    //                                                 Row(
    //                                                   mainAxisAlignment: MainAxisAlignment.end,
    //                                                   children: [
    //                                                     ElevatedButton(
    //                                                       style:   ButtonStyle(
    //                                                           backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
    //                                                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                                                               RoundedRectangleBorder(
    //                                                                   borderRadius: BorderRadius.circular(20.0),
    //                                                                   side: BorderSide(color: Color(0xff747474),width: 0.38)
    //                                                               )
    //                                                           )
    //                                                       ),
    //                                                       onPressed: (){
    //                                                       },
    //                                                       child: Padding(
    //                                                         padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
    //                                                         child: Text('PROXY BID', style:
    //                                                         Theme.of(context).textTheme.bodyText1!.copyWith(
    //                                                           color: Color(0XFF2D2D2D),
    //                                                           fontWeight: FontWeight.bold,
    //                                                         ),),
    //                                                       ),
    //                                                     ),
    //                                                     SizedBox(width: 10,),
    //                                                     InkWell(
    //                                                       onTap: (){
    //                                                         // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
    //                                                       },
    //                                                       child: Container(
    //                                                         height: 50,
    //                                                         // width: 150,
    //                                                         decoration: BoxDecoration(
    //                                                             gradient: LinearGradient(
    //                                                                 colors: [Color(0xffE74B52),Color(0xffE74B52),]
    //                                                             ),
    //                                                             // color: Color(0xff466D33),
    //                                                             borderRadius: BorderRadius.circular(24)
    //                                                         ),
    //                                                         child: Center(
    //                                                           child: Padding(
    //                                                           padding: const EdgeInsets.only(right: 32.0,left: 32,top: 12,bottom: 12),
    //                                                           child: Text('BID NOW', style:
    //                                                           Theme.of(context).textTheme.bodyText1!.copyWith(
    //                                                             color: Color(0XFFFFFFFF),
    //                                                             fontWeight: FontWeight.bold,
    //                                                           ),),
    //                                                       ),
    //                                                         ),
    //                                                     ),),
    //                                                   ],
    //                                                 ),
    //                                                 SizedBox(height: 8,),
    //                                               ],
    //                                             )
    //                                         ),
    //
    //                                         Positioned(
    //                                           right: 16,
    //                                           top: 50,
    //                                           child: Column(
    //                                             children: [
    //                                                Container(
    //
    //
    //                                                  child: Text("Lot 01"),
    //                                                  decoration: BoxDecoration(
    //                                                    borderRadius: BorderRadius.circular(16),
    //                                                    color: Colors.lightBlueAccent.withOpacity(.2),
    //
    //                                                  ),
    //                                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
    //
    //                                                ),
    //
    //                                               SizedBox(height:12),
    //                                               Container(
    //                                                 decoration: BoxDecoration(
    //                                                     borderRadius: BorderRadius.circular(16),
    //                                                     color: Color(0xffEAF1DB)
    //
    //                                                 ),
    //                                                   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
    //                                                 child: Text("5 BIDS"),
    //
    //                                               ),
    //                                               SizedBox(height:12),
    //                                               Icon(Icons.favorite_border,color: Colors.grey,),
    //                                               SizedBox(height:12),
    //                                               Icon(Icons.open_in_full,color: Colors.grey,),
    //                                               SizedBox(height:12),
    //                                               // Container(
    //                                               //   padding: EdgeInsets.all(16),
    //                                               //   decoration: BoxDecoration(
    //                                               //     color:  Colors.lightBlueAccent.withOpacity(.2),
    //                                               //     borderRadius: BorderRadius.circular(32)
    //                                               //
    //                                               //   ),
    //                                               // )
    //                                               Image.asset("image/earth.png",height: 50,)
    //                                             ],
    //                                           ),
    //                                         )
    //
    //                                       ],
    //                                     )
    //                                 ),
    //                               );
    //                             },
    //                             // 40 list items
    //                             childCount: 3,
    //                           ),
    //                         ),
    //                       ),
    //                     ])
    //                 ):Container(),
    //                 liveAuctionType=="closingschedule"?Container(
    //                   padding: EdgeInsets.all(16),
    //                   child: Column(
    //                     children: [
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Image.asset("image/Vector (21).png",color: Theme.of(context).colorScheme.primary,),
    //                           SizedBox(width: 10,),
    //                           Container(
    //                             width: MediaQuery.of(context).size.width*.8,
    //                             child: Text("CLOSING SCHEDULE FOR OPULENT COLLECTIBLES, JULY 31, 2022",
    //                               textAlign: TextAlign.start,
    //                               style:
    //                               Theme.of(context).textTheme.headline6!.copyWith(
    //                                 color: Colors.black,
    //                                 fontWeight: FontWeight.w500,
    //                                 letterSpacing: 2
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(height: 20,),
    //                       Container(
    //                         width: MediaQuery.of(context).size.width*.9,
    //                         child: Text("Auction Closing \nFor your convenience, especially if you are bidding on multiple lots are scheduled to close at different times on July 31, 2022. \n\nPre-determined groups of lots will close according to the bid-closing schedule unless a bid is recorded within a span of 3 minutes prior to the lot's scheduled closing time. In this case, the lot closing time will be extended by 3 minutes from the time of the last bid. If this time extension takes place, bidding on any lot will only end if there is no bid recorded for a span of 3 minutes. Bidders are requested to refresh the page for updates on latest bids and time extension if any. ",
    //                           textAlign: TextAlign.start,
    //                           style:
    //                           Theme.of(context).textTheme.bodyText1!.copyWith(
    //                               color: Colors.black,
    //                               fontWeight: FontWeight.w400,
    //                               letterSpacing: 1
    //                           ),
    //                         ),
    //                       ),
    //                       SizedBox(height: 20,),
    //                       Container(
    //                         width: MediaQuery.of(context).size.width*.9,
    //                         child: Text("Lots have been allotted into groups, and the closing schedule for the various groups is follows:",textAlign: TextAlign.start,
    //                           style:
    //                           Theme.of(context).textTheme.subtitle1!.copyWith(
    //                               color: Colors.black,
    //                               fontWeight: FontWeight.bold,
    //                               letterSpacing: 1
    //                           ),
    //                         ),
    //                       ),
    //                       SizedBox(height: 20,),
    //                       Container(
    //                         child: Scrollbar(
    //                           scrollbarOrientation: ScrollbarOrientation.bottom,
    //                           interactive: true,
    //
    //                           child: SingleChildScrollView(
    //                             scrollDirection: Axis.horizontal,
    //                             child: Column(
    //
    //                               children: [
    //                                 Row(
    //                                   children: [
    //                                     Container(
    //                                       height: 55,
    //                                       padding: EdgeInsets.all(15),
    //                                       width: MediaQuery.of(context).size.width/3.6,
    //                                       decoration: BoxDecoration(
    //                                           color: Color(0xffEAEEF2),
    //                                           image: DecorationImage(
    //                                             image: AssetImage("image/maskbtn.png",),
    //                                             fit: BoxFit.fill
    //                                           )
    //                                       ),
    //                                       child: Row(
    //                                         mainAxisAlignment: MainAxisAlignment.center,
    //                                         crossAxisAlignment: CrossAxisAlignment.center,
    //                                         children: [
    //
    //                                           Text('GROUP', style:
    //                                           Theme.of(context).textTheme.caption!.copyWith(
    //                                             color: Color(0XFF2D2D2D),
    //                                             fontWeight: FontWeight.w600,
    //                                           ),),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                     SizedBox(width: 5,),
    //                                     Container(
    //                                       height: 55,
    //                                       padding: EdgeInsets.all(15),
    //                                       width: MediaQuery.of(context).size.width/2.4,
    //                                       decoration: BoxDecoration(
    //                                           color: Color(0xffEAEEF2),
    //                                           image: DecorationImage(
    //                                               image: AssetImage("image/maskbtn.png",),
    //                                               fit: BoxFit.fill
    //                                           )
    //                                       ),
    //                                       child: Row(
    //                                         mainAxisAlignment: MainAxisAlignment.center,
    //                                         crossAxisAlignment: CrossAxisAlignment.center,
    //                                         children: [
    //
    //                                           Text('NO.OF LOTS', style:
    //                                           Theme.of(context).textTheme.caption!.copyWith(
    //                                             color: Color(0XFF2D2D2D),
    //                                             fontWeight: FontWeight.w600,
    //                                           ),),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                     Container(
    //                                       height: 60,
    //                                       padding: EdgeInsets.all(10),
    //                                       width: MediaQuery.of(context).size.width/2.4,
    //                                       decoration: BoxDecoration(
    //                                           color: Color(0xffEAEEF2),
    //                                           image: DecorationImage(
    //                                               image: AssetImage("image/maskbtn.png",),
    //                                               fit: BoxFit.fill
    //                                           )
    //                                       ),
    //                                       child: Row(
    //                                         mainAxisAlignment: MainAxisAlignment.center,
    //                                         crossAxisAlignment: CrossAxisAlignment.center,
    //                                         children: [
    //
    //                                           Column(
    //                                             children: [
    //                                               Text('CLOSING TIME', style:
    //                                               Theme.of(context).textTheme.caption!.copyWith(
    //                                                 color: Color(0XFF2D2D2D),
    //                                                 fontWeight: FontWeight.w600,
    //                                               ),),
    //                                               Text('IST', style:
    //                                               Theme.of(context).textTheme.caption!.copyWith(
    //                                                 color: Color(0XFF2D2D2D),
    //                                                 fontWeight: FontWeight.w400,
    //                                               ),),
    //                                             ],
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                     Container(
    //                                       height: 60,
    //                                       padding: EdgeInsets.all(10),
    //                                       width: MediaQuery.of(context).size.width/2.4,
    //                                       decoration: BoxDecoration(
    //                                           color: Color(0xffEAEEF2),
    //                                           image: DecorationImage(
    //                                               image: AssetImage("image/maskbtn.png",),
    //                                               fit: BoxFit.fill
    //                                           )
    //                                       ),
    //                                       child: Row(
    //                                         mainAxisAlignment: MainAxisAlignment.center,
    //                                         crossAxisAlignment: CrossAxisAlignment.center,
    //                                         children: [
    //
    //                                           Column(
    //                                             children: [
    //                                               Text('CLOSING TIME', style:
    //                                               Theme.of(context).textTheme.caption!.copyWith(
    //                                                 color: Color(0XFF2D2D2D),
    //                                                 fontWeight: FontWeight.w600,
    //                                               ),),
    //                                               Text('US Eastern Time', style:
    //                                               Theme.of(context).textTheme.caption!.copyWith(
    //                                                 color: Color(0XFF2D2D2D),
    //                                                 fontWeight: FontWeight.w400,
    //                                               ),),
    //                                             ],
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                     Container(
    //                                       height: 60,
    //                                       padding: EdgeInsets.all(10),
    //                                       width: MediaQuery.of(context).size.width/2.4,
    //                                       decoration: BoxDecoration(
    //                                           color: Color(0xffEAEEF2),
    //                                           image: DecorationImage(
    //                                               image: AssetImage("image/maskbtn.png",),
    //                                               fit: BoxFit.fill
    //                                           )
    //                                       ),
    //                                       child: Row(
    //                                         mainAxisAlignment: MainAxisAlignment.center,
    //                                         crossAxisAlignment: CrossAxisAlignment.center,
    //                                         children: [
    //
    //                                           Column(
    //                                             children: [
    //                                               Text('CLOSING TIME', style:
    //                                               Theme.of(context).textTheme.caption!.copyWith(
    //                                                 color: Color(0XFF2D2D2D),
    //                                                 fontWeight: FontWeight.w600,
    //                                               ),),
    //                                               Text('US Western Time', style:
    //                                               Theme.of(context).textTheme.caption!.copyWith(
    //                                                 color: Color(0XFF2D2D2D),
    //                                                 fontWeight: FontWeight.w400,
    //                                               ),),
    //                                             ],
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                     Container(
    //                                       height: 60,
    //                                       padding: EdgeInsets.all(10),
    //                                       width: MediaQuery.of(context).size.width/2.4,
    //                                       decoration: BoxDecoration(
    //                                           color: Color(0xffEAEEF2),
    //                                           image: DecorationImage(
    //                                               image: AssetImage("image/maskbtn.png",),
    //                                               fit: BoxFit.fill
    //                                           )
    //                                       ),
    //                                       child: Row(
    //                                         mainAxisAlignment: MainAxisAlignment.center,
    //                                         crossAxisAlignment: CrossAxisAlignment.center,
    //                                         children: [
    //
    //                                           Column(
    //                                             children: [
    //                                               Text('CLOSING TIME', style:
    //                                               Theme.of(context).textTheme.caption!.copyWith(
    //                                                 color: Color(0XFF2D2D2D),
    //                                                 fontWeight: FontWeight.w600,
    //                                               ),),
    //                                               Text('UK', style:
    //                                               Theme.of(context).textTheme.caption!.copyWith(
    //                                                 color: Color(0XFF2D2D2D),
    //                                                 fontWeight: FontWeight.w400,
    //                                               ),),
    //                                             ],
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                     Container(
    //                                       height: 60,
    //                                       padding: EdgeInsets.all(10),
    //                                       width: MediaQuery.of(context).size.width/2.4,
    //                                       decoration: BoxDecoration(
    //                                           color: Color(0xffEAEEF2),
    //                                           image: DecorationImage(
    //                                               image: AssetImage("image/maskbtn.png",),
    //                                               fit: BoxFit.fill
    //                                           )
    //                                       ),
    //                                       child: Row(
    //                                         mainAxisAlignment: MainAxisAlignment.center,
    //                                         crossAxisAlignment: CrossAxisAlignment.center,
    //                                         children: [
    //
    //                                           Column(
    //                                             children: [
    //                                               Text('CLOSING TIME', style:
    //                                               Theme.of(context).textTheme.caption!.copyWith(
    //                                                 color: Color(0XFF2D2D2D),
    //                                                 fontWeight: FontWeight.w600,
    //                                               ),),
    //                                               Text('Japan', style:
    //                                               Theme.of(context).textTheme.caption!.copyWith(
    //                                                 color: Color(0XFF2D2D2D),
    //                                                 fontWeight: FontWeight.w400,
    //                                               ),),
    //                                             ],
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                     Container(
    //                                       height: 60,
    //                                       padding: EdgeInsets.all(10),
    //                                       width: MediaQuery.of(context).size.width/2.4,
    //                                       decoration: BoxDecoration(
    //                                           color: Color(0xffEAEEF2),
    //                                           image: DecorationImage(
    //                                               image: AssetImage("image/maskbtn.png",),
    //                                               fit: BoxFit.fill
    //                                           )
    //                                       ),
    //                                       child: Row(
    //                                         mainAxisAlignment: MainAxisAlignment.center,
    //                                         crossAxisAlignment: CrossAxisAlignment.center,
    //                                         children: [
    //
    //                                           Column(
    //                                             children: [
    //                                               Text('CLOSING TIME', style:
    //                                               Theme.of(context).textTheme.caption!.copyWith(
    //                                                 color: Color(0XFF2D2D2D),
    //                                                 fontWeight: FontWeight.w600,
    //                                               ),),
    //                                               Text('Hongkong', style:
    //                                               Theme.of(context).textTheme.caption!.copyWith(
    //                                                 color: Color(0XFF2D2D2D),
    //                                                 fontWeight: FontWeight.w400,
    //                                               ),),
    //                                             ],
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 SizedBox(height: 10,),
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(left: 8.0),
    //                                   child: Row(
    //                                     mainAxisAlignment: MainAxisAlignment.start,
    //                                     children: [
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //
    //                                         width: MediaQuery.of(context).size.width/3.6,
    //                                         child: Text('1', textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('1-10',  textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('8PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('10:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                     SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('07:30PM',  textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 3PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 11:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 10:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 SizedBox(height: 10,),
    //                                 Image.asset("image/Line 4.png",fit: BoxFit.cover, ),
    //                                 SizedBox(height: 10,),SizedBox(height: 10,),
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(left: 8.0),
    //                                   child: Row(
    //                                     mainAxisAlignment: MainAxisAlignment.start,
    //                                     children: [
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //
    //                                         width: MediaQuery.of(context).size.width/3.6,
    //                                         child: Text('2', textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('1-10',  textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('8PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('10:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                     SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('07:30PM',  textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 3PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 11:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 10:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 SizedBox(height: 10,),
    //                                 Image.asset("image/Line 4.png",fit: BoxFit.cover, ),
    //                                 SizedBox(height: 10,),SizedBox(height: 10,),
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(left: 8.0),
    //                                   child: Row(
    //                                     mainAxisAlignment: MainAxisAlignment.start,
    //                                     children: [
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //
    //                                         width: MediaQuery.of(context).size.width/3.6,
    //                                         child: Text('3', textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('1-10',  textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('8PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('10:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                     SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('07:30PM',  textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 3PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 11:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 10:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 SizedBox(height: 10,),
    //                                 Image.asset("image/Line 4.png",fit: BoxFit.cover, ),
    //                                 SizedBox(height: 10,),SizedBox(height: 10,),
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(left: 8.0),
    //                                   child: Row(
    //                                     mainAxisAlignment: MainAxisAlignment.start,
    //                                     children: [
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //
    //                                         width: MediaQuery.of(context).size.width/3.6,
    //                                         child: Text('4', textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('1-10',  textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('8PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('10:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                     SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('07:30PM',  textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 3PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 11:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 10:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 SizedBox(height: 10,),
    //                                 Image.asset("image/Line 4.png",fit: BoxFit.cover, ),
    //                                 SizedBox(height: 10,),SizedBox(height: 10,),
    //                                 Padding(
    //                                   padding: const EdgeInsets.only(left: 8.0),
    //                                   child: Row(
    //                                     mainAxisAlignment: MainAxisAlignment.start,
    //                                     children: [
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //
    //                                         width: MediaQuery.of(context).size.width/3.6,
    //                                         child: Text('5', textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('1-10',  textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('8PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('10:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                     SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text('07:30PM',  textAlign: TextAlign.center,style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 3PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 11:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                       SizedBox(width: 5,),
    //                                       Container(
    //                                         padding: EdgeInsets.only(left: 20),
    //                                         width: MediaQuery.of(context).size.width/2.4,
    //                                         child: Text(' 10:30PM', textAlign: TextAlign.center, style:
    //                                         Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                           color: Color(0XFF2D2D2D),
    //                                           fontWeight: FontWeight.w400,
    //                                         ),),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 SizedBox(height: 10,),
    //                                 Image.asset("image/Line 4.png",fit: BoxFit.cover, ),
    //                                 SizedBox(height: 10,),
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ):Container(),
    //               ],
    //             ),
    //           ):Container(),
    //           auctionViewModel.auctionType=="upcoming"?Container(
    //             child: count==0?Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 Image.asset("image/Bitmap1.png"),
    //                 SizedBox(height: 25,),
    //             SizedBox(
    //               width: MediaQuery.of(context).size.width*.70,
    //               child: RichText(
    //                 textAlign: TextAlign.center,
    //                 text: TextSpan(
    //                   // Note: Styles for TextSpans must be explicitly defined.
    //                   // Child text spans will inherit styles from parent
    //                   children: <TextSpan>[
    //                     TextSpan(text: 'There is ',style:  Theme.of(context).textTheme.headline6!.copyWith(
    //                       color: Colors.black,
    //                       fontWeight: FontWeight.w400,),),
    //                     TextSpan(text: 'No Upcoming Auction', style:  Theme.of(context).textTheme.headline6!.copyWith(
    //                       color: Colors.black,
    //                       fontWeight: FontWeight.w600,),),
    //                     TextSpan(text: '\n at this moment',style:  Theme.of(context).textTheme.headline6!.copyWith(
    //                       color: Colors.black,
    //                       fontWeight: FontWeight.w400,),),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //
    //             ],
    //             ):
    //             Container(
    //               padding: EdgeInsets.all(16),
    //               color: Colors.white,
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text("5 Days Until Online \nBidding Opens",
    //                     textAlign: TextAlign.start,
    //                     style:
    //                     Theme.of(context).textTheme.headline5!.copyWith(
    //                       color: Color(0xff2d2d2d),
    //                       fontWeight: FontWeight.w400,
    //                     ),
    //                   ),
    //                   SizedBox(height: 16,),
    //                   InkWell(
    //                     onTap: (){
    //                       // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
    //                     },
    //                     child: Container(
    //                         height: 50,
    //                         width: MediaQuery.of(context).size.width*.65,
    //                         decoration: BoxDecoration(
    //                             gradient: LinearGradient(
    //                                 colors: [Color(0xffB45156),Color(0xffE74B52),]
    //                             ),
    //                             borderRadius: BorderRadius.circular(20)
    //                         ),
    //                         child: Padding(
    //                           padding: const EdgeInsets.only(right: 5.0,left: 5,top: 12,bottom: 12),
    //                           child: Center(
    //                             child: Row(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //
    //                                  children: [
    //                                 Text('ADD TO CALENDER', style:
    //                                 Theme.of(context).textTheme.bodyText1!.copyWith(
    //                                   color: Color(0XFFFFFFFF),
    //                                   fontWeight: FontWeight.w600,
    //                                 ),),
    //                                 SizedBox(width: 16,),
    //                                 Image.asset("image/cal.png",height: 25,width: 25,color: Color(0XFFFFFFFF),)
    //                               ],
    //                             ),
    //                           ),
    //                         )
    //                     ),
    //                   ),
    //                   SizedBox(height: 16,),
    //
    //                    Container(
    //                      child: Stack(
    //                        children: [
    //
    //
    //                          Positioned(
    //                           top: 54,
    //                            child: Container(
    //                              height: 500,
    //                              width:MediaQuery.of(context).size.width,
    //                              decoration: BoxDecoration(
    //                               color: Color(0xffF8F8F8)
    //                              ),
    //                            ),
    //                          ),
    //
    //                          Align(
    //                            alignment: Alignment.topCenter,
    //                            child: Column(
    //                              crossAxisAlignment: CrossAxisAlignment.start,
    //                              children: [
    //
    //                                Image.asset("image/pcollectible.png"),
    //
    //                                Container(
    //
    //                                  child: Row(
    //                                    mainAxisAlignment: MainAxisAlignment.start,
    //                                    mainAxisSize: MainAxisSize.min,
    //                                    children: [
    //                                      Text("OPULENT",style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold,
    //
    //                                        letterSpacing: 2,
    //                                          color: Color(0xff585858),
    //                                          )),
    //                                      SizedBox(width: 8,),
    //                                      Text("Collectible",style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.normal)),
    //
    //                                    ],
    //                                  ),
    //                                ),
    //                                const SizedBox(height: 16,),
    //                                Container(
    //                                  padding: EdgeInsets.all(8),
    //                                  decoration: BoxDecoration(
    //                                      color: Color(0xffEAEEF2),
    //                                      borderRadius: BorderRadius.all(Radius.circular(10))
    //                                  ),
    //                                  child:  Text("EXPLORE",
    //                                    textAlign: TextAlign.start,
    //                                    style:
    //                                    Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                      color: Colors.black,
    //                                      fontWeight: FontWeight.bold,
    //                                        letterSpacing: 2
    //                                    ),
    //                                  ),
    //                                ),
    //                                SizedBox(height: 8,),
    //                                Text("30th-31th Jul",style: Theme.of(context).textTheme.headline5!.copyWith(
    //                                    fontWeight: FontWeight.normal,
    //                                  color: Theme.of(context).colorScheme.primary,
    //                                  letterSpacing: 2
    //                                )),
    //                                SizedBox(height: 8,),
    //                                Text("2022",style: Theme.of(context).textTheme.subtitle1!.copyWith(color:Color(0xff585858))),
    //                              ],
    //                            ),
    //                          )
    //
    //
    //                        ],
    //                      ),
    //                    )
    //
    //                 ],
    //               ),
    //             ),
    //           ):Container(),
    //           auctionViewModel.auctionType=="past"?Container(
    //             child: count==0?Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 Image.asset("image/Bitmap1.png"),
    //                 SizedBox(height: 25,),
    //                 SizedBox(
    //                   width: MediaQuery.of(context).size.width*.70,
    //                   child: RichText(
    //                     textAlign: TextAlign.center,
    //                     text: TextSpan(
    //                       // Note: Styles for TextSpans must be explicitly defined.
    //                       // Child text spans will inherit styles from parent
    //                       children: <TextSpan>[
    //                         TextSpan(text: 'There is ',style:  Theme.of(context).textTheme.headline6!.copyWith(
    //                           color: Colors.black,
    //                           fontWeight: FontWeight.w400,),),
    //                         TextSpan(text: 'No Past Auction', style:  Theme.of(context).textTheme.headline6!.copyWith(
    //                           color: Colors.black,
    //                           fontWeight: FontWeight.w600,),),
    //                         TextSpan(text: '\n at this moment',style:  Theme.of(context).textTheme.headline6!.copyWith(
    //                           color: Colors.black,
    //                           fontWeight: FontWeight.w400,),),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //
    //               ],
    //             ):
    //             Container(
    //               padding: EdgeInsets.all(16),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Container(
    //                       height: 500,
    //                       child: CustomScrollView(slivers: [
    //                         // SliverPinnedHeader(
    //                         //     child: Column(
    //                         //       children: [
    //                         //         Row(
    //                         //           mainAxisAlignment: MainAxisAlignment.center,
    //                         //           crossAxisAlignment: CrossAxisAlignment.center,
    //                         //           children: [
    //                         //           Image.asset("image/cal.png",color: Color(0xff80A071),),
    //                         //             SizedBox(width: 10,),
    //                         //             Text("2022",
    //                         //               textAlign: TextAlign.center,
    //                         //               style:
    //                         //               Theme.of(context).textTheme.headline6!.copyWith(
    //                         //                 color: Colors.black,
    //                         //                 fontWeight: FontWeight.w600,
    //                         //               ),
    //                         //             ),
    //                         //           ],
    //                         //         ),
    //                         //         SizedBox(height: 16,)
    //                         //       ],
    //                         //     )),
    //                         SliverAnimatedPaintExtent(
    //                           duration: const Duration(milliseconds: 150),
    //                           child: SliverList(
    //                             delegate: SliverChildBuilderDelegate(
    //                                   (BuildContext context, int index) {
    //                                 return Padding(
    //                                   padding: const EdgeInsets.all(0.0),
    //                                   child: Container(
    //                                       color: Color(0xffFFFFFF),
    //                                       height:480,
    //                                       alignment: Alignment.center,
    //                                       margin: EdgeInsets.only(bottom: 17),
    //                                       child: Stack(
    //                                         children: [
    //                                           Padding(
    //                                             padding: EdgeInsets.only(top: 80 / 2.0,bottom: 0),
    //                                             child: Container(
    //                                               //replace this Container with your Card
    //                                               color: Color(0xffF9F9F9),
    //                                               height:500.0,
    //                                             ),
    //                                           ),
    //                                           Align(
    //                                             alignment: Alignment.topCenter,
    //                                             child: Padding(
    //                                               padding: const EdgeInsets.only(left: 35.0,right: 25),
    //                                               child: Image.asset("image/image 9.png",height: 300,width: MediaQuery.of(context).size.width*.8),
    //                                             ),
    //                                           ),
    //                                           Padding(
    //                                               padding: EdgeInsets.only(top: 310,bottom: 0,left: 25.0,right: 25),
    //                                               child:Column(
    //                                                 mainAxisAlignment: MainAxisAlignment.start,
    //                                                 crossAxisAlignment: CrossAxisAlignment.start,
    //                                                 children: [
    //                                                   SizedBox(width: 20,),
    //                                                   Text("TRADITIONAL PAINTINGS",
    //                                                     textAlign: TextAlign.center,
    //                                                     style:
    //                                                     Theme.of(context).textTheme.headline5!.copyWith(
    //                                                       color: Colors.black,
    //                                                       letterSpacing: 1,
    //                                                       fontWeight: FontWeight.bold,
    //                                                     ),
    //                                                   ),
    //                                                   SizedBox(height: 10,),
    //                                                   Text("24th Feb- 26th Feb, 2022",
    //                                                     textAlign: TextAlign.center,
    //                                                     style:
    //                                                     Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                                       color: Color(0xff747474),
    //                                                       fontWeight: FontWeight.w400,
    //                                                     ),
    //                                                   ),
    //                                                   SizedBox(height: 20,),
    //                                                   Row(
    //                                                     mainAxisAlignment: MainAxisAlignment.start,
    //                                                     crossAxisAlignment: CrossAxisAlignment.start,
    //                                                     children: [
    //                                                       Column(
    //                                                         mainAxisAlignment: MainAxisAlignment.start,
    //                                                         crossAxisAlignment: CrossAxisAlignment.start,
    //                                                         children: [
    //                                                           Text("Total Sales Value",
    //                                                             textAlign: TextAlign.center,
    //                                                             style:
    //                                                             Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                                               color: Colors.black,
    //                                                               fontWeight: FontWeight.w400,
    //                                                             ),
    //                                                           ),
    //                                                           SizedBox(height: 10,),
    //                                                           Text("₹55,000",
    //                                                             textAlign: TextAlign.center,
    //                                                             style:
    //                                                             Theme.of(context).textTheme.headline6!.copyWith(
    //                                                               color: Theme.of(context).colorScheme.primary,
    //                                                               fontWeight: FontWeight.bold,
    //                                                             ),
    //                                                           ),
    //                                                         ],
    //                                                       ),
    //                                                       Spacer(),
    //                                                       Column(
    //                                                         mainAxisAlignment: MainAxisAlignment.start,
    //                                                         crossAxisAlignment: CrossAxisAlignment.start,
    //                                                         children: [
    //                                                           Padding(
    //                                                             padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
    //                                                             child: Text('View All', style:
    //                                                             Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                                               color: Color(0XFF1F2A52),
    //                                                               decoration: TextDecoration.underline,
    //                                                               letterSpacing: 1,
    //                                                               fontWeight: FontWeight.bold,
    //                                                             ),),
    //                                                           ),
    //                                                         ],
    //                                                       ),
    //                                                     ],
    //                                                   ),
    //                                                   SizedBox(height: 20,),
    //                                                 ],
    //                                               )
    //                                           ),
    //                                         ],
    //                                       )
    //                                   ),
    //                                 );
    //                               },
    //                               // 40 list items
    //                               childCount: 3,
    //                             ),
    //                           ),
    //                         ),
    //                       ])
    //                   ),
    //                   SizedBox(height: 10,),
    //                   Center(
    //                     child: ElevatedButton(
    //                       style:   ButtonStyle(
    //                           backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
    //                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                               RoundedRectangleBorder(
    //                                   borderRadius: BorderRadius.circular(20.0),
    //                                   side: BorderSide(color: Color(0xff747474),width: 0.38)
    //                               )
    //                           )
    //                       ),
    //                       onPressed: (){
    //                       },
    //                       child: Padding(
    //                         padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
    //                         child: Text('Load More', style:
    //                         Theme.of(context).textTheme.bodyText1!.copyWith(
    //                           color: Color(0XFF2D2D2D),
    //                           fontWeight: FontWeight.w600,
    //                         ),),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ):Container(),
    //           SizedBox(height: 32,),
    //
    //
    //           liveAuctionType =="closingschedule"?Container(): ElevatedButton(
    //             style:   ButtonStyle(
    //                 backgroundColor: MaterialStateProperty.all(Colors.white),
    //                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                     RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(20.0),
    //                         side: BorderSide(color: Color(0xff747474),width: 0.38)
    //                     )
    //                 )
    //             ),
    //             onPressed: (){
    //             },
    //             child: Padding(
    //               padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
    //               child: Text('LOAD MORE', style:
    //               Theme.of(context).textTheme.subtitle1!.copyWith(
    //                 color: Colors.black,
    //                 letterSpacing: 2,
    //                 fontWeight: FontWeight.w900,
    //               ),),
    //             ),
    //           ),
    //
    //
    //           liveAuctionType !="closingschedule"?Container(): SizedBox(height: 40,),
    //           liveAuctionType =="closingschedule"?Container():  Row(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               InkWell(
    //                 onTap: (){
    //                   showModalBottomSheet(
    //                       context: context,
    //                       isScrollControlled: true,
    //                       backgroundColor: Colors.white,
    //                       builder: (BuildContext dialogContext)
    //                       {
    //                         return SafeArea(
    //                           child: Scaffold(
    //                             body: StatefulBuilder(
    //                             builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
    //                                   return Container(
    //                                   padding: EdgeInsets.all(16),
    //                                   height: MediaQuery.of(context).size.height,
    //                                   color: Color(0xffF5F5F5),
    //                                   child:Column(
    //                                     mainAxisSize: MainAxisSize.max,
    //                                     mainAxisAlignment: MainAxisAlignment.start,
    //                                     children: [
    //                                       SizedBox(height: 30,),
    //                                       Row(
    //                                         children: [
    //                                            Icon(Icons.tune_rounded,size: 30,color: Theme.of(context).colorScheme.primary,),
    //                                           // Image.asset("image/filter.png",color: Theme.of(context).,),
    //                                            SizedBox(width: 8,),
    //                                           Text("FILTER BY",
    //                                             textAlign: TextAlign.center,
    //                                             style:
    //                                             Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                               color: Color(0xff000000),
    //                                               letterSpacing: 1,
    //                                               fontWeight: FontWeight.bold,
    //                                             ),
    //                                           ),
    //                                           Spacer(),
    //                                           Text("RESET",
    //                                             textAlign: TextAlign.center,
    //                                             style:
    //                                             Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                               color: Colors.grey,
    //                                               letterSpacing: 1,
    //                                               fontWeight: FontWeight.bold,
    //                                             ),
    //                                           ),
    //                                           // Image.asset("image/sort.png",color: Theme.of(context).colorScheme.primary),
    //
    //                                         ],
    //                                       ),
    //                                       SizedBox(height: 24,),
    //                                       Expanded(
    //                                         child: Scrollbar(
    //                                           interactive: true,
    //                                           thumbVisibility: true,
    //                                           child: ListView.builder(
    //                                             shrinkWrap: true,
    //                                             // physics: ScrollPhysics(),
    //                                             itemCount: data.length,
    //                                             itemBuilder: (BuildContext context, int index) =>
    //                                                 _buildList(data[index]),
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       SizedBox(height: 20,),
    //                                       Row(
    //                                         mainAxisAlignment: MainAxisAlignment.center,
    //                                         children: [
    //                                           ElevatedButton(
    //                                             style:   ButtonStyle(
    //                                                 backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
    //                                                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                                                     RoundedRectangleBorder(
    //                                                         borderRadius: BorderRadius.circular(20.0),
    //                                                         side: BorderSide(color: Color(0xff747474),width: 0.38)
    //                                                     )
    //                                                 )
    //                                             ),
    //                                             onPressed: (){
    //                                             },
    //                                             child: Padding(
    //                                               padding: const EdgeInsets.only(right: 32.0,left: 32,top: 12,bottom: 12),
    //                                               child: Text('CLOSE', style:
    //                                               Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                                 color: Colors.black,
    //                                                 letterSpacing: 1,
    //                                                 fontWeight: FontWeight.bold,
    //                                               ),),
    //                                             ),
    //                                           ),
    //                                           SizedBox(width: 10,),
    //                                           Spacer(),
    //                                           ElevatedButton(
    //                                             style:   ButtonStyle(
    //                                                 backgroundColor: MaterialStateProperty.all(Color(0XFF8DAB7F)),
    //                                                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                                                     RoundedRectangleBorder(
    //                                                       borderRadius: BorderRadius.circular(20.0),
    //                                                       // side: BorderSide(color: Colors.red)
    //                                                     )
    //                                                 )
    //                                             ),
    //                                             onPressed: (){
    //                                               Navigator.push(context, MaterialPageRoute(builder: (context) => FillterSearchpage()));
    //                                             },
    //                                             child: Padding(
    //                                               padding: const EdgeInsets.only(right: 32.0,left: 32,top: 12,bottom: 12),
    //                                               child: Text('APPLY', style:
    //                                               Theme.of(context).textTheme.bodyText1!.copyWith(
    //                                                 color: Colors.white,
    //                                                 letterSpacing: 1,
    //                                                 fontWeight: FontWeight.bold,
    //                                               ),),
    //                                             ),
    //                                           ),
    //                                         ],
    //                                       ),
    //                                       SizedBox(width: 24,),
    //                                     ],
    //                                   )
    //                               );
    //                             }
    //                             ),
    //                           ),
    //                         );
    //                       });
    //                 },
    //                 child: Container(
    //                   color: Color(0xffF4F4F4),
    //                   padding: EdgeInsets.only(left: 20,top: 12,right: 20,bottom: 12),
    //                 child: Row(
    //                   children: [
    //                     // Image.asset("image/filter.png",color: Colors.grey,height: 24),
    //                     Icon(Icons.tune_rounded, color: Colors.grey,),
    //                     SizedBox(width: 8,),
    //                     Text("FILTER BY",
    //                       textAlign: TextAlign.center,
    //                       style:
    //                       Theme.of(context).textTheme.subtitle1!.copyWith(
    //                         color: Color(0xff000000),
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //
    //                   ],
    //                 ),),
    //               ),
    //               SizedBox(width: 40,),
    //               InkWell(
    //                 onTap: (){
    //                   showModalBottomSheet(
    //                       context: context,
    //                       builder: (context) {
    //                         return Container(
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
    //                           ),
    //                           padding: const EdgeInsets.all(12.0),
    //                           child: Column(
    //                             mainAxisSize: MainAxisSize.min,
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: <Widget>[
    //                               // Image.asset("image/sort.png",color: Theme.of(context).colorScheme.primary),
    //                               Text("Sort By",style: Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                 color: Colors.black,
    //
    //                               ),),
    //                               SizedBox(height: 16,),
    //                               ListTile(
    //                                 leading: Checkbox(
    //                                   value: selected,
    //                                   onChanged: (bool? value){},
    //                                 ),
    //                                 title: Text("Contemporary Art", style:
    //                                 Theme.of(context).textTheme.bodyText1!.copyWith(
    //                                 color: Colors.black,
    //                                 fontWeight: FontWeight.w400,
    //                                 ),),
    //                                 onTap: () {
    //                                   Navigator.pop(context);
    //                                 },
    //                               ),
    //                               ListTile(
    //                                 leading: Checkbox(
    //                                   value: selected,
    //                                   onChanged: (bool? value){},
    //                                 ),
    //                                 title: Text("M. F. Hussian", style:
    //                                 Theme.of(context).textTheme.bodyText1!.copyWith(
    //                                   color: Colors.black,
    //                                   fontWeight: FontWeight.w400,
    //                                 ),),
    //                                 onTap: () {
    //                                   Navigator.pop(context);
    //                                 },
    //                               ),
    //                               ListTile(
    //                                 leading: Checkbox(
    //                                   value: selected,
    //                                   onChanged: (bool? value){},
    //                                 ),
    //                                 title: Text("Antique", style:
    //                                 Theme.of(context).textTheme.bodyText1!.copyWith(
    //                                   color: Colors.black,
    //                                   fontWeight: FontWeight.w400,
    //                                 ),),
    //                                 onTap: () {
    //                                   Navigator.pop(context);
    //                                 },
    //                               ),
    //                               ListTile(
    //                                 leading: Checkbox(
    //                                   value: selected,
    //                                   onChanged: (bool? value){},
    //                                 ),
    //                                 title: Text("Impressionist & Modern Art", style:
    //                                 Theme.of(context).textTheme.bodyText1!.copyWith(
    //                                   color: Colors.black,
    //                                   fontWeight: FontWeight.w400,
    //                                 ),),
    //                                 onTap: () {
    //                                   Navigator.pop(context);
    //                                 },
    //                               ),
    //                               SizedBox(height: 20,),
    //                               Row(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 children: [
    //                                   ElevatedButton(
    //                                     style:   ButtonStyle(
    //                                         backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
    //                                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                                             RoundedRectangleBorder(
    //                                                 borderRadius: BorderRadius.circular(20.0),
    //                                                 side: BorderSide(color: Color(0xff747474),width: 0.38)
    //                                             )
    //                                         )
    //                                     ),
    //                                     onPressed: (){
    //                                     },
    //                                     child: Padding(
    //                                       padding: const EdgeInsets.only(right: 32.0,left: 32,top: 12,bottom: 12),
    //                                       child: Text('CLOSE', style:
    //                                       Theme.of(context).textTheme.subtitle1!.copyWith(
    //                                         color: Colors.black,
    //                                         letterSpacing: 1,
    //                                         fontWeight: FontWeight.bold,
    //                                       ),),
    //                                     ),
    //                                   ),
    //                                   SizedBox(width: 10,),
    //                                   Spacer(),
    //                                   ElevatedButton(
    //                                     style:   ButtonStyle(
    //                                         backgroundColor: MaterialStateProperty.all(Color(0XFF8DAB7F)),
    //                                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                                             RoundedRectangleBorder(
    //                                               borderRadius: BorderRadius.circular(20.0),
    //                                               // side: BorderSide(color: Colors.red)
    //                                             )
    //                                         )
    //                                     ),
    //                                     onPressed: (){
    //                                       Navigator.push(context, MaterialPageRoute(builder: (context) => FillterSearchpage()));
    //                                     },
    //                                     child: Padding(
    //                                       padding: const EdgeInsets.only(right: 32.0,left: 32,top: 12,bottom: 12),
    //                                       child: Text('APPLY', style:
    //                                       Theme.of(context).textTheme.bodyText1!.copyWith(
    //                                         color: Colors.white,
    //                                         letterSpacing: 1,
    //                                         fontWeight: FontWeight.bold,
    //                                       ),),
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                               SizedBox(width: 24,),
    //                             ],
    //                           ),
    //                         );
    //                       });
    //                 },
    //                 child: Container(
    //                   color: Color(0xffF4F4F4),
    //                   padding: EdgeInsets.only(left: 20,top:12,right: 20,bottom: 12),
    //                 child: Row(
    //                   children: [
    //                     Icon(Icons.sort,size: 30,color: Colors.grey,),
    //                     SizedBox(width: 8,),
    //                     Text("SORT BY",
    //                       textAlign: TextAlign.center,
    //                       style:
    //                       Theme.of(context).textTheme.subtitle1!.copyWith(
    //                         color: Color(0xff000000),
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ],
    //                 ),),
    //               )
    //             ],
    //           ),
    //           SizedBox(height: 16,),
    //           // auctionType=="live"?Container(
    //           //   height: 380,
    //           //   width: MediaQuery.of(context).size.width,
    //           //   color: Color(0XFFF0F4E7),
    //           //   child: Column(
    //           //     mainAxisAlignment: MainAxisAlignment.start,
    //           //     crossAxisAlignment: CrossAxisAlignment.center,
    //           //     children: [
    //           //       SizedBox(height: 16,),
    //           //       // SizedBox(
    //           //       //   width: MediaQuery.of(context).size.width*.70,
    //           //       //   child: Text("FEATURED ITEMS",
    //           //       //     textAlign: TextAlign.center,
    //           //       //     style:
    //           //       //     Theme.of(context).textTheme.headline6!.copyWith(
    //           //       //       color: Color(0xff2D2D2D),
    //           //       //       fontWeight: FontWeight.w400,
    //           //       //     ),
    //           //       //   ),
    //           //       // ),
    //           //       SizedBox(height: 16,),
    //           //       Container(
    //           //         // width: 45,
    //           //           color: Color(0XFFF0F4E7),
    //           //           child: Image.asset("image/Bitmap1.png")),
    //           //       SizedBox(height: 16,),
    //           //       Text("OPULENT COLLECTIBLE",
    //           //         textAlign: TextAlign.left,
    //           //         style:
    //           //         Theme.of(context).textTheme.headline6!.copyWith(
    //           //           color: Colors.black,
    //           //           fontWeight: FontWeight.w400,
    //           //         ),
    //           //       ),
    //           //       SizedBox(height: 16,),
    //           //       SizedBox(
    //           //         width: MediaQuery.of(context).size.width*.70,
    //           //         child: Text("30th-31st Jul",
    //           //           textAlign: TextAlign.center,
    //           //           style:
    //           //           Theme.of(context).textTheme.headline6!.copyWith(
    //           //             color: Color(0xff466D33),
    //           //             fontWeight: FontWeight.w500,
    //           //           ),
    //           //         ),
    //           //       ),
    //           //       SizedBox(height: 16,),
    //           //       SizedBox(
    //           //         width: MediaQuery.of(context).size.width*.70,
    //           //         child: Text("2022",
    //           //           textAlign: TextAlign.center,
    //           //           style:
    //           //           Theme.of(context).textTheme.subtitle1!.copyWith(
    //           //             color: Color(0xff2D2D2D),
    //           //             fontWeight: FontWeight.w500,
    //           //           ),
    //           //         ),
    //           //       ),
    //           //     ],
    //           //   ),
    //           // ):Container(),
    //
    //
    //           SizedBox(
    //
    //               width: MediaQuery.of(context).size.width,
    //               child: Footer()),
    //           SizedBox(
    //             height: 30,
    //             width: MediaQuery.of(context).size.width,
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    //   // bottomNavigationBar: Dashboard2Ui(),
    // );
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
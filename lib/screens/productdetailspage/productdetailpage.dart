

import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:intl/intl.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../data/network/models/responce/lot/upcominglotsresponse.dart';
import '../components/footer/footer.dart';
import '../components/header.dart';




class ProductDetailPage extends StatefulWidget {
  ProductDetailPage(this.lots,this.auctionViewModel);
  Lots lots;
  AuctionViewModel auctionViewModel;
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _pageIndex = 0;
  bool countDown =true,selected=false;
  Color tabColor= Color(0xff6D905D);
  bool onClick=false;



  _showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(10, top, left, 0),
        items: widget.lots.liveStatus!.next5ValidBid!.map((e) =>
          PopupMenuItem(
            value: 1,
            child: Text("₹${formateNumber(e.iNR??"0")}", style:
            Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Color(0XFF2D2D2D),
              fontWeight: FontWeight.w400,
            ),),
          )).toList(),


      elevation: 8.0,
    );
  }


  String formateNumber(String number){
    var f = NumberFormat('##,##,##,##,###.##', 'HI');

    return  f.format(double.parse(number));
  }
  Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);

  @override
  void initState() {
    // TODO: implement initState
    // print("skjnxkasjsk"+widget.lots.auctionType!);


    initData();

    super.initState();
  }

  void initData(){
    myDuration = Duration(seconds: int.parse(widget.lots.liveStatus!.remainingSeconds??"0"));
    startTimer();
    widget.auctionViewModel.getBidHistoryAuction(widget.lots.lotId!);
    widget.auctionViewModel.selectedProxyBid='';
  }
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }
  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }
  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(days: 5));
  }
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
  int position=0;
  final sliderController = PageController();
  Timer? timerForTimer;
  startTimerForSlider(){
    timerForTimer=Timer.periodic(Duration(seconds: 4), (_) async {

      setState(() {

        if(widget.lots.images==null){

        }else{

          if(position!=widget.lots.images!.length-1){
            position++;
            sliderController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInCirc);
          }else{
            position=0;
            sliderController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.easeInCirc);
          }
        }
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    // final days = strDigits(myDuration.inDays);
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      backgroundColor: Color(0xffF7FAFD),
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,

          child: Observer(
              builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (widget.lots.images??[]).length==0?Container():  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xffF8F8F8),
                    height: 260,
                    child:  Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 25.0,right: 25),
                        //   child: Image.network("${widget.lots.thumbImage}",height: 180,),
                        // ),
                       SizedBox(
                          height: 190,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                            controller: sliderController,


                            onPageChanged: (pos){
                              setState(() {
                                position=pos%4;
                              });
                            },

                            itemCount: (widget.lots.images??[])!.length,
                            itemBuilder:(context,pos) =>


                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child:  Container(
                                    height: 190,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25.0,right: 25),
                                      child: Image.network("${widget.lots.images![pos].thumbImage}",fit: BoxFit.cover,height: 220,width: MediaQuery.of(context).size.width),
                                    ),
                                  ),
                                ),

                          ),
                        ),
                        SizedBox(height: 16,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style:   ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          side: BorderSide(color: Color(0xffFFFFFF),width: 0.38)
                                      )
                                  )
                              ),
                              onPressed: (){
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0,left: 5,top: 10,bottom: 10),
                                child: Text('View in room', style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                  color: Color(0XFF2D2D2D),
                                  fontWeight: FontWeight.w400,
                                ),),
                              ),
                            ),
                            SizedBox(width: 100,),
                            Image.asset("image/share.png",height: 32,),

                            SizedBox(width: 20,),
                            Image.asset("image/save.png",height: 32,),
                            // Icon(Icons.bookmark_border,size: 24,color: Theme.of(context).colorScheme.primary,),
                          ],
                        )
                      ],
                    ),
                  ),
                  // const SizedBox(height: 16,),
                  Container(padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text('Auction> Opulent Collectibles >Porcelain Pot ', style:
                        // Theme.of(context).textTheme.bodyText1!.copyWith(
                        //   color: Color(0XFF2D2D2D),
                        //   fontWeight: FontWeight.w600,
                        //   letterSpacing: 1
                        // ),),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                                color: Color(0xffF8F8F8),
                              ),
                              padding: EdgeInsets.all(3),
                              child: Icon(Icons.keyboard_arrow_left,size: 25,),
                            ),
                            SizedBox(width: 16,),
                            Container(

                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                                color: Color.fromRGBO(117, 206, 246, 0.249918),
                              ),
                              child: Text('Lot ${widget.lots.lotNumber}', style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Color(0XFF2D2D2D),
                                fontWeight: FontWeight.w600,
                              ),),
                            ),
                            SizedBox(width: 16,),
                            Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Color.fromRGBO(117, 206, 246, 0.249918),
                              ),
                              padding: EdgeInsets.all(3),
                              child: Icon(Icons.keyboard_arrow_right,size: 25,),
                            )
                          ],
                        ),
                        SizedBox(height: 16,),
                        Text('${widget.lots.info!.title}', style:
                        Theme.of(context).textTheme.headline5!.copyWith(
                          color: Color(0XFF2D2D2D),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2
                        ),),
                        SizedBox(height: 16,),
                        ((widget.lots.artistName??"")=="")?Container(): Row(
                          children: [
                            Text('${widget.lots.artistName}', style:
                            Theme.of(context).textTheme.headline6!.copyWith(
                              color: Color(0xffE74B52),
                              fontWeight: FontWeight.bold,
                            ),),
                            Spacer(),
                            ElevatedButton(
                              style:   ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0XFFFFFFFF)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          side: BorderSide(color: Color(0xff747474),width: 0.5)
                                      )
                                  )
                              ),
                              onPressed: (){
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0,left: 5,top: 10,bottom: 10),
                                child: Text('Follow', style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.33333
                                ),),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: 16,),
                        Text('Estimate', style:
                        Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF202232),
                          fontWeight: FontWeight.w400,
                        ),),
                        SizedBox(height: 10,),
                        Text('₹${formateNumber(widget.lots.estimateFrom!.iNR??"0")} - ₹${formateNumber(widget.lots.estimateTo!.iNR??"")}', style:
                        Theme.of(context).textTheme.headline6!.copyWith(
                          color: Color(0XFF202232),
                          fontWeight: FontWeight.w500,
                        ),),
                        SizedBox(height: 16,),
                        Row(

                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Current Bid', style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Color(0XFF202232),
                                  fontWeight: FontWeight.w400,
                                ),),
                                SizedBox(height: 10,),
                                Text('₹${formateNumber(widget.lots.liveStatus!.currentBid!.iNR??"0")}', style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                  color: Color(0XFF202232),
                                  fontWeight: FontWeight.w600,
                                ),),
                              ],
                            ),
                            IntrinsicHeight(child: VerticalDivider(color: Color.fromRGBO(226, 238, 220, 1),thickness: 2.0)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Next Valid Bid', style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Color(0XFF202232),
                                  fontWeight: FontWeight.w400,
                                ),),
                                SizedBox(height: 10,),
                                Text('₹${formateNumber(widget.lots.liveStatus!.nextValidBid!.iNR??"0")}', style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                  color: Color(0xffE74B52),
                                  fontWeight: FontWeight.bold,
                                ),),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 16,),
                        ElevatedButton(
                          style:   ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xffF3E8E9)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Color(0xffFFFFFF),width: 0.38)
                                  )
                              )
                          ),
                          onPressed: ()async{


                           await widget.auctionViewModel.getAdditionCharge(widget.lots);

                           if(widget.auctionViewModel.additionalChargeResponse!.status=="false"){

                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${widget.auctionViewModel.additionalChargeResponse!.message}",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white)),backgroundColor: Colors.red,));

                           }else {
                             showDialog(
                                 context: context,
                                 builder: (BuildContext dialogContext) {
                                   return AlertDialog(
                                     contentPadding: EdgeInsets.all(0),
                                     content: Container(
                                       padding: EdgeInsets.all(16),
                                       height: 580,
                                       width: MediaQuery
                                           .of(context)
                                           .size
                                           .width,
                                       color: Color(0xffEAEEF2),
                                       child: SingleChildScrollView(
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment
                                               .start,
                                           crossAxisAlignment: CrossAxisAlignment
                                               .start,
                                           children: [
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment
                                                   .end,
                                               crossAxisAlignment: CrossAxisAlignment
                                                   .end,
                                               children: [
                                                 InkWell(
                                                     onTap: () {
                                                       Navigator.of(context)
                                                           .pop();
                                                     },
                                                     child: Icon(
                                                       Icons.close, size: 20,
                                                       color: Color(
                                                           0xff979797),))
                                               ],),
                                             Row(
                                               children: [
                                                 Image.asset(
                                                   "image/Vector (22).png",
                                                   color: Color(0XFF202232),),
                                                 SizedBox(width: 5,),
                                                 Text(
                                                   'ADDITIONAL CHARGES', style:
                                                 Theme
                                                     .of(context)
                                                     .textTheme
                                                     .subtitle1!
                                                     .copyWith(
                                                     color: Color(0XFF202232),
                                                     fontWeight: FontWeight
                                                         .w400,
                                                     letterSpacing: 2
                                                 ),),
                                               ],
                                             ),
                                             SizedBox(height: 16,),
                                             Container(

                                               padding: EdgeInsets.all(10),
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.all(
                                                     Radius.circular(16)),
                                                 color: Color(0xffB45156),
                                               ),
                                               child: Text(
                                                 'Lot ${widget.lots.lotNumber}',
                                                 style:
                                                 Theme
                                                     .of(context)
                                                     .textTheme
                                                     .bodyText1!
                                                     .copyWith(
                                                   color: Colors.white,
                                                   fontWeight: FontWeight.w600,
                                                 ),),
                                             ),
                                             SizedBox(height: 16,),
                                             Text('${widget.lots.artistName}',
                                               style:
                                               Theme
                                                   .of(context)
                                                   .textTheme
                                                   .subtitle1!
                                                   .copyWith(
                                                 color: Color(0XFF2D2D2D),
                                                 fontWeight: FontWeight.w600,
                                               ),),
                                             SizedBox(height: 16,),
                                             Row(
                                               children: [
                                                 Image.asset("image/Vector.png",
                                                   height: 20,
                                                   width: 20,
                                                   color: Color(0XFF202232),),
                                                 SizedBox(width: 16,),
                                                 Text(
                                                   'Medium: ${widget.lots.info!
                                                       .medium}', style:
                                                 Theme
                                                     .of(context)
                                                     .textTheme
                                                     .subtitle1!
                                                     .copyWith(
                                                   color: Color(0XFF2D2D2D),
                                                   fontWeight: FontWeight.w500,
                                                 ),),
                                               ],
                                             ),
                                             SizedBox(height: 16,),
                                             Row(
                                               children: [
                                                 Image.asset(
                                                   "image/Shape (8).png",
                                                   height: 20,
                                                   width: 20,
                                                   color: Color(0XFF202232),),
                                                 SizedBox(width: 16,),
                                                 Text('Year: ${widget.lots.info!
                                                     .year}', style:
                                                 Theme
                                                     .of(context)
                                                     .textTheme
                                                     .subtitle1!
                                                     .copyWith(
                                                   color: Color(0XFF2D2D2D),
                                                   fontWeight: FontWeight.w500,
                                                 ),),
                                               ],
                                             ),
                                             SizedBox(height: 16,),
                                             Row(
                                               children: [
                                                 Image.asset(
                                                   "image/Vector (1).png",
                                                   height: 20,
                                                   width: 20,
                                                   color: Color(0XFF202232),),
                                                 SizedBox(width: 16,),
                                                 Text('Size: ${widget.lots.info!
                                                     .size}', style:
                                                 Theme
                                                     .of(context)
                                                     .textTheme
                                                     .subtitle1!
                                                     .copyWith(
                                                   color: Color(0XFF2D2D2D),
                                                   fontWeight: FontWeight.w500,
                                                 ),),
                                               ],
                                             ),
                                             SizedBox(height: 20,),
                                             Container(
                                               height: 210,
                                               width: MediaQuery
                                                   .of(context)
                                                   .size
                                                   .width * .7,
                                               color: Color(0xffD9D9D9),
                                               padding: EdgeInsets.all(16),
                                               child: Column(
                                                 mainAxisAlignment: MainAxisAlignment
                                                     .start,
                                                 crossAxisAlignment: CrossAxisAlignment
                                                     .start,
                                                 children: [
                                                   Row(
                                                     children: [
                                                       Text('Price', style:
                                                       Theme
                                                           .of(context)
                                                           .textTheme
                                                           .subtitle1!
                                                           .copyWith(
                                                         color: Color(
                                                             0XFF202232),
                                                         fontWeight: FontWeight
                                                             .w400,
                                                       ),),
                                                       Spacer(),
                                                       Text('₹ ${widget
                                                           .auctionViewModel
                                                           .additionalChargeResponse!
                                                           .result!.price}',
                                                         style:
                                                         Theme
                                                             .of(context)
                                                             .textTheme
                                                             .subtitle1!
                                                             .copyWith(
                                                           color: Color(
                                                               0XFF202232),
                                                           fontWeight: FontWeight
                                                               .w400,
                                                         ),),
                                                     ],
                                                   ),
                                                   SizedBox(height: 10,),
                                                   Row(
                                                     children: [
                                                       Text('15% Margin', style:
                                                       Theme
                                                           .of(context)
                                                           .textTheme
                                                           .subtitle1!
                                                           .copyWith(
                                                         color: Color(
                                                             0XFF202232),
                                                         fontWeight: FontWeight
                                                             .w400,
                                                       ),),
                                                       Spacer(),
                                                       Text('₹ 17,11,871',
                                                         style:
                                                         Theme
                                                             .of(context)
                                                             .textTheme
                                                             .subtitle1!
                                                             .copyWith(
                                                           color: Color(
                                                               0XFF202232),
                                                           fontWeight: FontWeight
                                                               .w400,
                                                         ),),
                                                     ],
                                                   ),
                                                   SizedBox(height: 10,),
                                                   Row(
                                                     children: [
                                                       Text('GST on Lot (12 %)',
                                                         style:
                                                         Theme
                                                             .of(context)
                                                             .textTheme
                                                             .subtitle1!
                                                             .copyWith(
                                                           color: Color(
                                                               0XFF202232),
                                                           fontWeight: FontWeight
                                                               .w400,
                                                         ),),
                                                       Spacer(),
                                                       Text('₹ ${widget
                                                           .auctionViewModel
                                                           .additionalChargeResponse!
                                                           .result!.taxation![0]
                                                           .value}', style:
                                                       Theme
                                                           .of(context)
                                                           .textTheme
                                                           .subtitle1!
                                                           .copyWith(
                                                         color: Color(
                                                             0XFF202232),
                                                         fontWeight: FontWeight
                                                             .w400,
                                                       ),),
                                                     ],
                                                   ),
                                                   SizedBox(height: 10,),
                                                   Row(
                                                     children: [
                                                       Text('TCS(0.1 %)', style:
                                                       Theme
                                                           .of(context)
                                                           .textTheme
                                                           .subtitle1!
                                                           .copyWith(
                                                         color: Color(
                                                             0XFF202232),
                                                         fontWeight: FontWeight
                                                             .w400,
                                                       ),),
                                                       Spacer(),
                                                       Text('₹ ${widget
                                                           .auctionViewModel
                                                           .additionalChargeResponse!
                                                           .result!.price!
                                                           .iNR}', style:
                                                       Theme
                                                           .of(context)
                                                           .textTheme
                                                           .subtitle1!
                                                           .copyWith(
                                                         color: Color(
                                                             0XFF202232),
                                                         fontWeight: FontWeight
                                                             .w400,
                                                       ),),
                                                     ],
                                                   ),
                                                   SizedBox(height: 10,),
                                                   Image.asset(
                                                       "image/Line 24.png"),
                                                   SizedBox(height: 10,),
                                                   Row(
                                                     children: [
                                                       Text('Total', style:
                                                       Theme
                                                           .of(context)
                                                           .textTheme
                                                           .subtitle1!
                                                           .copyWith(
                                                         color: Color(
                                                             0XFF202232),
                                                         fontWeight: FontWeight
                                                             .w600,
                                                       ),),
                                                       Spacer(),
                                                       Text('₹ ${widget
                                                           .auctionViewModel
                                                           .additionalChargeResponse!
                                                           .result!.total}',
                                                         style:
                                                         Theme
                                                             .of(context)
                                                             .textTheme
                                                             .subtitle1!
                                                             .copyWith(
                                                           color: Color(
                                                               0XFF202232),
                                                           fontWeight: FontWeight
                                                               .w600,
                                                         ),),
                                                     ],
                                                   )
                                                 ],
                                               ),
                                             ),
                                             SizedBox(height: 20,),
                                             Align(
                                               alignment: Alignment.topCenter,
                                               child: ElevatedButton(
                                                 style: ButtonStyle(
                                                     backgroundColor: MaterialStateProperty
                                                         .all(
                                                         Colors.transparent),
                                                     shape: MaterialStateProperty
                                                         .all<
                                                         RoundedRectangleBorder>(
                                                         RoundedRectangleBorder(
                                                             borderRadius: BorderRadius
                                                                 .circular(
                                                                 20.0),
                                                             side: BorderSide(
                                                                 color: Color(
                                                                     0XFFB45156),
                                                                 width: 0.5)
                                                         )
                                                     )
                                                 ),
                                                 onPressed: () {},
                                                 child: Padding(
                                                   padding: const EdgeInsets
                                                       .only(right: 0.0,
                                                       left: 0,
                                                       top: 12,
                                                       bottom: 12),
                                                   child: Text(
                                                     'UPDATE YOUR BILLING DETAILS',
                                                     style:
                                                     Theme
                                                         .of(context)
                                                         .textTheme
                                                         .caption!
                                                         .copyWith(
                                                         color: Color(
                                                             0XFFB45156),
                                                         fontWeight: FontWeight
                                                             .w700,
                                                         letterSpacing: 1.33333
                                                     ),),
                                                 ),
                                               ),
                                             ),
                                             SizedBox(height: 10,),
                                             Text(
                                               'Note: Crating and shipping charged separately depending on delivery location.',
                                               textAlign: TextAlign.center,
                                               style:
                                               Theme
                                                   .of(context)
                                                   .textTheme
                                                   .caption!
                                                   .copyWith(
                                                 color: Color(0XFF202232)
                                                     .withOpacity(0.61),
                                                 fontWeight: FontWeight.w400,
                                               ),),
                                           ],
                                         ),
                                       ),

                                     ),
                                   );
                                 });
                           }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0,left: 5,top: 10,bottom: 10),
                            child: Text('View Additional charges', style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0xffE74B52),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline
                            ),),
                          ),
                        ),
                        SizedBox(height: 16,),
                        widget.lots.auctionType=="2"? Text('Description', style:
                        Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF202232),
                          fontWeight: FontWeight.w500,
                        ),):Container(),
                        SizedBox(height: 10,),
                        widget.lots.auctionType=="2"? Text('${(widget.lots.info!.description??"")==""?"NA":widget.lots.info!.description}', style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0XFF747474),
                          fontWeight: FontWeight.w400,
                        ),):Container(),
                        SizedBox(height: 16,),
                        widget.lots.auctionType=="1"?  Row(
                          children: [
                            Image.asset("image/Vector.png",height: 20,width: 20),
                            SizedBox(width: 16,),
                            Text('Medium: ${widget.lots.info!.medium}', style:
                            Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Color(0XFF2D2D2D),
                              fontWeight: FontWeight.w500,
                            ),),
                          ],
                        ):Container(),
                        widget.lots.auctionType=="1"?SizedBox(height: 16,):Container(),
                        widget.lots.auctionType=="1"? Row(
                          children: [
                            Image.asset("image/Shape (8).png",height: 20,width: 20),
                            SizedBox(width: 16,),
                            Text('Year: ${widget.lots.info!.year}', style:
                            Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Color(0XFF2D2D2D),
                              fontWeight: FontWeight.w500,
                            ),),
                          ],
                        ):Container(),
                        widget.lots.auctionType=="1"?SizedBox(height: 16,):Container(),
                        widget.lots.auctionType=="1"?  Row(
                          children: [
                            Image.asset("image/Vector (1).png",height: 20,width: 20),
                            SizedBox(width: 16,),
                            Text('Size: ${widget.lots.info!.size}', style:
                            Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Color(0XFF2D2D2D),
                              fontWeight: FontWeight.w500,
                            ),),
                          ],
                        ):Container(),
                        widget.lots.auctionType=="1"?SizedBox(height: 16,):Container(),
                        (hours=="00" && minutes=="00" && seconds=="00")?Container():  Row(
                          children: [
                            GestureDetector(
                              onTapDown: (TapDownDetails details) {
                                onClick=true;
                                _showPopupMenu(details.globalPosition);
                              },
                              child: Row(
                                children: [
                                  Text('Next 5 Bids', style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0XFF2D2D2D),
                                    fontWeight: FontWeight.w500,
                                    // decoration: TextDecoration.underline
                                  ),),
                                  // SizedBox(width: 5,),
                                  onClick==false? InkWell(
                                      onTap: (){
                                        onClick=true;
                                      },
                                      child: Icon(Icons.arrow_drop_up_sharp,size: 26,color: Color(0xff000000),)):Icon(Icons.arrow_drop_down_sharp,size: 26,color: Color(0xff000000),)
                                ],
                              ),
                            ),
                            Spacer(),
                            (hours=="00" && minutes=="00" && seconds=="00")?Container():ElevatedButton(
                              style:   ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0xff75CEF6).withOpacity(.24)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          side: BorderSide(color: Color(0xffFFFFFF),width: 0.38)
                                      )
                                  )
                              ),

                              onPressed: (){
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0,left: 5,top: 10,bottom: 10),
                                child: Text('${hours}hrs: ${minutes}Mins: ${seconds}sec', style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0XFF2D2D2D),
                                    fontWeight: FontWeight.w500,
                                    // decoration: TextDecoration.underline
                                ),),
                              ),
                            ),
                          ],
                        ),
                        (hours=="00" && minutes=="00" && seconds=="00")?Container(): SizedBox(height: 16,),
                        (hours=="00" && minutes=="00" && seconds=="00")?Container(): Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style:   ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0XFFFFFFFF)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          side: BorderSide(color: Colors.black,width: 0.38)
                                      )
                                  )
                              ),
                              onPressed: ()async{
                                await  widget.auctionViewModel.getProxyAmountByLot(widget.lots);

                                if(widget.auctionViewModel.getProxyBidAmountResponse!.status=="true"){
                                  showModalBottomSheet<void>(
                                    // context and builder are
                                    // required properties in this widget
                                    context: context,
                                    builder: (BuildContext context) {
                                      // we set up a container inside which
                                      // we create center column and display text

                                      // Returning SizedBox instead of a Container
                                      return StatefulBuilder(
                                          builder: (_,builder) {
                                            return SizedBox(
                                              height: MediaQuery.of(context).size.height,
                                              child: Observer(
                                                  builder: (context) {
                                                    return Container(
                                                      height: MediaQuery.of(context).size.height,
                                                      width: MediaQuery.of(context).size.width,
                                                      color: Color(0xffEAEEF2),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children:  <Widget>[
                                                          Align(
                                                            alignment: Alignment.topRight,
                                                            child: IconButton(onPressed: (){
                                                              Navigator.of(context).pop();
                                                            }, icon: Icon(Icons.close)),
                                                          ),
                                                          SizedBox(height: 16,),
                                                          Text("ENTER YOUR PROXY BID",style: Theme.of(context).textTheme.headline5!.copyWith(letterSpacing: 2,fontWeight: FontWeight.bold,color: Colors.black),),
                                                          SizedBox(height: 16,),
                                                          Text("My Maximum Proxy Bid",style: Theme.of(context).textTheme.subtitle1!.copyWith(letterSpacing: 2,fontWeight: FontWeight.bold),),
                                                          SizedBox(height: 16,),
                                                          Text("Select Next Valid Bid",style: Theme.of(context).textTheme.subtitle1!.copyWith(letterSpacing: 2,fontWeight: FontWeight.bold),),
                                                          SizedBox(height: 16,),

                                                          Padding(
                                                            padding: const EdgeInsets.all(2.0),
                                                            child: Observer(
                                                                builder: (context) {
                                                                  return Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                    children: widget.auctionViewModel.getProxyBidAmountResponse!.result!.nextValidBid!.map((e) =>
                                                                        InkWell(
                                                                          onTap: (){

                                                                            widget. auctionViewModel.selectedProxyBid=e.iNR??"0";

                                                                          },
                                                                          child: Column(
                                                                            children: [
                                                                              Container(
                                                                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                                                                decoration: BoxDecoration(
                                                                                    color:(widget.auctionViewModel.selectedProxyBid==(e.iNR??"0"))?Color(0xffB45156):Color(0xffF7FAFD) ,
                                                                                    borderRadius: BorderRadius.circular(8)
                                                                                ),
                                                                                child: Text("₹${formateNumber(e.iNR??"0")}",style: Theme.of(context).textTheme.caption!.copyWith(color:(widget.auctionViewModel.selectedProxyBid==(e.iNR??"0"))?Colors.white: Colors.grey)),
                                                                              ),
                                                                              SizedBox(height: 24,),

                                                                            ],
                                                                          ),
                                                                        ) ).toList(),
                                                                  );
                                                                }
                                                            ),
                                                          ),
                                                          (widget.auctionViewModel.selectedProxyBid.trim() == "")?Container():Stack(
                                                            children: [

                                                              Positioned(
                                                                  top:0,
                                                                  left:widget.auctionViewModel.getIndex(widget.auctionViewModel.selectedProxyBid)==0?42:
                                                                  widget.auctionViewModel.getIndex(widget.auctionViewModel.selectedProxyBid)==1?MediaQuery.of(context).size.width/4+42:
                                                                  widget.auctionViewModel.getIndex(widget.auctionViewModel.selectedProxyBid)==2?MediaQuery.of(context).size.width/2+42:
                                                                  MediaQuery.of(context).size.width-42,
                                                                  child: Image.asset("image/top.png",width: 16,height: 7.5,)),
                                                              Align(
                                                                alignment:widget.auctionViewModel.getIndex(widget.auctionViewModel.selectedProxyBid)==0?Alignment.topLeft:
                                                                widget.auctionViewModel.getIndex(widget.auctionViewModel.selectedProxyBid)==1?Alignment.topCenter:
                                                                widget.auctionViewModel.getIndex(widget.auctionViewModel.selectedProxyBid)==2?Alignment.topCenter:
                                                                Alignment.topRight,
                                                                child: Container(
                                                                  margin: EdgeInsets.only(top: 7.5),
                                                                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                                                  decoration: BoxDecoration(
                                                                      color:Color(0xffB45156),
                                                                      borderRadius: BorderRadius.circular(8)
                                                                  ),
                                                                  child: Text("Your Next Valid Bid ₹${formateNumber(widget.auctionViewModel.selectedProxyBid==""?"0":widget.auctionViewModel.selectedProxyBid)}",style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white)),
                                                                ),
                                                              ),

                                                            ],
                                                          )


                                                        ],

                                                      ),
                                                    );
                                                  }
                                              ),
                                            );
                                          }
                                      );
                                    },
                                  );

                                }

                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                child: Text('PROXY BID', style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Color(0XFF2D2D2D),
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.33333
                                ),),
                              ),
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                            onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
                            },
                            child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                            gradient: LinearGradient(
                            colors: [Color(0xffE74B52),Color(0xffE74B52),]
                            ),
                            // color: Color(0xff466D33),
                            borderRadius: BorderRadius.circular(28)
                            ),

                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                  child: Text('BID NOW', style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0XFFFFFFFF),
                                    fontWeight: FontWeight.w600,
                                      letterSpacing: 1.33333
                                  ),),
                                ),
                              ),
                            ),),
                          ],
                        ),
                        SizedBox(height: 16,),
                        widget.auctionViewModel.bidInfoResponse==null?Container(): Container(
                            height: 280,
                            child: Column(
                                children: [
                              Row(

                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      height: 60,

                                      width: MediaQuery.of(context).size.width/3.2,
                                      // decoration: BoxDecoration(
                                      //     color: Color(0xffFAF7E5),
                                      //   image: DecorationImage(
                                      //     image: AssetImage("image/Shape (7).png"), fit: BoxFit.cover,
                                      //   )
                                      // ),
                                      child: Image.asset("image/bidder.png",height: 65,fit: BoxFit.fill,),

                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   crossAxisAlignment: CrossAxisAlignment.center,
                                      //   children: [
                                      //
                                      //     // SizedBox(width: 5,),
                                      //     // Text('BIDDER', style:
                                      //     // Theme.of(context).textTheme.caption!.copyWith(
                                      //     //   color: Color(0XFF2D2D2D),
                                      //     //   fontWeight: FontWeight.w600,
                                      //     / Image.asset("image/bidder.png",height: 20,),/ ),),
                                      //   ],
                                      // ),
                                    ),
                                  ),
                                  // SizedBox(width: 5,),
                                  Flexible(
                                    flex: 1,

                                    child: Container(
                                      height: 60,

                                      width: MediaQuery.of(context).size.width/3.2,
                                      // decoration: BoxDecoration(
                                      //     color: Color(0xffFAF7E5),
                                      //   image: DecorationImage(
                                      //     image: AssetImage("image/Shape (7).png"), fit: BoxFit.cover,
                                      //   )
                                      // ),
                                      child: Image.asset("image/datentime.png",height: 65,fit: BoxFit.fill,),

                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   crossAxisAlignment: CrossAxisAlignment.center,
                                      //   children: [
                                      //
                                      //     // SizedBox(width: 5,),
                                      //     // Text('BIDDER', style:
                                      //     // Theme.of(context).textTheme.caption!.copyWith(
                                      //     //   color: Color(0XFF2D2D2D),
                                      //     //   fontWeight: FontWeight.w600,
                                      //     / Image.asset("image/bidder.png",height: 20,),/ ),),
                                      //   ],
                                      // ),
                                    ),
                                  ),
                                  // SizedBox(width: 5,),
                                  Flexible(
                                    flex: 1,

                                    child: Container(
                                      height: 60,

                                      width: MediaQuery.of(context).size.width/3.2,
                                      // decoration: BoxDecoration(
                                      //     color: Color(0xffFAF7E5),
                                      //   image: DecorationImage(
                                      //     image: AssetImage("image/Shape (7).png"), fit: BoxFit.cover,
                                      //   )
                                      // ),
                                      child: Image.asset("image/amount.png",height: 65,fit: BoxFit.fill,),

                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   crossAxisAlignment: CrossAxisAlignment.center,
                                      //   children: [
                                      //
                                      //     // SizedBox(width: 5,),
                                      //     // Text('BIDDER', style:
                                      //     // Theme.of(context).textTheme.caption!.copyWith(
                                      //     //   color: Color(0XFF2D2D2D),
                                      //     //   fontWeight: FontWeight.w600,
                                      //     / Image.asset("image/bidder.png",height: 20,),/ ),),
                                      //   ],
                                      // ),
                                    ),
                                  ),
                                ],
                              ),

                                    widget.auctionViewModel.bidInfoResponse==null?Container(): Column(
                                      children: widget.auctionViewModel.bidInfoResponse!.result!.bidHistory!.map((e) =>

                Container(
                padding: EdgeInsets.only(top: 10),
                color: Color(0xffFFFFFF),

                alignment: Alignment.center,
                child: Column(
                children: [
                Row(
                children: [
                Container(
                // padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width/3.5,
                child: Text('${e.name}', style:
                Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Color(0XFF2D2D2D),
                fontWeight: FontWeight.w400,
                ),),
                ),
                SizedBox(width: 15,),
                Container(
                // padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width/3.4,
                child: Text('${e.dateTime}',textAlign: TextAlign.center, style:
                Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Color(0XFF2D2D2D),
                fontWeight: FontWeight.w400,
                ),),
                ),
                SizedBox(width: 5,),
                Container(
                // padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width/3.5,
                child: Text('₹${formateNumber(e.amount!.iNR??"0")}', style:
                Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Color(0XFF2D2D2D),
                fontWeight: FontWeight.w400,
                ),),
                ),
                ],
                ),
                SizedBox(height: 5,),
                CustomPaint(painter: DrawDottedhorizontalline(
                )),
                SizedBox(height: 5,),
                ],
                )
                )).toList()


                                        // 40 list items
                                        // childCount:widget.auctionViewModel.bidInfoResponse==null?0:widget.auctionViewModel.bidInfoResponse!.result!.bidHistory!.length,
                                      ),
                                   ]
                                  ),


                            ),


                        SizedBox(height: 32,),
                        Text('About Artist', style:
                        Theme.of(context).textTheme.headline5!.copyWith(
                          color: Color(0XFF202232),
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 10,),
                        Text('${widget.lots.info!.artistDescription}', style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w400,
                        ),),
                        SizedBox(height: 16,),
                        Container(
                          color: Color(0xffF7FAFD),
                          child: DefaultTabController(
                            length: 5,
                            child:  SingleChildScrollView(
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
                                indicatorColor: Theme.of(context).colorScheme.primary,
                                isScrollable: true,
                                padding: EdgeInsets.all(0),
                                unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.6),
                                labelColor: const Color(0xFF000000),
                                labelStyle:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,),
                                tabs: [
                                  Tab(
                                      text: "Artwork detail"
                                  ),
                                  Tab(
                                      text: "Provenance"
                                  ),
                                  Tab(
                                      text: "Condition"
                                  ),
                                  Tab(
                                      text: "Provenance"
                                  ),
                                  Tab(
                                      text: "Condition"
                                  ),

                                ],
                              ),
                            ),

                          ),
                        ),
                        const SizedBox(height: 16,),
                        Container(
                            height: 320,
                            padding: EdgeInsets.only(top: 16,bottom: 16),
                            child: CustomScrollView(slivers: [
                              SliverAnimatedPaintExtent(
                                duration: const Duration(milliseconds: 150),
                                child: SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                      return Container(
                                          padding: EdgeInsets.only(top: 10),
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset("image/Vector (3).png",height: 25,width: 25,color: Theme.of(context).colorScheme.primary),
                                                  SizedBox(width: 10,),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width*.7,
                                                    child: Text("Bid on works you love with auctions. With bidding opening daily, connects collectors like you to art from leading auction houses, nonprofit organizations, and sellers across the globe.",
                                                      textAlign: TextAlign.justify,
                                                      style:
                                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w400,
                                                    ),),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                      );
                                    },
                                    // 40 list items
                                    childCount: 5,
                                  ),
                                ),
                              ),
                            ])
                        ),
                        SizedBox(height: 18,),SizedBox(height: 18,),
                        Text("Ongoing Auctions",
                          textAlign: TextAlign.center,
                          style:
                          Theme.of(context).textTheme.headline6!.copyWith(
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 18,),
                        Container(
                            height: 570,
                            child: Container(
                                color: Color(0xffFFFFFF),
                                height:580,
                                alignment: Alignment.center,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 150 / 2.0,bottom: 0),
                                      child: Container(
                                        //replace this Container with your Card
                                        color: Color(0xffF9F9F9),
                                        height:500.0,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 25.0,right: 25),
                                        child: Image.asset("image/Bitmap6.png",height: 250,
                                          width: MediaQuery.of(context).size.width*.65,
                                          fit: BoxFit.contain,

                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(top: 250,bottom: 0,left: 25.0,right: 25),
                                        child:Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 20,),
                                            Text("JAMINI ROY",
                                              textAlign: TextAlign.center,
                                              style:
                                              Theme.of(context).textTheme.headline6!.copyWith(
                                                color: Colors.black,
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Text("Mother & Child",
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
                                                    Text("Estimate Value ",
                                                      textAlign: TextAlign.center,
                                                      style:
                                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                                        color: Color(0xff747474),
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("₹50,000- ₹75,000",
                                                      textAlign: TextAlign.center,
                                                      style:
                                                      Theme.of(context).textTheme.bodyText1!.copyWith(
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
                                                    Text("Bid Closing in",
                                                      textAlign: TextAlign.center,
                                                      style:
                                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                                        color: Color(0xff747474),
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Row(
                                                      children: [
                                                        Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(8),
                                                              color: Color(0xff8C9FB1),
                                                            ),
                                                            padding: EdgeInsets.all(4),
                                                            child:Text("02",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
                                                        ),
                                                        Container(
                                                          // color: Colors.black,
                                                            padding: EdgeInsets.all(4),
                                                            child:Text(":")
                                                        ),
                                                        Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(8),
                                                              color: Color(0xff8C9FB1),
                                                            ),

                                                            padding: EdgeInsets.all(4),
                                                            child:Text("14",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
                                                        ),

                                                        Container(
                                                          // color: Colors.black,
                                                            padding: EdgeInsets.all(4),
                                                            child:Text(":")
                                                        ),

                                                        Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(8),
                                                              color: Color(0xff8C9FB1),
                                                            ),
                                                            padding: EdgeInsets.all(4),
                                                            child:Text("59",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
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
                                                    Text("Current Bid",
                                                      textAlign: TextAlign.center,
                                                      style:
                                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                                        color: Color(0xff747474),
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("₹50,000",
                                                      textAlign: TextAlign.center,
                                                      style:
                                                      Theme.of(context).textTheme.bodyText1!.copyWith(
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
                                                    Text("Next Valid Bid",
                                                      textAlign: TextAlign.center,
                                                      style:
                                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                                        color: Color(0xff747474),
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("₹75,000",
                                                      textAlign: TextAlign.center,
                                                      style:
                                                      Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        color: Theme.of(context).colorScheme.primary,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
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
                                                    padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                                    child: Text('PROXY BID', style:
                                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Color(0XFF2D2D2D),
                                                      fontWeight: FontWeight.bold,
                                                    ),),
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                InkWell(
                                                  onTap: (){
                                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    // width: 150,
                                                    decoration: BoxDecoration(
                                                        gradient: LinearGradient(
                                                            colors: [Color(0xffE74B52),Color(0xffE74B52),]
                                                        ),
                                                        // color: Color(0xff466D33),
                                                        borderRadius: BorderRadius.circular(24)
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(right: 32.0,left: 32,top: 12,bottom: 12),
                                                        child: Text('BID NOW', style:
                                                        Theme.of(context).textTheme.bodyText1!.copyWith(
                                                          color: Color(0XFFFFFFFF),
                                                          fontWeight: FontWeight.bold,
                                                        ),),
                                                      ),
                                                    ),
                                                  ),),
                                              ],
                                            ),
                                            SizedBox(height: 8,),
                                          ],
                                        )
                                    ),

                                    Positioned(
                                      right: 16,
                                      top: 50,
                                      child: Column(
                                        children: [
                                          Container(


                                            child: Text("Lot 01"),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(16),
                                              color: Colors.lightBlueAccent.withOpacity(.2),

                                            ),
                                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),

                                          ),

                                          SizedBox(height:12),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(16),
                                                color: Color(0xffEAF1DB)

                                            ),
                                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                            child: Text("5 BIDS"),

                                          ),
                                          SizedBox(height:12),
                                          Icon(Icons.favorite_border,color: Colors.grey,),
                                          SizedBox(height:12),
                                          Icon(Icons.open_in_full,color: Colors.grey,),
                                          SizedBox(height:12),
                                          // Container(
                                          //   padding: EdgeInsets.all(16),
                                          //   decoration: BoxDecoration(
                                          //     color:  Colors.lightBlueAccent.withOpacity(.2),
                                          //     borderRadius: BorderRadius.circular(32)
                                          //
                                          //   ),
                                          // )
                                          Image.asset("image/earth.png",height: 50,)
                                        ],
                                      ),
                                    )

                                  ],
                                )
                            ),

                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16,),
                  SizedBox(

                      width: MediaQuery.of(context).size.width,
                      child: Footer()),
                  SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                  )
                ],
              );
            }
          ),
        ),
      ),
      // bottomNavigationBar: Dashboard2Ui(),
    );
  }
}
class DrawDottedhorizontalline extends CustomPainter {
  double start=0.0,end=0.0;
  late Paint _paint;
  DrawDottedhorizontalline() {
    this.end;this.start;
    _paint = Paint();
    _paint.color = Color(0xff979797); //dots color
    _paint.strokeWidth = 1; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -300; i < 300; i = i + 15) {
      // 15 is space between dots
      if (i % 3 == 0)
        canvas.drawLine(Offset(i, 0.0), Offset(i + 10, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:giftex/data/network/models/responce/liveauction/upcommingauctionresponse.dart';
import 'package:giftex/screens/components/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:giftex/screens/liveauction/liveauction.dart';


class LiveItem extends StatefulWidget {
   LiveItem(this.auction,this. index);

  Auctions auction;
   int index;

  @override
  State<LiveItem> createState() => _LiveItemState();
}

class _LiveItemState extends State<LiveItem> {

  // FirebaseDatabase database = FirebaseDatabase.instance;
  // DatabaseReference? lotReference;
  @override
  void initState() {
    // TODO: implement initState
    // lotReference = database.ref("Lot/" + widget.auction.);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffFFFFFF),
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              top: 32,
              child: Container(
                //replace this Container with your Card
                color:  (widget.index % 2) == 0?Color(0xffF3E8E9):Color(0xffEAEEF2),
                height:220.0,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            (widget.index % 2) == 0? InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.network("${widget.auction.image}",height: 191,
                        width: 130,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 42,),
                        Text("Live Auctions",style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            letterSpacing: 2,
                            fontWeight: FontWeight.w900
                        ),),
                        SizedBox(height: 4,),
                        SizedBox(
                          width: 155,
                          child: Text("${widget.auction.auctionName}",style: Theme.of(context).textTheme.headline6!.copyWith(
                              letterSpacing: 1,
                              fontWeight: FontWeight.w900,
                              overflow: TextOverflow.ellipsis
                          ),),
                        ),
                        SizedBox(height: 4,),
                        // SizedBox(
                        //   width: 155,
                        //   child: Text("${widget.auction!.auctionName}",style: Theme.of(context).textTheme.headline6!.copyWith(
                        //     letterSpacing: 1,
                        //   ),),
                        // ),

                        InkWell(
                          onTap:(){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => LiveAuctionUiDetails(widget.auction)));
                            auctionViewModel.selectedAuction=widget.auction;

                            bottomViewModel.selectedIndex=8;

                          } ,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                            decoration: BoxDecoration(
                                color: Color(0xffE74B52),
                                borderRadius: BorderRadius.all(Radius.circular(16))
                            ),
                            child:  Text("EXPLORE",
                              textAlign: TextAlign.start,
                              style:
                              Theme.of(context).textTheme.button!.copyWith(
                                color: Colors.white,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),
                        Image.asset("image/calender.png",height: 24,color: Colors.red,),
                        SizedBox(height: 8,),
                        SizedBox(
                          child: Text("${widget.auction.displayDate}",
                            textAlign: TextAlign.start,
                            style:
                            Theme.of(context).textTheme.button!.copyWith(
                              color: Colors.black,
                              letterSpacing: 1,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ):InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 42,),
                          Text("Live Auctions",style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            letterSpacing: 2,
                            fontWeight: FontWeight.w900
                          ),),
                          SizedBox(height: 4,),
                          SizedBox(
                            width: 155,
                            child: Text("${widget.auction.auctionName}",style: Theme.of(context).textTheme.headline6!.copyWith(
                              letterSpacing: 1,
                                fontWeight: FontWeight.w900,
                                overflow: TextOverflow.ellipsis
                            ),),
                          ),
                          SizedBox(height: 4,),
                          // SizedBox(
                          //   width: 155,
                          //   child: Text("${widget.auction!.auctionName}",style: Theme.of(context).textTheme.headline6!.copyWith(
                          //     letterSpacing: 1,
                          //   ),),
                          // ),

                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                            decoration: BoxDecoration(
                                color: Color(0xff1F2A52),
                                borderRadius: BorderRadius.all(Radius.circular(16))
                            ),
                            child:  Text("EXPLORE",
                              textAlign: TextAlign.start,
                              style:
                              Theme.of(context).textTheme.button!.copyWith(
                                color: Colors.white,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 12,),
                          Image.asset("image/calender.png",height: 24,color:  Color(0xff1F2A52),),
                          SizedBox(height: 8,),
                          SizedBox(
                            child: Text("${widget.auction.displayDate}",
                              textAlign: TextAlign.start,
                              style:
                              Theme.of(context).textTheme.button!.copyWith(
                                color: Colors.black,
                                letterSpacing: 1,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.network("${widget.auction.image}",height: 191,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),



          ],
        )
    );
  }
}

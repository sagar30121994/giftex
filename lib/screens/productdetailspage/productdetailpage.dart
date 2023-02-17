

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../components/footer/footer.dart';
import '../components/header.dart';




class ProductDetailPage extends StatefulWidget {

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
        items: [
          PopupMenuItem(
            value: 1,
            child: Text("₹55,000", style:
            Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Color(0XFF2D2D2D),
              fontWeight: FontWeight.w400,
            ),),
          ),
          PopupMenuItem(
            value: 2,
            child: Text("₹60,000", style:
            Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Color(0XFF2D2D2D),
              fontWeight: FontWeight.w400,
            ),),
          ),
    PopupMenuItem(
            value: 3,
            child: Text("₹65,000", style:
            Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Color(0XFF2D2D2D),
              fontWeight: FontWeight.w400,
            ),),
          ),
          PopupMenuItem(
            value: 4,
            child: Text("₹70,000", style:
            Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Color(0XFF2D2D2D),
              fontWeight: FontWeight.w400,
            ),),
          ),
          PopupMenuItem(
            value: 4,
            child: Text("₹75,000", style:
            Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Color(0XFF2D2D2D),
              fontWeight: FontWeight.w400,
            ),),
          ),

    ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*.90,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Color(0xffF8F8F8),
                height: 260,
                child:  Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0,right: 25),
                      child: Image.asset("image/Bitmap6.png",height: 180,),
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
                        Icon(Icons.share_outlined,size: 22,color: Color(0xff6D905D),),
                        SizedBox(width: 20,),
                        Icon(Icons.bookmark_border,size: 24,color: Color(0xff6D905D),),
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
                    Text('Auction> Opulent Collectibles >Porcelain Pot ', style:
                    Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0XFF2D2D2D),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1
                    ),),
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
                          child: Text('Lot 01', style:
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
                    Text('FURNITURE \nDECORATIVE ART', style:
                    Theme.of(context).textTheme.headline6!.copyWith(
                      color: Color(0XFF2D2D2D),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2
                    ),),
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        Text('Yaminy Roy', style:
                        Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF466D33),
                          fontWeight: FontWeight.w600,
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
                              color: Color(0XFF466D33),
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
                    Text('₹50,000 - ₹75,000', style:
                    Theme.of(context).textTheme.subtitle1!.copyWith(
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
                            Text('₹50,000', style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
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
                            Text('₹55,000', style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0XFF7B9B6C),
                              fontWeight: FontWeight.w600,
                            ),),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 16,),
                    ElevatedButton(
                      style:   ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromRGBO(234,243, 231, 1)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xffFFFFFF),width: 0.38)
                              )
                          )
                      ),
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext dialogContext)
                            {
                              return AlertDialog(
                                contentPadding: EdgeInsets.all(0),
                                content: Container(
                                    padding: EdgeInsets.all(16),
                                    height: 580,
                                    width: MediaQuery.of(context).size.width,
                                    color: Color.fromRGBO(233, 227,191, 1),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Icon(Icons.close,size: 20,color: Color(0xff979797),)
                                        ],),
                                        Row(
                                          children: [
                                            Image.asset("image/Vector (22).png"),
                                            SizedBox(width: 5,),
                                            Text('ADDITIONAL CHARGES', style:
                                            Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Color(0XFF202232),
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 2
                                            ),),
                                          ],
                                        ),
                                        SizedBox(height: 16,),
                                        Container(

                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(16)),
                                            color: Color.fromRGBO(70, 109, 51, 1),
                                          ),
                                          child: Text('Lot 01', style:
                                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),),
                                        ),
                                        SizedBox(height: 16,),
                                        Text('Yaminy Roy', style:
                                        Theme.of(context).textTheme.subtitle1!.copyWith(
                                          color: Color(0XFF2D2D2D),
                                          fontWeight: FontWeight.w600,
                                        ),),
                                        SizedBox(height: 16,),
                                        Row(
                                          children: [
                                            Image.asset("image/Vector.png",height: 20,width: 20,color: Color(0xff466D33)),
                                            SizedBox(width: 16,),
                                            Text('Medium: Teracotta', style:
                                            Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Color(0XFF2D2D2D),
                                              fontWeight: FontWeight.w500,
                                            ),),
                                          ],
                                        ),
                                        SizedBox(height: 16,),
                                        Row(
                                          children: [
                                            Image.asset("image/Shape (8).png",height: 20,width: 20,color: Color(0xff466D33)),
                                            SizedBox(width: 16,),
                                            Text('Year: 1987', style:
                                            Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Color(0XFF2D2D2D),
                                              fontWeight: FontWeight.w500,
                                            ),),
                                          ],
                                        ),
                                        SizedBox(height: 16,),
                                        Row(
                                          children: [
                                            Image.asset("image/Vector (1).png",height: 20,width: 20,color: Color(0xff466D33)),
                                            SizedBox(width: 16,),
                                            Text('Size: 17cm X 15 Cm', style:
                                            Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Color(0XFF2D2D2D),
                                              fontWeight: FontWeight.w500,
                                            ),),
                                          ],
                                        ),
                                        SizedBox(height: 20,),
                                        Container(
                                          height: 210,
                                          width: MediaQuery.of(context).size.width*.7,
                                          color: Color(0xffD9D9D9),
                                          padding: EdgeInsets.all(16),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text('Price', style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0XFF202232),
                                                    fontWeight: FontWeight.w400,
                                                  ),),
                                                  Spacer(),
                                                  Text('₹ 17,11,871', style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0XFF202232),
                                                    fontWeight: FontWeight.w400,
                                                  ),),
                                                ],
                                              ),
                                              SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  Text('15% Margin', style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0XFF202232),
                                                    fontWeight: FontWeight.w400,
                                                  ),),
                                                  Spacer(),
                                                  Text('₹ 17,11,871', style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0XFF202232),
                                                    fontWeight: FontWeight.w400,
                                                  ),),
                                                ],
                                              ),
                                              SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  Text('GST on Lot (12 %)', style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0XFF202232),
                                                    fontWeight: FontWeight.w400,
                                                  ),),
                                                  Spacer(),
                                                  Text('₹ 17,11,871', style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0XFF202232),
                                                    fontWeight: FontWeight.w400,
                                                  ),),
                                                ],
                                              ),
                                              SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  Text('TCS(0.1 %)', style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0XFF202232),
                                                    fontWeight: FontWeight.w400,
                                                  ),),
                                                  Spacer(),
                                                  Text('₹ 17,11,871', style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0XFF202232),
                                                    fontWeight: FontWeight.w400,
                                                  ),),
                                                ],
                                              ),
                                              SizedBox(height: 10,),
                                             Image.asset("image/Line 24.png"),
                                              SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  Text('Total', style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0XFF202232),
                                                    fontWeight: FontWeight.w600,
                                                  ),),
                                                  Spacer(),
                                                  Text('₹ 17,11,871', style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0XFF202232),
                                                    fontWeight: FontWeight.w600,
                                                  ),),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        ElevatedButton(
                                          style:   ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(Color(0XFFE9E3BF)),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20.0),
                                                      side: BorderSide(color: Color(0xff466D33),width: 0.5)
                                                  )
                                              )
                                          ),
                                          onPressed: (){
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 0.0,left: 0,top: 12,bottom: 12),
                                            child: Text('UPDATE YOUR BILLING DETAILS', style:
                                            Theme.of(context).textTheme.caption!.copyWith(
                                              color: Color(0XFF6D905D),
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1.33333
                                            ),),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text('Note: Crating and shipping charged separately depending on delivery location.',
                                          textAlign: TextAlign.center,
                                          style:
                                        Theme.of(context).textTheme.caption!.copyWith(
                                          color: Color(0XFF2D2D2D).withOpacity(0.61),
                                          fontWeight: FontWeight.w400,
                                        ),),
                                      ],
                                    ),
                                  ),

                                ),
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0,left: 5,top: 10,bottom: 10),
                        child: Text('View Additional charges', style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0XFF6D905D),
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline
                        ),),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text('Description', style:
                    Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Color(0XFF202232),
                      fontWeight: FontWeight.w500,
                    ),),
                    SizedBox(height: 10,),
                    Text('We feature premium artworks including modern, contemporary, and street art, so you can find works by your favorite artists—and discover new ones', style:
                    Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0XFF747474),
                      fontWeight: FontWeight.w400,
                    ),),
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        Image.asset("image/Vector.png",height: 20,width: 20,color: Color(0xff466D33)),
                        SizedBox(width: 16,),
                        Text('Medium: Teracotta', style:
                        Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF2D2D2D),
                          fontWeight: FontWeight.w500,
                        ),),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        Image.asset("image/Shape (8).png",height: 20,width: 20,color: Color(0xff466D33)),
                        SizedBox(width: 16,),
                        Text('Year: 1987', style:
                        Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF2D2D2D),
                          fontWeight: FontWeight.w500,
                        ),),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        Image.asset("image/Vector (1).png",height: 20,width: 20,color: Color(0xff466D33)),
                        SizedBox(width: 16,),
                        Text('Size: 17cm X 15 Cm', style:
                        Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF2D2D2D),
                          fontWeight: FontWeight.w500,
                        ),),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
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
                        ElevatedButton(
                          style:   ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(234,243, 231, 1)),
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
                            child: Text('10hrs: 20Mins: 10sec', style:
                            Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0XFF2D2D2D),
                                fontWeight: FontWeight.w500,
                                // decoration: TextDecoration.underline
                            ),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style:   ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0XFFFFFFFF)),
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
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.33333
                            ),),
                          ),
                        ),
                        SizedBox(width: 10,),
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
                          },
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
                      ],
                    ),
                    SizedBox(height: 16,),
                    Container(
                        height: 280,
                        child: CustomScrollView(
                            slivers: [
                          SliverPinnedHeader(
                              child: Row(

                                children: [
                                  Container(
                                    height: 55,
                                    padding: EdgeInsets.all(15),
                                    width: MediaQuery.of(context).size.width/3.2,
                                    decoration: BoxDecoration(
                                        color: Color(0xffFAF7E5),
                                      image: DecorationImage(
                                        image: AssetImage("image/Shape (7).png"), fit: BoxFit.cover,
                                      )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset("image/1.png",height: 20,),
                                        SizedBox(width: 5,),
                                        Text('BIDDER', style:
                                        Theme.of(context).textTheme.caption!.copyWith(
                                          color: Color(0XFF2D2D2D),
                                          fontWeight: FontWeight.w600,
                                        ),),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Container(
                                    height: 50,
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width/3.7,
                                    decoration: BoxDecoration(
                                        color: Color(0xffFAF7E5),
                                      image: DecorationImage(
                                        image: AssetImage("image/Shape (7).png"), fit: BoxFit.cover,
                                      )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset("image/date.png",height: 20,),
                                        SizedBox(width: 10,),
                                        Text('DATE &\nTIME', style:
                                        Theme.of(context).textTheme.caption!.copyWith(
                                          color: Color(0XFF2D2D2D),
                                          fontWeight: FontWeight.w600,
                                        ),),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Container(
                                    height: 50,
                                    padding: EdgeInsets.all(15),
                                    width: MediaQuery.of(context).size.width/3.4,
                                    decoration: BoxDecoration(
                                        color: Color(0xffFAF7E5),
                                      image: DecorationImage(
                                        image: AssetImage("image/Shape (7).png"), fit: BoxFit.cover,
                                      )
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset("image/Vector (2).png",height: 15,fit: BoxFit.cover,),
                                        SizedBox(width: 5,),
                                        Text('AMOUNT', style:
                                        Theme.of(context).textTheme.caption!.copyWith(
                                          color: Color(0XFF2D2D2D),
                                          fontWeight: FontWeight.w600,
                                        ),),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          SliverAnimatedPaintExtent(
                            duration: const Duration(milliseconds: 150),
                            child: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                  return Container(
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
                                                child: Text('Lorem Ipsum', style:
                                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Color(0XFF2D2D2D),
                                                  fontWeight: FontWeight.w400,
                                                ),),
                                              ),
                                              SizedBox(width: 15,),
                                              Container(
                                                // padding: EdgeInsets.all(15),
                                                width: MediaQuery.of(context).size.width/3.4,
                                                child: Text('3 Aug, 16.30 IST',textAlign: TextAlign.center, style:
                                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Color(0XFF2D2D2D),
                                                  fontWeight: FontWeight.w400,
                                                ),),
                                              ),
                                              SizedBox(width: 5,),
                                              Container(
                                                // padding: EdgeInsets.all(15),
                                                width: MediaQuery.of(context).size.width/3.5,
                                                child: Text('₹50,000', style:
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
                                  );
                                },
                                // 40 list items
                                childCount: 5,
                              ),
                            ),
                          ),
                        ])
                    ),
                    SizedBox(height: 26,),
                    Text('About Artist', style:
                    Theme.of(context).textTheme.headline6!.copyWith(
                      color: Color(0XFF202232),
                      fontWeight: FontWeight.w600,
                    ),),
                    SizedBox(height: 10,),
                    Text('Bid on works you love with auctions. With bidding opening daily, connects collectors like you to art from leading auction houses, nonprofit organizations, and sellers across the globe.', style:
                    Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0XFF000000),
                      fontWeight: FontWeight.w400,
                    ),),
                    SizedBox(height: 16,),
                    Container(
                      color: Color(0xffFFFFFF),
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
                        height: 280,
                        child: CustomScrollView(slivers: [
                          SliverAnimatedPaintExtent(
                            duration: const Duration(milliseconds: 150),
                            child: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                  return Container(
                                      padding: EdgeInsets.only(top: 10),
                                      color: Color(0xffFFFFFF),
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image.asset("image/Vector (3).png",height: 25,width: 25,),
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
                        height: 500,
                        child: CustomScrollView(slivers: [
                          SliverAnimatedPaintExtent(
                            duration: const Duration(milliseconds: 150),
                            child: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                        color: Color(0xffFFFFFF),
                                        height:450,
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
                                            Padding(
                                              padding: const EdgeInsets.only(left: 25.0,right: 25),
                                              child: Image.asset("image/Bitmap6.png",height: 180,),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(top: 370 / 2.0,bottom: 0,left: 25.0,right: 25),
                                                child:Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(width: 20,),
                                                    Text("Jamini Roy",
                                                      textAlign: TextAlign.center,
                                                      style:
                                                      Theme.of(context).textTheme.headline6!.copyWith(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w600,
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
                                                            Text("Bid Closing in",
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
                                                                fontWeight: FontWeight.w600,
                                                              ),
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
                                                                color: Color(0xff202232),
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
                                                            child: Text('Proxy Bid', style:
                                                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                                              color: Color(0XFF2D2D2D),
                                                              fontWeight: FontWeight.w600,
                                                            ),),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10,),
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
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                                            child: Text('Buy Now', style:
                                                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                                              color: Color(0XFFFFFFFF),
                                                              fontWeight: FontWeight.w600,
                                                            ),),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                  );
                                },
                                // 40 list items
                                childCount: 1,
                              ),
                            ),
                          ),
                        ])
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16,),
              SizedBox(
                  height: 820,
                  width: MediaQuery.of(context).size.width,
                  child: Footer()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Dashboard2Ui(),
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
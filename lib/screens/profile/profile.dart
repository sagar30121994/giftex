

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';
import 'package:giftex/screens/profile/myauctionreview.dart';
import 'package:giftex/screens/profile/mygallary.dart';
import 'package:giftex/screens/profile/myprofile.dart';
import 'package:giftex/screens/profile/orderhistory.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../components/header.dart';
import '../customepaint.dart';

class Profilepage extends StatefulWidget {
  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*.90,
        // padding: EdgeInsets.only(top: 16,left: 16,right: 16),
        child: SingleChildScrollView(

            child:Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  // width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [

                          Image.asset("image/Ellipse 94.png",height: 75,),
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('image/image 40.png'),
                            // child: Image.asset("image/image 40.png",fit: BoxFit.fill,),
                          ),
                        ],
                      ),
                      SizedBox(width: 10,),
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
                                        TextSpan(text: 'Hello ',style:  Theme.of(context).textTheme.headline6!.copyWith(
                                          color: Color(0xff8DAB7F),
                                          fontWeight: FontWeight.bold,),),
                                        TextSpan(text: 'Aryan R.', style:  Theme.of(context).textTheme.headline6!.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,),),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 3,),
                                  Row(
                                    children: [
                                      Image.asset("image/Vector (11).png",height: 16,color: Colors.yellow,),
                                      SizedBox(width: 3,),
                                      Text("Mumbai. India",
                                        textAlign: TextAlign.center,
                                        style:
                                        Theme.of(context).textTheme.bodyText1!.copyWith(
                                          color: Color(0xff2D2D2D),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(width: 16,),
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
                                  child: Row(
                                    children: [
                                      Text('EDIT', style:
                                      Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: Theme.of(context).colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2
                                      ),),
                                      
                                      SizedBox(width: 5,),
                                      Icon(Icons.edit_outlined, color: Color(0XFF2D2D2D),size: 15,)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3,),
                          Container(
                            width: MediaQuery.of(context).size.width*.6,
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
                              textAlign: TextAlign.left,
                              style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
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
                SizedBox(height: 16,),
                Container(
                  height: 510,margin: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    image: DecorationImage  (
                      image: AssetImage("image/Rectangle 1622.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("MY ACCOUNT",
                        textAlign: TextAlign.left,
                        style:
                        Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilepage()));
                              },
                              child: Row(
                                children: [
                                  Image.asset("image/Group (16).png",height: 23,color: Color(0xff7F986B),),
                                  SizedBox(width: 10,),
                                  Text("MY PROFILE",
                                    textAlign: TextAlign.left,
                                    style:
                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0xff7F986B),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16,),
                            Image.asset("image/Line 45.png",width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                            SizedBox(height: 16,),
                           InkWell(
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrderHistorypage()));
                             },
                             child: Row(
                                children: [
                                  Image.asset("image/Group (13).png",height: 32,color: Color(0xff7F986B),),
                                  SizedBox(width: 10,),
                                  Text("MY ORDER HISTORY",
                                    textAlign: TextAlign.left,
                                    style:
                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0xff7F986B),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                           ),
                            SizedBox(height: 16,),
                            Image.asset("image/Line 45.png",width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                            SizedBox(height: 16,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyGallarypage()));
                              },
                              child: Row(
                                children: [
                                  Image.asset("image/Group (14).png",height: 23,color: Color(0xff7F986B),),
                                  SizedBox(width: 10,),
                                  Text("MY GALLERY",
                                    textAlign: TextAlign.left,
                                    style:
                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0xff7F986B),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16,),
                            Image.asset("image/Line 45.png",width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                            SizedBox(height: 16,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyAuctionReviewpage()));
                              },
                              child: Row(
                                children: [
                                  Image.asset("image/Group (15).png",height: 32,color: Color(0xff7F986B),),
                                  SizedBox(width: 10,),
                                  Text("MY AUCTION REVIEW",
                                    textAlign: TextAlign.left,
                                    style:
                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0xff7F986B),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16,),
                            Image.asset("image/Line 45.png",width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                            SizedBox(height: 16,),
                            Row(
                              children: [
                                Image.asset("image/Group (17).png",height: 27,color: Color(0xff7F986B),),
                                SizedBox(width: 10,),
                                Text("AUCTION DASHBOARD",
                                  textAlign: TextAlign.left,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0xff7F986B),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Image.asset("image/Line 45.png",width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                            SizedBox(height: 70,),
                            Container(
                              color: Color(0xffE6EEF0),
                              padding: EdgeInsets.only(top: 16,bottom: 16,left: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.logout,size: 20,color: Color(0xff3A3C38),),
                                  SizedBox(width: 10,),
                                  Text("Log Out",
                                    textAlign: TextAlign.left,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff3A3C38),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                )
              ],
            )
        ),
      ),
      // bottomNavigationBar: Dashboard2Ui(),
    );
  }
}

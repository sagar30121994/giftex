

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';
import 'package:giftex/screens/profile/orderproductdetails.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../customepaint.dart';

class OrderPlacedpage extends StatefulWidget {
  @override
  _OrderPlacedpageState createState() => _OrderPlacedpageState();
}
enum AddressLoc { abc, ab, ac }
class _OrderPlacedpageState extends State<OrderPlacedpage> {
  String shippingType="CONTACT INFORMATION";
  AddressLoc _loc = AddressLoc.abc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   bottomOpacity: 0,
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   leading:
      // ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/Rectangle 12.png"),
                fit: BoxFit.cover,
                opacity: 8
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 500,
                  child: Stack(
                    children: [
                      Image.asset("image/Shape (17).png"),
                      Image.asset("image/Shape (18).png"),
                      Padding(
                        padding: const EdgeInsets.only(top: 90.0,left: 100),
                        child: Column(
                          children: [
                            Image.asset("image/Group 14403.png"),
                            SizedBox(height: 10,),
                            Text("THANK YOU",
                              textAlign: TextAlign.start,
                              style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                color: Color(0xff6D905D),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("Your Order is Placed",
                              textAlign: TextAlign.start,
                              style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text("Order Summary",
                              textAlign: TextAlign.start,
                              style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0xff6D905D),
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                                border: Border.all(color: Color(0xff6D905D))
                              ),
                              child:Text("Continue Shopping",
                                textAlign: TextAlign.start,
                                style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text("Are you interested in Bidding?",
                      textAlign: TextAlign.start,
                      style:
                      Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Color(0xff807D7D),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Participate in Auction",
                      textAlign: TextAlign.start,
                      style:
                      Theme.of(context).textTheme.headline6!.copyWith(
                        color: Color(0xffE3BE5D),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 50,
                      child: Center(
                        child: ElevatedButton(
                          style:   ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0XFF466D33)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    // side: BorderSide(color: Colors.red)
                                  )
                              )
                          ),
                          onPressed: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPlacedpage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0,left: 16,top: 12,bottom: 12),
                            child: Text('REGISTER NOW', style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0XFFFFFFFF),
                              fontWeight: FontWeight.w600,
                            ),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: 50,
                      child: Center(
                        child: ElevatedButton(
                          style:   ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0XFFFFFFFF)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(color: Color(0xff000000).withOpacity(0.33))
                                  )
                              )
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardUi(0)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0,left: 16,top: 12,bottom: 12),
                            child: Text('Skip for now', style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0XFF7B9B6C),
                              fontWeight: FontWeight.w600,
                            ),),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          )
      ),
    );
  }

}
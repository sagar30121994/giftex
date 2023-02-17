

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';
import 'package:giftex/screens/ecommercecard/orderplaced.dart';
import 'package:giftex/screens/profile/orderproductdetails.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../customepaint.dart';

class Cardpage extends StatefulWidget {
  @override
  _CardpageState createState() => _CardpageState();
}
enum AddressLoc { abc, ab, ac }
class _CardpageState extends State<Cardpage> {
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
              SizedBox(height: 35,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset("image/app1.png"),
                  ],
                ),
              ),
              Container(

                // color: Color(0xffFFFFFF),
                child: DefaultTabController(
                  length: 3,
                  child:  DecoratedBox(
                    decoration: BoxDecoration(
                      //This is for background color
                      color: Colors.white.withOpacity(0.0),

                      //This is for bottom border that is needed
                      border: Border(
                          bottom: BorderSide(color: Color(0xffDFDFDF), width: 2)),
                    ),
                    child: TabBar(
                      onTap: (index) {
                        setState(() {

                          if(index==0) {
                          shippingType="CONTACT INFORMATION";}
                          if(index==1) {
                          shippingType="SHIPPING INFO";}
                          if(index==2) {
                          shippingType="PAYMENT";}
                        });
                        print(index);
                      },
                      isScrollable: true,
                      indicator: UnderlineTabIndicator(
                        borderSide:
                        BorderSide(color: Color(0xff8DAB7F), width: 2.0),
                      ),
                      padding: EdgeInsets.all(0),
                      labelPadding:  EdgeInsets.all(10),
                      unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.59),
                      labelColor: const Color(0xFF2D2D2D),
                      labelStyle:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w400,),
                      tabs: [
                        Tab(
                            text: "CONTACT INFORMATION"
                        ),
                        Tab(
                            text: "SHIPPING INFO"
                        ),
                        Tab(
                            text: "PAYMENT"
                        ),

                      ],
                    ),
                  ),

                ),
              ),
              shippingType=="CONTACT INFORMATION"?Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Personal Details",
                          textAlign: TextAlign.start,
                          style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("image/Rectangle 1536.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text("Aryan Raj Kumar",
                                textAlign: TextAlign.start,
                                style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 16,),
                              Text("+91 9645674323",
                                textAlign: TextAlign.start,
                                style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.edit,color: Colors.black,size: 15,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        Icon(Icons.arrow_back, color: Color(0xff788995),size: 20,),
                        SizedBox(width: 10,),
                        Text("Return to Shop",
                          textAlign: TextAlign.start,
                          style:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Color(0xff788995),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
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
                                shippingType="SHIPPING INFO";
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                child: Text('Next', style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Color(0XFFFFFFFF),
                                  fontWeight: FontWeight.w600,
                                ),),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16,),
                    Container(
                      height:630,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("image/Rectangle 1490.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child:Column(
                        children: [
                          Row(
                            children: [
                              Text("Shopping Cart",
                                textAlign: TextAlign.start,
                                style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Image.asset("image/Line 45.png",width: MediaQuery.of(context).size.width*.8,fit: BoxFit.cover,),
                          SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("image/Bitmap (9).png",),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("JAMINI ROY",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("Mother & Child",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff747474),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("₹1000",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff788995),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Remove",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xffF68C75),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5,),
                              Row( mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Image.asset("image/Line 44.png"),
                                ],
                              ),
                              SizedBox(width: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("image/Shape (15).png"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("image/Bitmap (9).png",),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("MF. HUSSAIN",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("Mother & Child",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff747474),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("₹1000",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff788995),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Remove",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xffF68C75),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5,),
                              Row( mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Image.asset("image/Line 44.png"),
                                ],
                              ),
                              SizedBox(width: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("image/Shape (15).png"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Color(0xff000000)),
                            ),
                            child: Row(
                              children: [
                                Image.asset("image/Shape (15).png"),
                                SizedBox(width: 15,),
                                Text("Add More From Wishlist",
                                  textAlign: TextAlign.start,
                                  style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios_sharp,color: Color(0xff000000),size: 15,)
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                          Container(
                            height: 200,
                            padding: EdgeInsets.all(016),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("image/Rectangle 1494.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Product MRP",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("₹ 50,000",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Text("Shipping",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("₹ 1,000",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Text("GST (18 %)",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("₹ 4,000",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Image.asset("image/Line 45.png"),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Text("Total",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("₹ 55,000",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                          Container(
                            height: 50,
                            width: 200,
                            padding: EdgeInsets.all(016),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("image/Rectangle 1572.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              children: [
                                Image.asset("image/app2.png"),
                                SizedBox(width: 10,),
                                Text("CONTINUE SHOPPING",
                                  textAlign: TextAlign.start,
                                  style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                        ],
                      ),
                    ),
                  ],
                ),
              ):Container(),
              shippingType=="SHIPPING INFO"?Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Confirm Shipping Address",
                          textAlign: TextAlign.start,
                          style:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        Container(
                          // margin: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width*.8,
                          height: 38,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 6,
                                  color: Color.fromRGBO(226, 223, 202, 0.39),
                                ),
                                BoxShadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 8,
                                  color: Color.fromRGBO(226, 223, 202, 0.39),
                                )
                              ],
                              border: Border.all(color: Color(0xffDDE3E8),width: 1),
                              // image: DecorationImage(
                              //   image: AssetImage("image/Rectangle 2 (2).png"),
                              //   fit: BoxFit.cover,
                              // ),
                              color: Colors.white
                          ),
                          child: Center(
                            child: TextFormField(
                              maxLines: 1,
                              // controller: userInput,
                              style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  // userInput.text = value.toString();
                                });
                              },
                              decoration: InputDecoration(
                                isDense: true,
                                focusColor: Colors.white,
                                border: InputBorder.none,
                                fillColor: Colors.grey,
                                hintText: "Search Area",
                                //make hint text
                                prefixIcon: Icon(Icons.search),
                                hintStyle:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Color(0xff979797),
                                  fontWeight: FontWeight.w500,
                                ),

                                //create lable
                                // labelText: 'Email/Mobile',
                                //lable style
                                labelStyle:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 6,),
                        Container(
                          // margin: EdgeInsets.all(15),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 6,
                                  color: Color.fromRGBO(226, 223, 202, 0.39),
                                ),
                                BoxShadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 8,
                                  color: Color.fromRGBO(226, 223, 202, 0.39),
                                )
                              ],
                              border: Border.all(color: Color(0xffDDE3E8),width: 1),
                              // image: DecorationImage(
                              //   image: AssetImage("image/Rectangle 2 (2).png"),
                              //   fit: BoxFit.cover,
                              // ),
                              color: Colors.white
                          ),
                          child: Image.asset("image/Vector (11).png"),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Image.asset("image/MAp.png"),
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        Text("Enter Complete Address",
                          textAlign: TextAlign.start,
                          style:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      // margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 6,
                              color: Color.fromRGBO(226, 223, 202, 0.39),
                            ),
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 8,
                              color: Color.fromRGBO(226, 223, 202, 0.39),
                            )
                          ],
                          border: Border.all(color: Color(0xffDDE3E8),width: 1),
                          // image: DecorationImage(
                          //   image: AssetImage("image/Rectangle 2 (2).png"),
                          //   fit: BoxFit.cover,
                          // ),
                          color: Colors.white
                      ),
                      child: TextFormField(
                        maxLines: 3,
                        // controller: userInput,
                        style:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                        onChanged: (value) {
                          setState(() {
                            // userInput.text = value.toString();
                          });
                        },
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          border: InputBorder.none,
                          fillColor: Colors.grey,

                          hintText: "Flat No, Floor, Building Name,Street Name, Landmarks,Contact No, etc.",

                          //make hint text
                          hintStyle:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Color(0xff2D2D2D).withOpacity(0.4),
                            fontWeight: FontWeight.w500,
                          ),

                          //create lable
                          // labelText: 'Email/Mobile',
                          //lable style
                          labelStyle:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    // Text(userInput.toString()),

              SizedBox(height: 10,),
                    Container(

                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 6,
                              color: Color.fromRGBO(226, 223, 202, 0.39),
                            ),
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 8,
                              color: Color.fromRGBO(226, 223, 202, 0.39),
                            )
                          ],
                        border: Border.all(color: Color(0xffDDE3E8),width: 1),
                        // image: DecorationImage(
                        //   image: AssetImage("image/Rectangle 2 (2).png"),
                        //   fit: BoxFit.cover,
                        // ),
                        color: Colors.white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Radio(
                            value: AddressLoc.abc,
                            groupValue: _loc,
                            onChanged: (AddressLoc? value) {
                              setState(() {
                                _loc = value!;
                              });
                            },
                          ),
                          SizedBox(width: 5,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Standart Delivery",
                                textAlign: TextAlign.start,
                                style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*.6,
                                child: Text("Estimated 14-20 Day Shipping (Duties and taxes may be due upon delivery)",
                                  textAlign: TextAlign.start,
                                  style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0xff788995),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text("Free",
                            textAlign: TextAlign.start,
                            style:
                            Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    Container(

                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 6,
                              color: Color.fromRGBO(226, 223, 202, 0.39),
                            ),
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 8,
                              color: Color.fromRGBO(226, 223, 202, 0.39),
                            )
                          ],
                        border: Border.all(color: Color(0xffDDE3E8),width: 1),
                        // image: DecorationImage(
                        //   image: AssetImage("image/Rectangle 2 (2).png"),
                        //   fit: BoxFit.cover,
                        // ),
                        color: Colors.white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Radio(
                            value: AddressLoc.abc,
                            groupValue: _loc,
                            onChanged: (AddressLoc? value) {
                              setState(() {
                                _loc = value!;
                              });
                            },
                          ),
                          SizedBox(width: 5,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Fast Delivery",
                                textAlign: TextAlign.start,
                                style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*.5,
                                child: Text("Estimated 14-20 Day Shipping (Duties and taxes may be due upon delivery)",
                                  textAlign: TextAlign.start,
                                  style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0xff788995),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text("₹1000",
                            textAlign: TextAlign.start,
                            style:
                            Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        Icon(Icons.arrow_back, color: Color(0xff788995),size: 20,),
                        SizedBox(width: 10,),
                        Text("Back to Customer Info",
                          textAlign: TextAlign.start,
                          style:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Color(0xff788995),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
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
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                child: Text('Next', style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Color(0XFFFFFFFF),
                                  fontWeight: FontWeight.w600,
                                ),),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16,),
                    Container(
                      height:630,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("image/Rectangle 1490.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child:Column(
                        children: [
                          Row(
                            children: [
                              Text("Shopping Cart",
                                textAlign: TextAlign.start,
                                style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Image.asset("image/Line 45.png",width: MediaQuery.of(context).size.width*.8,fit: BoxFit.cover,),
                          SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("image/Bitmap (9).png",),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("JAMINI ROY",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("Mother & Child",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff747474),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("₹1000",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff788995),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Remove",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xffF68C75),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5,),
                              Row( mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Image.asset("image/Line 44.png"),
                                ],
                              ),
                              SizedBox(width: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("image/Shape (15).png"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("image/Bitmap (9).png",),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("MF. HUSSAIN",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("Mother & Child",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff747474),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("₹1000",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff788995),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Remove",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xffF68C75),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5,),
                              Row( mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Image.asset("image/Line 44.png"),
                                ],
                              ),
                              SizedBox(width: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("image/Shape (15).png"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Color(0xff000000)),
                            ),
                            child: Row(
                              children: [
                                Image.asset("image/Shape (15).png"),
                                SizedBox(width: 15,),
                                Text("Add More From Wishlist",
                                  textAlign: TextAlign.start,
                                  style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios_sharp,color: Color(0xff000000),size: 15,)
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                          Container(
                            height: 200,
                            padding: EdgeInsets.all(016),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("image/Rectangle 1494.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Product MRP",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("₹ 50,000",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Text("Shipping",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("₹ 1,000",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Text("GST (18 %)",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("₹ 4,000",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Image.asset("image/Line 45.png"),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Text("Total",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("₹ 55,000",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                          Container(
                            height: 50,
                            width: 200,
                            padding: EdgeInsets.all(016),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("image/Rectangle 1572.png"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              children: [
                                Image.asset("image/app2.png"),
                                SizedBox(width: 10,),
                                Text("CONTINUE SHOPPING",
                                  textAlign: TextAlign.start,
                                  style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                        ],
                      ),
                    ),
                  ],
                ),
              ):Container(),
              shippingType=="PAYMENT"?Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Payment Selection",
                          textAlign: TextAlign.start,
                          style:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    SizedBox(height: 10,),
                    Container(

                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 6,
                              color: Color.fromRGBO(226, 223, 202, 0.39),
                            ),
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 8,
                              color: Color.fromRGBO(226, 223, 202, 0.39),
                            )
                          ],
                        border: Border.all(color: Color(0xffDDE3E8),width: 1),
                        // image: DecorationImage(
                        //   image: AssetImage("image/Rectangle 2 (2).png"),
                        //   fit: BoxFit.cover,
                        // ),
                        color: Colors.white
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:30,
                                    child: Radio(
                                      value: AddressLoc.abc,
                                      groupValue: _loc,
                                      onChanged: (AddressLoc? value) {
                                        setState(() {
                                          _loc = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Credit Card / Debit Card",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.6,
                                    child: Text("Safe money transfer using your bank account. Visa, Maestro,Discover, Americn Express",
                                      textAlign: TextAlign.start,
                                      style:
                                      Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: Color(0xff788995),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("image/visa (1) 1.png",width: 40,height: 40,fit: BoxFit.fill,),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: TextField(
                              // controller: nameController,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Card Number',
                                  hintText: '`Card Number',
                                  filled: false,
                                  fillColor: Color(0xffF9F9F9),
                                  isDense: true
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Image.asset("image/Line 45.png",width: MediaQuery.of(context).size.width*.8,fit: BoxFit.cover,),
                          SizedBox(height: 10,),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: TextField(
                              // controller: nameController,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Name on Card',
                                  hintText: '`Name on Card',
                                  filled: false,
                                  fillColor: Color(0xffF9F9F9),
                                  isDense: true
                              ),
                            ),
                          ),
                          Image.asset("image/Line 45.png",width: MediaQuery.of(context).size.width*.8,fit: BoxFit.cover,),
                          SizedBox(height: 10,),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: TextField(
                              // controller: nameController,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Expiry',
                                  hintText: '`Expiry',
                                  filled: false,
                                  fillColor: Color(0xffF9F9F9),
                                  isDense: true
                              ),
                            ),
                          ),
                         
                          Image.asset("image/Line 45.png",width: MediaQuery.of(context).size.width*.8,fit: BoxFit.cover,),
                          SizedBox(height: 10,),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: TextField(
                              // controller: nameController,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'CVV',
                                  hintText: '`CVV',
                                  filled: false,
                                  fillColor: Color(0xffF9F9F9),
                                  isDense: true
                              ),
                            ),
                          ),
                          
                          Image.asset("image/Line 45.png",width: MediaQuery.of(context).size.width*.8,fit: BoxFit.cover,),
                          SizedBox(height: 16,),
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    Container(

                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 6,
                              color: Color.fromRGBO(226, 223, 202, 0.39),
                            ),
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 8,
                              color: Color.fromRGBO(226, 223, 202, 0.39),
                            )
                          ],
                        border: Border.all(color: Color(0xffDDE3E8),width: 1),
                        // image: DecorationImage(
                        //   image: AssetImage("image/Rectangle 2 (2).png"),
                        //   fit: BoxFit.cover,
                        // ),
                        color: Colors.white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width:30,
                                child: Radio(
                                  value: AddressLoc.abc,
                                  groupValue: _loc,
                                  onChanged: (AddressLoc? value) {
                                    setState(() {
                                      _loc = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 5,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Paypal",
                                textAlign: TextAlign.start,
                                style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 5,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*.6,
                                child: Text("Safe money transfer using your bank account. Visa, Maestro,Discover, Americn Express",
                                  textAlign: TextAlign.start,
                                  style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0xff788995),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("image/paypal 1.png",width: 50,height: 50,fit: BoxFit.fill,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        Icon(Icons.arrow_back, color: Color(0xff788995),size: 20,),
                        SizedBox(width: 10,),
                        Text("Back to Shipping Info",
                          textAlign: TextAlign.start,
                          style:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Color(0xff788995),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPlacedpage()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                child: Text('Next', style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Color(0XFFFFFFFF),
                                  fontWeight: FontWeight.w600,
                                ),),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16,),
                    Container(
                      height:630,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("image/Rectangle 1490.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child:Column(
                        children: [
                          Row(
                            children: [
                              Text("Shopping Cart",
                                textAlign: TextAlign.start,
                                style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Image.asset("image/Line 45.png",width: MediaQuery.of(context).size.width*.8,fit: BoxFit.cover,),
                          SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("image/Bitmap (9).png",),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("JAMINI ROY",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("Mother & Child",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff747474),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("₹1000",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff788995),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Remove",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xffF68C75),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5,),
                              Row( mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Image.asset("image/Line 44.png"),
                                ],
                              ),
                              SizedBox(width: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("image/Shape (15).png"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("image/Bitmap (9).png",),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("MF. HUSSAIN",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("Mother & Child",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff747474),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("₹1000",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff788995),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Remove",
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xffF68C75),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5,),
                              Row( mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Image.asset("image/Line 44.png"),
                                ],
                              ),
                              SizedBox(width: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("image/Shape (15).png"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Color(0xff000000)),
                            ),
                            child: Row(
                              children: [
                                Image.asset("image/Shape (15).png"),
                                SizedBox(width: 15,),
                                Text("Add More From Wishlist",
                                  textAlign: TextAlign.start,
                                  style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios_sharp,color: Color(0xff000000),size: 15,)
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                          Container(
                            height: 200,
                            padding: EdgeInsets.all(016),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("image/Rectangle 1494.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Product MRP",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("₹ 50,000",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Text("Shipping",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("₹ 1,000",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Text("GST (18 %)",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("₹ 4,000",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16,),
                                Image.asset("image/Line 45.png"),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Text("Total",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Text("₹ 55,000",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                          Container(
                            height: 50,
                            width: 200,
                            padding: EdgeInsets.all(016),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("image/Rectangle 1572.png"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              children: [
                                Image.asset("image/app2.png"),
                                SizedBox(width: 10,),
                                Text("CONTINUE SHOPPING",
                                  textAlign: TextAlign.start,
                                  style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                        ],
                      ),
                    ),
                  ],
                ),
              ):Container(),

            ],
          ),
        )
      ),
    );
  }

}
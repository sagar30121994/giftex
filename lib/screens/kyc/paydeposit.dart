

// import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:giftex/data/network/models/responce/user/loginrespose.dart';
import 'package:giftex/screens/kyc/kycaddressdetails.dart';
import 'package:giftex/screens/kyc/kycpage.dart';
import 'package:giftex/viewmodel/user/loginviewmodel.dart';

class  KYCPayDepositpage extends StatefulWidget {

  @override
  _KYCPayDepositpageState createState() => _KYCPayDepositpageState();
}
enum Biding { bid1, bid2, bid3 }

class _KYCPayDepositpageState extends State<KYCPayDepositpage> {
  TextEditingController dobController=TextEditingController();
  Biding? _bid=Biding.bid1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Color(0xffF7FAFD),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 270,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0,bottom: 0,right:0,left: 0),
                          child: Image.asset("image/Shapebh.png", height: 200.0,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0,bottom: 0,right:0,left: 0),
                          child: Image.asset("image/Shapebgup.png", height: 130.0,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20,bottom: 0,right:0,left:100),
                          child: Image.asset("image/Group 14128.png",),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 70,bottom: 0,right:0,left:130),
                          child: Image.asset("image/Group 14127 (3).png", height:120.0,width: 120,fit: BoxFit.cover,),
                        ),

                        InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 16,bottom: 0,right:0,left: 16),
                            child: Icon(Icons.arrow_back,color: Colors.grey,size: 32,),
                          ),
                        ),

                      ],
                    )),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("PAY DEPOSIT",
                            textAlign: TextAlign.center,
                            style:
                            Theme.of(context).textTheme.headline5!.copyWith(
                              color: Color(0xff2D2D2D),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          SizedBox(width: 16,),
                        ],
                      ),
                      Text("Select deposit amount to avail the bid limit",style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0xff1F2A52),
                        fontWeight: FontWeight.w400,

                      ),
                        textAlign: TextAlign.center,

                      ),
                      SizedBox(height: 10,),
                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.all(16),
                        color: Color(0xffEAEEF2),
                        child: Row(
                          children: [
                            Radio(
                              value: Biding.bid1,
                              groupValue: _bid,
                              activeColor: Theme.of(context).colorScheme.error,
                              onChanged: (Biding? value) {
                                setState(() {
                                  _bid = value;
                                });
                              },
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Deposit Amt",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0xff000000).withOpacity(0.6),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("₹10,000 ",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
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
                                Text("Bid Limit",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0xff000000).withOpacity(0.6),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("₹1,00,000 ",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.all(16),
                        color: Color(0xffEAEEF2),
                        child: Row(
                          children: [
                            Radio(
                              value: Biding.bid2,
                              groupValue: _bid,
                              activeColor: Theme.of(context).colorScheme.error,
                              onChanged: (Biding? value) {
                                setState(() {
                                  _bid = value;
                                });
                              },
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Deposit Amt",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0xff000000).withOpacity(0.6),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("₹50,000 ",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
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
                                Text("Bid Limit",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0xff000000).withOpacity(0.6),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("₹5,00,000 ",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.all(16),
                        color: Color(0xffEAEEF2),
                        child: Row(
                          children: [
                            Radio(
                              value: Biding.bid3,
                              groupValue: _bid,
                              // fillColor: MaterialStateProperty.all(const Color(0XffFFFFFF),),
                              activeColor: Theme.of(context).colorScheme.error,
                              onChanged: (Biding? value) {
                                setState(() {
                                  _bid = value;
                                });
                              },
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Deposit Amt",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0xff000000).withOpacity(0.6),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("₹1,00,000 ",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
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
                                Text("Bid Limit",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0xff000000).withOpacity(0.6),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("₹10,00,000 ",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30,),

                    ],
                  ),
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Agreeing to",
                      textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 6,),
                    Text("Terms & Conditions",
                      textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0xff2D2D2D),
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 1,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 6,),
                    Text(" lorem Ipsum",
                      textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20,),
                    Text("is a dummy texts.",
                      textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => KYCAddresspage()));
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width*.75,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xffB45156),Color(0xffE74B52),]
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text("PAY DEPOSIT",
                        textAlign: TextAlign.center,
                        style:
                        Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }

}


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';
import 'package:giftex/screens/profile/orderproductdetails.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../customepaint.dart';

class GetOtppage extends StatefulWidget {
  @override
  _GetOtppageState createState() => _GetOtppageState();
}

class _GetOtppageState extends State<GetOtppage> {
  String loginType="signup";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7FAFD),
      body: SingleChildScrollView(
          child:Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,

            child: Column(
              children: [
                Container(
                    height: 270,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0,bottom: 0,right:0,left: 0),
                          child: Image.asset("image/Shapebgup.png", height: 200.0,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0,bottom: 0,right:0,left: 0),
                          child: Image.asset("image/Shapebh.png", height: 130.0,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 90,bottom: 0,right:0,left:130),
                          child: Image.asset("image/otp.png", height:120.0,width: 120,fit: BoxFit.cover,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 220,bottom: 0,right:0,left:30),
                          child: Text("INDIA'S BEST AUCTION MARKETPLACE",
                            textAlign: TextAlign.center,
                            style:
                            Theme.of(context).textTheme.headline6!.copyWith(
                              color: Color(0xff2D2D2D),
                              fontWeight: FontWeight.w600,
                            ),
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
                     Text("Enter OTP",
                       textAlign: TextAlign.center,
                       style:
                       Theme.of(context).textTheme.headline6!.copyWith(
                         color: Color(0xff2D2D2D),
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                     SizedBox(height: 10,),
                     Text("We’ve shared on OTP verification code on ",
                       textAlign: TextAlign.center,
                       style:
                       Theme.of(context).textTheme.subtitle1!.copyWith(
                         color: Color(0xff2D2D2D),
                         fontWeight: FontWeight.w400,
                       ),
                     ),
                     SizedBox(height: 10,),
                     Row(
                       children: [
                         Icon(Icons.call_outlined,size: 20,color: Theme.of(context).colorScheme.secondary,),
                         SizedBox(width: 10,),
                         Text("+91 986734 456721 ",
                           textAlign: TextAlign.center,
                           style:
                           Theme.of(context).textTheme.subtitle1!.copyWith(
                             color: Theme.of(context).colorScheme.secondary,
                             fontWeight: FontWeight.w400,
                           ),
                         ),
                       ],
                     ),
                     SizedBox(height: 10,),
                     Row(
                       children: [
                         Icon(Icons.email_outlined,size: 20,color: Theme.of(context).colorScheme.secondary,),
                         SizedBox(width: 10,),
                         Text("johndoe@gmail.com",
                           textAlign: TextAlign.center,
                           style:
                           Theme.of(context).textTheme.subtitle1!.copyWith(
                             color:Theme.of(context).colorScheme.secondary,
                             fontWeight: FontWeight.w400,
                           ),
                         ),
                       ],
                     ),
                     SizedBox(height: 30,),
                     OtpTextField(
                       numberOfFields: 4,
                       fieldWidth: 70,
                       fillColor: Colors.white,
                       filled: true,

                       borderColor: Colors.transparent,
                       disabledBorderColor: Colors.transparent,
                       enabledBorderColor:Colors.transparent,
                       //set to true to show as box or false to show as dash
                       showFieldAsBox: true,
                       //runs when a code is typed in
                       onCodeChanged: (String code) {
                         //handle validation or checks here
                       },
                       //runs when every textfield is filled
                       onSubmit: (String verificationCode){
                         showDialog(
                             context: context,
                             builder: (context){
                               return AlertDialog(
                                 title: Text("Verification Code"),
                                 content: Text('Code entered is $verificationCode'),
                               );
                             }
                         );
                       }, // end onSubmit
                     ),
                     SizedBox(height: 10,),
                     Padding(
                       padding: const EdgeInsets.only(left: 10.0,right: 10),
                       child: Row(
                         children: [
                           Text("Did’nt recieve OTP",
                             textAlign: TextAlign.center,
                             style:
                             Theme.of(context).textTheme.bodyText1!.copyWith(
                               color: Color(0xff747474),
                               fontWeight: FontWeight.w400,
                             ),
                           ),
                           Spacer(),
                           Text("RESEND NOW",
                             textAlign: TextAlign.center,
                             style:
                             Theme.of(context).textTheme.bodyText1!.copyWith(
                               color: Theme.of(context).colorScheme.secondary,
                               fontWeight: FontWeight.w600,
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               ),

                Spacer(),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    children: <TextSpan>[
                      TextSpan(text: 'Already have an account? ',style:  Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,),),
                      TextSpan(text: 'Sign in', style:  Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,),),
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardUi(0)));
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xffE74B52),Color(0xffE74B52),]
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text("GET STARTED",
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
          )
      ),
    );
  }

}
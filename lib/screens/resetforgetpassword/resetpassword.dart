

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';
import 'package:giftex/screens/homepage/homapage.dart';
import 'package:giftex/screens/signup/getotp.dart';
import 'package:giftex/screens/profile/orderproductdetails.dart';
import 'package:giftex/viewmodel/user/loginviewmodel.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../customepaint.dart';
LoginViewModel loginViewModel=LoginViewModel();
class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("image/Rectangle 1535.png"),
            //   fit: BoxFit.cover,
            // ),
          ),
          // padding: EdgeInsets.only(top: 16,left: 16,right: 16),
          child: SingleChildScrollView(
              child:Column(
                children: [
                  Container(
                      height: 270,
                      color: Color(0xffF7FAFD),
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
                            child: Image.asset("image/signup.png", height:100.0,width: 80,fit: BoxFit.cover,),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 200,bottom: 0,right:0,left:30),
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
                    color: Color(0xffF7FAFD),
                    child: DefaultTabController(
                      length: 2,
                      child:  TabBar(
                        onTap: (index) {
                          setState(() {

                            // if(index==0) { loginType="signup";}
                            // if(index==1) {loginType="signin";}
                          });
                          print(index);
                        },
                        indicator: UnderlineTabIndicator(
                          borderSide:
                          BorderSide(color: Color(0xff8DAB7F), width: 2.0),
                        ),
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
                              text: "CREATE AN ACCOUNT"
                          ),
                          Tab(
                              text: "SIGN IN            "
                          ),
                        ],
                      ),

                    ),
                  ),

                ],
              )
          ),
        ),
      ),
    );
  }

}
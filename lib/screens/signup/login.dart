

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';
import 'package:giftex/screens/signup/getotp.dart';
import 'package:giftex/screens/profile/orderproductdetails.dart';
import 'package:giftex/viewmodel/user/loginviewmodel.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../customepaint.dart';
LoginViewModel loginViewModel=LoginViewModel();
class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String loginType="signup";

  @override
  void initState() {
    // TODO: implement initState
    loginViewModel.setupValidations();
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

                            if(index==0) { loginType="signup";}
                            if(index==1) {loginType="signin";}
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
                  loginType=="signup"?Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 0,left: 16,right: 16),
                          child: Column(
                            children: [
                              SizedBox(height: 16,),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.only(left:8),
                                child: TextField(
                                  // controller: nameController,
                                  keyboardType: TextInputType.name,
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Full Name',
                                      hintText: 'Enter Your Name',
                                      // prefixIcon:
                                      // prefixIcon: ,
                                      icon: Image.asset("image/people.png",height: 32),
                                      filled: true,
                                      isDense: false,
                                      fillColor: Color(0xffFFFFFF),
                                      // isDense: true
                                  ),
                                ),
                              ),
                              SizedBox(height: 16,),
                              Container(
                                  color: Colors.white,
                                padding: EdgeInsets.only(left:8),
                                child: TextField(
                                  // controller: nameController,
                                  keyboardType: TextInputType.emailAddress,
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Email Address',
                                      hintText: 'aryansethi@gmail.com',
                                      icon: Image.asset("image/email.png",height: 28),
                                      // prefixIcon: Icon(Icons.email_outlined,color: Color(0xff779868)),
                                      filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                      // isDense: true
                                  ),
                                ),
                              ),
                              SizedBox(height: 16,),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.only(left:8),
                                child: TextField(
                                  // controller: nameController,
                                  keyboardType: TextInputType.phone,
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Contact Number',
                                      hintText: '91+ 9867345212',
                                    icon: Image.asset("image/phone.png",height: 32),
                                      // prefixIcon: Icon(Icons.call,color: Color(0xff779868),),
                                      filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                      // isDense: true
                                  ),
                                ),
                              ),
                              SizedBox(height: 16,),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.only(left:8),
                                child: TextField(
                                  // controller: nameController,
                                  obscureText: true,

                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,

                                    fontWeight: FontWeight.w500,),

                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Set Password',
                                      hintText: '22/03/1998',
                                       icon: Image.asset("image/pass.png",height: 32),
                                    // prefixIcon: Image.asset("image/pass.png",height: 8),
                                    filled: true,
                                      fillColor: Color(0xffFFFFFF),
                                      // isDense: true
                                  ),
                                ),
                              ),
                              SizedBox(height: 8,),
                              Row(
                                children: [
                                  Icon(Icons.info_outline,size: 17,color: Color(0xff747474),),
                                  SizedBox(width: 6,),
                                  Text("Password should be 8 characters long",
                                    textAlign: TextAlign.center,
                                    style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0xff2D2D2D),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
                                },
                                child: Container(
                                  height: 50,
                                    width: 150,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xffE74B52),Color(0xffE74B52),]
                                    ),
                                    // color: Color(0xff466D33),
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Center(
                                    child: Text("GET OTP",
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
                              SizedBox(height: 30,)
                            ],
                          ),
                        ),

                      ],
                    ),
                  ):Container(),
                  loginType=="signin"?Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 0,left: 16,right: 16),
                          child: Column(
                            children: [

                              SizedBox(height: 16,),
                              Container(
                                  color: Colors.white,
                                padding: EdgeInsets.only(left:8),
                                child: TextField(
                                  // controller: nameController,
                                  onChanged: (str){
                                    loginViewModel.setEmail(str);
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Email Address',
                                      hintText: 'aryansethi@gmail.com',
                                      icon: Image.asset("image/email.png",height: 28),
                                      // prefixIcon: Icon(Icons.email_outlined,color: Color(0xff779868)),
                                      filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                      errorText: loginViewModel.loginViewModelErrorState.email
                                      // isDense: true
                                  ),
                                ),
                              ),
                              SizedBox(height: 16,),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.only(left:8),
                                child: TextField(
                                  // controller: nameController,
                                  obscureText: true,
                                  onChanged: (str){
                                    loginViewModel.setPass(str);
                                  },
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,

                                    fontWeight: FontWeight.w500,),

                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Password',
                                      hintText: '********',
                                       icon: Image.asset("image/pass.png",height: 32),
                                    // prefixIcon: Image.asset("image/pass.png",height: 8),
                                    filled: true,
                                      fillColor: Color(0xffFFFFFF),
                                      errorText: loginViewModel.loginViewModelErrorState.pass
                                      // isDense: true
                                  ),
                                ),
                              ),
                              SizedBox(height: 8,),
                              InkWell(
                                onTap: (){
                                  loginViewModel.getLogin().then((value) => {
                                    if( value.status==200) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) => GetOtppage())),
                                    }else{
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Enter Valid Credentials ${value.message}',style: Theme.of(context).textTheme.headline6,),
                                            backgroundColor: Colors.red,

                                          )

                                      ),                      }
                                  });


                                },
                                child: Container(
                                  height: 50,
                                    width: 150,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color(0xffE74B52),Color(0xffE74B52),]
                                    ),
                                    // color: Color(0xff466D33),
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
                              SizedBox(height: 30,)
                            ],
                          ),
                        ),

                      ],
                    ),
                  ):Container(),
                ],
              )
          ),
        ),
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:giftex/screens/signup/emailotp.dart';
import 'package:giftex/screens/signup/getotp.dart';
import 'package:giftex/viewmodel/user/loginviewmodel.dart';
import 'package:validators/validators.dart';

import '../../data/local/client/prefs.dart';
import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../kyc/kycpage.dart';

LoginViewModel loginViewModel = LoginViewModel();

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  LocalSharedPrefrence prefrence=LocalSharedPrefrence();
  String loginType = "signup";
  bool isMobile = true;
  bool isEmailVerified = false;
  bool isMobileVerified = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController EMAILController = TextEditingController();
  TextEditingController MOBILEController = TextEditingController();

  @override
  void initState() {
    loginViewModel.setupValidations();
    loginViewModel.termsAndConditions();
    super.initState();
  }

  bool isShow = false;

  bool isCheked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF7FAFD),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,

            decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage("image/Rectangle 1535.png"),
                //   fit: BoxFit.cover,
                // ),
                ),
            // padding: EdgeInsets.only(top: 16,left: 16,right: 16),
            child: SingleChildScrollView(
                child: Column(
              children: [
                // SizedBox(height: 12,),
                Stack(
                  children: [
                    Container(
                        height: 280,
                        color: Color(0xffF7FAFD),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 0, bottom: 0, right: 0, left: 0),
                              child: Image.asset(
                                "image/Shapebh.png",
                                height: 200.0,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 0, bottom: 0, right: 0, left: 0),
                              child: Image.asset(
                                "image/Shapebgup.png",
                                height: 130.0,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 60, bottom: 0, right: 0, left: 130),
                              child: Image.asset(
                                "image/login.png",
                                height: 165.0,
                                width: 153,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              left: 0,
                              child: Image.asset(
                                "image/ouplogo.png",
                                height: 77.0,
                              ),
                            ),
                          ],
                        )),
                    Positioned(
                        right: 16,
                        top: 16,
                        child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (BuildContext context) => DashboardUi(0)));
                            },
                            child: Text("Skip")))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 16, right: 0, left: 0),
                  child: Text(
                    "INDIA'S BEST AUCTION \nMARKETPLACE",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Color(0xff2D2D2D),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Container(
                  color: Color(0xffF7FAFD),
                  child: DefaultTabController(
                    length: 2,
                    child: TabBar(
                      onTap: (index) {
                        setState(() {
                          if (index == 0) {
                            loginType = "signup";
                          }
                          if (index == 1) {
                            loginType = "signin";
                          }
                        });
                        print(index);
                      },
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                      ),
                      isScrollable: true,
                      padding: EdgeInsets.all(0),
                      unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.6),
                      labelColor: const Color(0xFF000000),
                      labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                      tabs: [
                        Tab(text: "CREATE AN ACCOUNT"),
                        Tab(text: "SIGN IN            "),
                      ],
                    ),
                  ),
                ),
                loginType == "signup"
                    ? Observer(builder: (context) {
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 0, left: 16, right: 16),
                                margin: EdgeInsets.only(top: 0, left: 16, right: 16),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(color: Colors.white, boxShadow: [
                                        BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))
                                      ]),
                                      padding: EdgeInsets.only(left: 8),
                                      child: TextField(
                                        // controller: nameController,
                                        onChanged: (str) => loginViewModel.setName(str),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.name,
                                        enableSuggestions: true,

                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'Name',

                                          errorText: loginViewModel.login1ViewModelErrorState.name,
                                          // prefixIcon:
                                          // prefixIcon: ,
                                          icon: Image.asset("image/people.png", height: 32),
                                          filled: true,
                                          isDense: false,
                                          fillColor: Color(0xffFFFFFF),
                                          // isDense: true
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(color: Colors.white, boxShadow: [
                                        BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))
                                      ]),
                                      padding: EdgeInsets.only(left: 8),
                                      child: TextField(
                                        // controller: nameController,
                                        onChanged: (str) {
                                          loginViewModel.setEmail(str);

                                          setState(() {
                                            isEmailVerified = false;
                                          });
                                        },
                                        enableSuggestions: true,

                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.emailAddress,
                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),

                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'Email ID',

                                          errorText: loginViewModel.login1ViewModelErrorState.email,
                                          icon: Image.asset("image/email.png", height: 24),
                                          // prefixIcon: Icon(Icons.email_outlined,color: Color(0xff779868)),
                                          filled: true,
                                          isDense: false,
                                          fillColor: Color(0xffFFFFFF),
                                          // isDense: true
                                        ),
                                      ),
                                    ),
                                    isEmail(loginViewModel.email)
                                        ? (!isEmailVerified)
                                            ? Align(
                                                alignment: Alignment.topRight,
                                                child: TextButton(
                                                  child: Text("Verify"),
                                                  onPressed: () async {
                                                    bool? result = await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => GetOtpEmailMobilepage(
                                                                loginViewModel.email, loginViewModel, false)));

                                                    setState(() {
                                                      isEmailVerified = result ?? false;
                                                    });
                                                  },
                                                ),
                                              )
                                            : Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  child: Icon(Icons.verified, color: Colors.green),
                                                ),
                                              )
                                        : Container(),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(color: Colors.white, boxShadow: [
                                        BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))
                                      ]),
                                      padding: EdgeInsets.only(left: 8),
                                      child: TextField(
                                        // controller: nameController,
                                        onChanged: (str) {
                                          loginViewModel.setMobile(str);
                                          setState(() {
                                            isMobileVerified = false;
                                          });
                                        },
                                        enableSuggestions: true,
                                        // maxLength: 10,
                                        maxLines: 1,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        maxLength: 10,

                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.phone,
                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'Mobile No.',
                                          counterText: '',
                                          errorText: loginViewModel.login1ViewModelErrorState.mobile,
                                          isDense: true,
                                          icon: Image.asset("image/phone.png", height: 28),
                                          // prefixIcon: Icon(Icons.call,color: Color(0xff779868),),
                                          filled: true,
                                          fillColor: Color(0xffFFFFFF),
                                          // isDense: true
                                        ),
                                      ),
                                    ),
                                    (loginViewModel.mobile.length == 10)
                                        ? (!isMobileVerified)
                                            ? Align(
                                                alignment: Alignment.topRight,
                                                child: TextButton(
                                                  child: Text("Verify"),
                                                  onPressed: () async {
                                                    bool? result = await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => GetOtpEmailMobilepage(
                                                                loginViewModel.mobile, loginViewModel, true)));

                                                    setState(() {
                                                      isMobileVerified = result ?? false;
                                                    });
                                                  },
                                                ),
                                              )
                                            : Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  child: Icon(Icons.verified, color: Colors.green),
                                                ),
                                              )
                                        : Container(),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(color: Colors.white, boxShadow: [
                                        BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))
                                      ]),
                                      padding: EdgeInsets.only(left: 8),
                                      child: TextField(
                                        // controller: nameController,
                                        // enableSuggestions: true,
                                        onChanged: (str) => loginViewModel.setPass(str),

                                        textInputAction: TextInputAction.done,
                                        obscureText: isShow ? false : true,

                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),

                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          // suffixIcon:
                                          suffix: isShow
                                              ? InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      isShow = !isShow;
                                                    });
                                                  },
                                                  child: Icon(Icons.remove_red_eye))
                                              : InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      isShow = !isShow;
                                                    });
                                                  },
                                                  child: Image.asset(
                                                    "image/hidden.png",
                                                    height: 24,
                                                  ),
                                                ),
                                          labelText: 'Set Password',
                                          errorText: loginViewModel.login1ViewModelErrorState.pass,
                                          icon: Image.asset("image/pass.png", height: 28),
                                          // prefixIcon: Image.asset("image/pass.png",height: 8),
                                          filled: true,
                                          fillColor: Color(0xffFFFFFF),
                                          // isDense: true
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          size: 17,
                                          color: Color(0xff747474),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          "Password should be 8 characters long",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: Color(0xff2D2D2D),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 34,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await showDialog(
                                            context: context,
                                            builder: (BuildContext dialogContext) {
                                              return AlertDialog(
                                                contentPadding: EdgeInsets.all(0),
                                                content: Container(
                                                  height: 580,
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.all(16),
                                                        width: MediaQuery.of(context).size.width,
                                                        color: Color(0xffEAEEF2),
                                                        child: SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                  InkWell(
                                                                      onTap: () {
                                                                        Navigator.of(context).pop();
                                                                      },
                                                                      child: Icon(
                                                                        Icons.close,
                                                                        size: 20,
                                                                        color: Color(0xff979797),
                                                                      ))
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Image.asset(
                                                                    "image/Vector (22).png",
                                                                    color: Color(0XFF202232),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    'TERMS & CONDITIONS',
                                                                    style: Theme.of(context)
                                                                        .textTheme
                                                                        .subtitle1!
                                                                        .copyWith(
                                                                            color: Color(0XFF202232),
                                                                            fontWeight: FontWeight.w400,
                                                                            letterSpacing: 2),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 16,
                                                              ),
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                              SizedBox(
                                                                height: 380,
                                                                child: SingleChildScrollView(
                                                                  child: HtmlWidget(
                                                                    // the first parameter (`html`) is required

                                                                    // all other parameters are optional, a few notable params:

                                                                    // specify custom styling for an element
                                                                    '${loginViewModel.termsAndConditionsResponse!.pageContent!.accordion![0].desc}',

                                                                    // render a custom widget

                                                                    // these callbacks are called when a complicated element is loading
                                                                    // or failed to render allowing the app to render progress indicator
                                                                    // and fallback widget

                                                                    // select the render mode for HTML body
                                                                    // by default, a simple `Column` is rendered
                                                                    // consider using `ListView` or `SliverList` for better performance

                                                                    // set the default styling for text
                                                                    textStyle: TextStyle(fontSize: 14),

                                                                    // turn on `webView` if you need IFRAME support (it's disabled by default)
                                                                  ),
                                                                ),
                                                              ),
                                                              // Text(
                                                              //   '${loginViewModel.termsAndConditionsResponse!.pageContent!.accordion![0].desc}',
                                                              //   textAlign: TextAlign.center,
                                                              //   style: Theme.of(context).textTheme.caption!.copyWith(
                                                              //         color: Color(0XFF202232).withOpacity(0.61),
                                                              //         fontWeight: FontWeight.w400,
                                                              //       ),
                                                              // ),
                                                              Row(
                                                                children: [
                                                                  Spacer(),
                                                                  TextButton(
                                                                      onPressed: () {
                                                                        setState(() {
                                                                          isCheked = false;
                                                                        });
                                                                        prefrence!.setAgreed(false);
                                                                        Navigator.of(context).pop();
                                                                      },
                                                                      child: Text(
                                                                        "DISAGREE",
                                                                        style: Theme.of(context).textTheme.button,
                                                                      )),
                                                                  SizedBox(
                                                                    width: 24,
                                                                  ),
                                                                  ElevatedButton(
                                                                      onPressed: () {
                                                                        setState(() {
                                                                          isCheked = true;
                                                                        });
                                                                        prefrence!.setAgreed(true);
                                                                        Navigator.of(context).pop();
                                                                      },
                                                                      child: Text(
                                                                        "AGREE",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .button!
                                                                            .copyWith(color: Colors.white),
                                                                      ))
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Row(
                                        children: [
                                          Checkbox(
                                           // activeColor: Colors.green,

                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                             // fillColor: MaterialStatePropertyAll(Colors.green),

                                              value: isCheked, onChanged: (val) async {
                                            setState(() {
                                           //   isCheked=!isCheked;
                                            });
                                          }),
                                          Row(
                                            children: [
                                              Text(
                                                "Agreeing to",
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Color(0xff2D2D2D),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                "Terms & Conditions",
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Color(0xff2D2D2D),
                                                      decoration: TextDecoration.underline,
                                                      decorationStyle: TextDecorationStyle.solid,
                                                      decorationThickness: 1,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Navigator.pushReplacement(
                                        //     context, MaterialPageRoute(builder: (BuildContext context) => KYCPage()));
                                        if (loginViewModel.login1ViewModelErrorState.hasErrors) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text(
                                              'Enter Valid Details',
                                              style: Theme.of(context).textTheme.headline6,
                                            ),
                                            backgroundColor: Colors.red,
                                          ));
                                        }else if(isCheked==false){
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text(
                                              'Please select Agree to Terms and Conditions. ',
                                              style: Theme.of(context).textTheme.headline6,
                                            ),
                                            backgroundColor: Colors.red,
                                          ));
                                        } else {
                                          if (isEmailVerified && isMobileVerified) {
                                            loginViewModel.gesignUp().then((value) => {
                                                  if (value.status == 200)
                                                    {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (BuildContext context) =>
                                                                  KYCPage(loginViewModel.name))),
                                                    }
                                                  else
                                                    {
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                        content: Text(
                                                          'Enter Valid Credentials ${value.message}',
                                                          style: Theme.of(context).textTheme.headline6,
                                                        ),
                                                        backgroundColor: Colors.red,
                                                      )),
                                                    }
                                                });
                                          } else {
                                            if (!isEmailVerified) {
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                content: Text(
                                                  'Please Verify Email',
                                                  style: Theme.of(context).textTheme.headline6,
                                                ),
                                                backgroundColor: Colors.red,
                                              ));
                                            }
                                            if (!isMobileVerified) {
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                content: Text(
                                                  'Please Verify Mobile',
                                                  style: Theme.of(context).textTheme.headline6,
                                                ),
                                                backgroundColor: Colors.red,
                                              ));
                                            }
                                          }
                                        }

                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
                                      },
                                      child: Container(
                                        height: 50,
                                        width: MediaQuery.of(context).size.width * .75,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Color(0xffB45156),
                                              Color(0xffE74B52),
                                            ]),
                                            borderRadius: BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            "SIGN UP",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Color(0xffffffff),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                    : isMobile
                        ? Observer(builder: (context) {
                            return Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("Welcome Back",
                                      style:
                                          Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w900)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                                      BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))
                                    ]),
                                    margin: EdgeInsets.all(28),
                                    padding: EdgeInsets.all(8),
                                    child: TextField(
                                      controller: MOBILEController,
                                      // maxLength: 10,
                                      onChanged: (str) {
                                        loginViewModel.setMobile(str);
                                      },
                                      keyboardType: TextInputType.number,
                                      maxLength: 10,
                                      maxLines: 1,
                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        // labelText: 'Name',
                                        hintText: 'Enter Mobile Number',
                                        errorText: loginViewModel.loginViewModelMobileErrorState.mobile,
                                        // prefixIcon:
                                        // prefixIcon: ,
                                        // icon: Image.asset("image/people.png",height: 32),
                                        filled: true,
                                        isDense: false,
                                        fillColor: Color(0xffFFFFFF),
                                        // isDense: true
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: InkWell(
                                      onTap: () {
                                        if (loginViewModel.loginViewModelMobileErrorState.hasErrors ||
                                            MOBILEController.text.length <= 5) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text(
                                              'Enter A Valid Mobile Number',
                                              style: Theme.of(context).textTheme.headline6,
                                            ),
                                            backgroundColor: Colors.red,
                                          ));
                                        } else {
                                          loginViewModel.getLoginWithMobile().then((value) => {
                                                if (value.status == 200)
                                                  {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext context) => GetOtppage(
                                                                value.data, loginViewModel.mobile, loginViewModel))),
                                                  }
                                                else
                                                  {
                                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                      content: Text(
                                                        '${value.message}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium!
                                                            .copyWith(color: Colors.white),
                                                      ),
                                                      backgroundColor: Colors.red,
                                                    )),
                                                  }
                                              });
                                        }

                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
                                      },
                                      child: Container(
                                        height: 50,
                                        width: MediaQuery.of(context).size.width * .75,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Color(0xffB45156),
                                              Color(0xffE74B52),
                                            ]),
                                            borderRadius: BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            "GET OTP",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Color(0xffffffff),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        isMobile = false;
                                      });
                                    },
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Login with Email & Password? ',
                                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          TextSpan(
                                            text: 'Sign in',
                                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                        : Observer(builder: (context) {
                            return Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("Welcome Back",
                                      style:
                                          Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w900)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                                      BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))
                                    ]),
                                    margin: EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                                    padding: EdgeInsets.all(8),
                                    child: TextField(
                                      controller: EMAILController,
                                      // maxLength: 10,
                                      onChanged: (str) {
                                        loginViewModel.setEmail(str);
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        // labelText: 'Name',
                                        hintText: 'Email',
                                        errorText: loginViewModel.loginViewModelErrorState.email,
                                        // prefixIcon:
                                        // prefixIcon: ,
                                        // icon: Image.asset("image/people.png",height: 32),
                                        filled: true,
                                        isDense: false,
                                        fillColor: Color(0xffFFFFFF),
                                        // isDense: true
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                                      BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))
                                    ]),
                                    margin: EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                                    padding: EdgeInsets.all(8),
                                    child: TextField(
                                      // controller: nameController,
                                      // maxLength: 10,
                                      onChanged: (str) {
                                        loginViewModel.setPass(str);
                                      },
                                      keyboardType: TextInputType.text,
                                      obscureText: isShow ? false : true,
                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      decoration: InputDecoration(
                                        suffix: isShow
                                            ? InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isShow = !isShow;
                                                  });
                                                },
                                                child: Icon(Icons.remove_red_eye))
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isShow = !isShow;
                                                  });
                                                },
                                                child: Image.asset(
                                                  "image/hidden.png",
                                                  height: 24,
                                                ),
                                              ),
                                        border: InputBorder.none,
                                        // labelText: 'Name',
                                        hintText: 'Enter Password',
                                        errorText: loginViewModel.loginViewModelErrorState.pass,
                                        // prefixIcon:
                                        // prefixIcon: ,
                                        // icon: Image.asset("image/people.png",height: 32),
                                        filled: true,
                                        isDense: false,
                                        fillColor: Color(0xffFFFFFF),
                                        // isDense: true
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: InkWell(
                                      onTap: () {
                                        if (loginViewModel.email == "" || loginViewModel.pass == "") {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text(
                                              'Enter A Valid Email Or Password',
                                              style: Theme.of(context).textTheme.headline6,
                                            ),
                                            backgroundColor: Colors.red,
                                          ));
                                        } else {
                                          if (loginViewModel.loginViewModelErrorState.hasErrors) {
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                              content: Text(
                                                'Enter A Valid Email',
                                                style: Theme.of(context).textTheme.headline6,
                                              ),
                                              backgroundColor: Colors.red,
                                            ));
                                          } else {
                                            loginViewModel.getLoginWithEmailPass().then((value) => {
                                                  if (value.status == 200)
                                                    {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (BuildContext context) => DashboardUi(0))),
                                                    }
                                                  else
                                                    {
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                        content: Text(
                                                          'Enter Valid Credentials ${value.message}',
                                                          style: Theme.of(context).textTheme.headline6,
                                                        ),
                                                        backgroundColor: Colors.red,
                                                      )),
                                                    }
                                                });
                                          }
                                        }

                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
                                      },
                                      child: Column(
                                        children: [
                                          loginViewModel.isLoading ? LinearProgressIndicator() : Container(),
                                          Container(
                                            height: 50,
                                            width: MediaQuery.of(context).size.width * .75,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(colors: [
                                                  Color(0xffB45156),
                                                  Color(0xffE74B52),
                                                ]),
                                                borderRadius: BorderRadius.circular(20)),
                                            child: Center(
                                              child: Text(
                                                "LOGIN",
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                      color: Color(0xffffffff),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        isMobile = true;
                                      });
                                    },
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Login with OTP? ',
                                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          TextSpan(
                                            text: 'Sign in',
                                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
              ],
            )),
          ),
        ),
      ),
    );
  }
}

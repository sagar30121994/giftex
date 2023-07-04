import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:giftex/data/network/models/responce/user/loginrespose.dart';
import 'package:giftex/screens/kyc/kycpage.dart';
import 'package:giftex/viewmodel/user/loginviewmodel.dart';

class GetOtppage extends StatefulWidget {
  GetOtppage(this.loginResponse, this.mobile, this.loginViewModel);
  LoginResponse loginResponse;
  LoginViewModel loginViewModel;
  String mobile;
  @override
  _GetOtppageState createState() => _GetOtppageState();
}

class _GetOtppageState extends State<GetOtppage> {
  String loginType = "signup";

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
                          padding: EdgeInsets.only(
                              top: 0, bottom: 0, right: 0, left: 0),
                          child: Image.asset(
                            "image/Shapebh.png",
                            height: 200.0,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 0, bottom: 0, right: 0, left: 0),
                          child: Image.asset(
                            "image/Shapebgup.png",
                            height: 130.0,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 70, bottom: 0, right: 0, left: 130),
                          child: Image.asset(
                            "image/otp.png",
                            height: 120.0,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 16, bottom: 0, right: 0, left: 16),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.grey,
                              size: 32,
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
                      Row(
                        children: [
                          Text(
                            "Enter OTP",
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Color(0xff2D2D2D),
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Spacer(),
                          Image.asset(
                            "image/edit.png",
                            height: 20,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "We’ve shared on OTP verification code on ",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Color(0xff2D2D2D),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset("image/phonesys.png", height: 20),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "+91 ${widget.mobile} ",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset("image/mailbox.png",
                              height: 20, width: 18),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${widget.loginResponse.result!.email}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      OtpTextField(
                        numberOfFields: 4,
                        fieldWidth: 70,
                        fillColor: Colors.white,
                        filled: true,

                        borderColor: Color(0xffEAEEF2),
                        disabledBorderColor: Color(0xffEAEEF2),
                        enabledBorderColor: Color(0xffEAEEF2),
                        focusedBorderColor: Color(0xffEAEEF2),

                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,

                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          widget.loginViewModel.otp = verificationCode;
                          // showDialog(
                          //     context: context,
                          //     builder: (context){
                          //       return AlertDialog(
                          //         title: Text("Verification Code"),
                          //         content: Text('Code entered is $verificationCode'),
                          //       );
                          //     }
                          // );
                        }, // end onSubmit
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Did’nt recieve OTP",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Color(0xff747474),
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "RESEND NOW",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "image/timer.png",
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text("1:35")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //  Spacer(),
                // Expanded(child: Container()),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      TextSpan(
                        text: 'Sign in',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    widget.loginViewModel
                        .getLoginWithOTPConfirm()
                        .then((value) => {
                              if (value.status == 200)
                                {
                                  if (widget.loginViewModel.loginResponse!
                                          .status ==
                                      "true")
                                    {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  KYCPage())),
                                    }
                                  else
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          '${widget.loginViewModel.loginResponse!.message}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        backgroundColor: Colors.red,
                                      )),
                                    }
                                }
                              else
                                {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Enter Valid Credentials ${value.message}',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    backgroundColor: Colors.red,
                                  )),
                                }
                            });

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => KYCPage()));
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
                        "GET STARTED",
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
        ),
      ),
    );
  }
}

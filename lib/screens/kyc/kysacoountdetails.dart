

// import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:giftex/data/network/models/responce/user/loginrespose.dart';
import 'package:giftex/screens/kyc/kycaddressdetails.dart';
import 'package:giftex/screens/kyc/kycpage.dart';
import 'package:giftex/viewmodel/user/loginviewmodel.dart';

class KYCAccountDetailspage extends StatefulWidget {

  @override
  _KYCAccountDetailspageState createState() => _KYCAccountDetailspageState();
}

class _KYCAccountDetailspageState extends State<KYCAccountDetailspage> {
  TextEditingController dobController=TextEditingController();

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
                          child: Image.asset("image/Group 14185.png",),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 70,bottom: 0,right:0,left:130),
                          child: Image.asset("image/Group 14127 (1).png", height:120.0,width: 120,fit: BoxFit.cover,),
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
                          Text("ACCOUNT DETAILS",
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
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                            ]

                        ),
                        padding: EdgeInsets.only(left:0),
                        child: TextField(
                            controller: dobController,
                            // keyboardType: TextInputType.name,

                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff979797))
                              ),
                              // labelText: 'Name',
                              hintText: 'Aadhar No',
                              // prefixIcon:
                              // prefixIcon: ,
                              // icon: Image.asset("image/people.png",height: 32),
                              filled: true,
                              isDense: false,
                              fillColor: Color(0xffF7FAFD),
                              // isDense: true
                            ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.all(16),
                        color: Color(0xffFFFFFF),
                        child: Column(

                          children: [
                            Row(
                               children: [
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Upload Aadhaar Card Front",
                                       textAlign: TextAlign.center,
                                       style:
                                       Theme.of(context).textTheme.subtitle1!.copyWith(
                                         color: Color(0xff2D2D2D).withOpacity(0.4),
                                         fontWeight: FontWeight.w500,
                                       ),
                                     ),
                                     Row(
                                       children: [
                                         Image.asset("image/Ellipse 87.png"),
                                         SizedBox(width: 3,),
                                         Text("Jpg/ Png upto 2mb",
                                           textAlign: TextAlign.center,
                                           style:
                                           Theme.of(context).textTheme.bodyText1!.copyWith(
                                             color: Color(0xff2D2D2D).withOpacity(0.4),
                                             fontWeight: FontWeight.w400,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                                 Spacer(),
                                 Image.asset("image/download.png"),
                               ],
                            ),
                            SizedBox(height: 10,),
                            Image.asset("image/Line 42 (1).png"),
                            SizedBox(height: 10,),
                           Row(
                               children: [
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Row(
                                       children: [
                                         Text("Aadhaar Card Back",
                                           textAlign: TextAlign.center,
                                           style:
                                           Theme.of(context).textTheme.subtitle1!.copyWith(
                                             color: Color(0xff2D2D2D),
                                             fontWeight: FontWeight.w500,
                                           ),
                                         ),
                                         SizedBox(width: 3,),
                                         Image.asset("image/Group 14184.png"),

                                       ],
                                     ),
                                     Row(
                                       children: [
                                         Image.asset("image/Ellipse 87.png"),
                                         SizedBox(width: 3,),
                                         Text("1.5mb",
                                           textAlign: TextAlign.center,
                                           style:
                                           Theme.of(context).textTheme.bodyText1!.copyWith(
                                             color: Color(0xff2D2D2D).withOpacity(0.4),
                                             fontWeight: FontWeight.w400,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                                 Spacer(),
                                 CircleAvatar(
                                   radius: 15,
                                   backgroundColor: Theme.of(context).colorScheme.onTertiary,
                                     child: Image.asset("image/Vector (23).png")),
                               ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                            ]

                        ),
                        padding: EdgeInsets.only(left:0),
                        child: TextField(
                            controller: dobController,
                            // keyboardType: TextInputType.name,

                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff979797))
                              ),
                              // labelText: 'Name',
                              hintText: 'PAN No',
                              // prefixIcon:
                              // prefixIcon: ,
                              // icon: Image.asset("image/people.png",height: 32),
                              filled: true,
                              isDense: false,
                              fillColor: Color(0xffF7FAFD),
                              // isDense: true
                            ),
                        ),
                      ),

                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.all(16),
                        color: Color(0xffFFFFFF),
                        child: Column(

                          children: [
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text("Upload PAN Card",
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff2D2D2D).withOpacity(0.4),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                  ],
                                ),
                                Spacer(),
                                Image.asset("image/download.png"),
                              ],
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
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
                      child: Text("CONTINUE",
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
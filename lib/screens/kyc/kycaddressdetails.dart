

// import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:giftex/data/network/models/responce/user/loginrespose.dart';
import 'package:giftex/screens/kyc/kycpage.dart';
import 'package:giftex/screens/kyc/kysacoountdetails.dart';
import 'package:giftex/screens/kyc/paydeposit.dart';
import 'package:giftex/viewmodel/user/loginviewmodel.dart';

class KYCAddresspage extends StatefulWidget {

  @override
  _KYCAddresspageState createState() => _KYCAddresspageState();
}

class _KYCAddresspageState extends State<KYCAddresspage> {
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
                          child: Image.asset("image/Group 14185 (1).png",),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 70,bottom: 0,right:0,left:130),
                          child: Image.asset("image/Group 14127 (2).png", height:120.0,width: 120,fit: BoxFit.cover,),
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
                          Text("ADDRESS DETAILS",
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
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Container(
                            // margin: EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width*.70,
                            height: 50,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(

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
                            height: 50,
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
                            child: Image.asset("image/Vector (11).png",color: Theme.of(context).colorScheme.primary),
                          ),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Image.asset("image/MAp (1).png"),
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
                              color: Color(0xff788995).withOpacity(0.4),
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
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => KYCPayDepositpage()));
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
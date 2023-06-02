

// import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/responce/user/loginrespose.dart';
import 'package:giftex/screens/kyc/kycpage.dart';
import 'package:giftex/screens/kyc/kysacoountdetails.dart';
import 'package:giftex/viewmodel/profile/profileviewmodel.dart';
import 'package:giftex/viewmodel/user/loginviewmodel.dart';
import 'package:intl/intl.dart';
ProfileViewModel profileViewModel=ProfileViewModel();
class KYCDetailspage extends StatefulWidget {

  @override
  _KYCDetailspageState createState() => _KYCDetailspageState();
}

class _KYCDetailspageState extends State<KYCDetailspage> {
  TextEditingController dobController=TextEditingController();
  bool male=false;
  bool female=false;
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
                          child: Image.asset("image/Group 14129 (1).png",),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 70,bottom: 0,right:0,left:130),
                          child: Image.asset("image/Group 14127.png", height:120.0,width: 120,fit: BoxFit.cover,),
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
                          Text("BASIC DETAILS",
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
                      Text("Date of Birth",
                        textAlign: TextAlign.center,
                        style:
                        Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0xff2D2D2D),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                            ]

                        ),
                        padding: EdgeInsets.only(left:8),
                        child: TextField(
                          controller: dobController,
                          // keyboardType: TextInputType.name,
                          readOnly: true,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            // labelText: 'Name',
                            hintText: 'DD/MM/YYYY',
                            // prefixIcon:
                            // prefixIcon: ,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Image.asset("image/Vector-13.png",height: 12,fit: BoxFit.fill,),
                            ),
                            filled: true,
                            isDense: false,
                            fillColor: Color(0xffFFFFFF),
                            // isDense: true
                          ),
                          onTap: () async {
                            // DatePicker.showDatePicker(context,
                            //     // theme: DatePickerTheme(
                            //     //   containerHeight: 210.0,
                            //     // ),
                            //     showTitleActions: true,
                            //     minTime: DateTime(1, 1,1900),
                            //     maxTime: DateTime.now(), onConfirm: (date) {
                            //       print('confirm $date');
                            //       dobController.text = '${date.day}/${date.month}/${date.year}';
                            //       setState(() {});
                          // });
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                builder: (  context,   child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      colorScheme: ColorScheme.fromSwatch(
                                        primarySwatch: Colors.teal,
                                        primaryColorDark: Colors.teal,
                                        accentColor: Colors.teal,
                                      ),
                                      dialogBackgroundColor:Colors.white,
                                    ), child: child!,

                                  );
                                },
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));
                            

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate ='${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';

                              print(''); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                dobController.text =
                                    formattedDate; //set output date to TextField value.
                              });

                              profileViewModel.setDOB(formattedDate);


                            } else {
                              print("Date is not selected");
                            }
                          }
                        ),
                      ),

                      SizedBox(height: 30,),
                      Text("Gender",
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
                          InkWell(
                            onTap: (){
                              male=true;
                              female=false;

                              profileViewModel.setDOB(male?"MALE":"FEMALE");
                            },
                            child: Container(
                              height: 150,

                              width: MediaQuery.of(context).size.width*.40,
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                border: Border.all(color: male?Color(0xff8C9FB1):Color(0xffFFFFFF))
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("image/Group (30).png"),
                                  SizedBox(height: 10,),
                                  Text("Male",
                                    textAlign: TextAlign.center,
                                    style:
                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0xff2D2D2D),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: (){
                              male=false;
                              female=true;
                            },
                            child: Container(
                              height: 150,
                              // color: Color(0xffFFFFFF),
                              width: MediaQuery.of(context).size.width*.40,
                              decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  border: Border.all(color: female?Color(0xff8C9FB1):Color(0xffFFFFFF))
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("image/Group (31).png"),
                                  SizedBox(height: 10,),
                                  Text("Female",
                                    textAlign: TextAlign.center,
                                    style:
                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0xff2D2D2D),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30,),
                      Text("Nationality",
                        textAlign: TextAlign.center,
                        style:
                        Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0xff2D2D2D),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       boxShadow: [
                      //         BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                      //       ]
                      //
                      //   ),
                      //   padding: EdgeInsets.only(left:8),
                      //   child: TextField(
                      //       controller: dobController,
                      //       // keyboardType: TextInputType.name,
                      //       readOnly: true,
                      //       style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      //         color: Colors.black,
                      //         fontWeight: FontWeight.w500,),
                      //       decoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         // labelText: 'Name',
                      //         hintText: 'DD/MM/YYYY',
                      //         // prefixIcon:
                      //         // prefixIcon: ,
                      //         // icon: Image.asset("image/people.png",height: 32),
                      //         filled: true,
                      //         isDense: false,
                      //         fillColor: Color(0xffFFFFFF),
                      //         // isDense: true
                      //       ),
                      //       onTap: (){
                      //         showCountryPicker(
                      //           context: context,
                      //           showPhoneCode: true, // optional. Shows phone code before the country name.
                      //           onSelect: (Country country) {
                      //             print('Select country: ${country.displayName}');
                      //           },
                      //         );
                      //       }
                      //   ),
                      // ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                InkWell(
                  onTap: () async {
                    HttpResponse res= await profileViewModel.updateRegPersonalDetails();
                    if(res.status==200){
                      ScaffoldMessenger.of(context).showSnackBar(  SnackBar(content: Text('Record Updated....'),backgroundColor: Colors.green,),);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(  SnackBar(content: Text("${res.message!}"),backgroundColor: Colors.orange,),);
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (context) => KYCAccountDetailspage()));
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
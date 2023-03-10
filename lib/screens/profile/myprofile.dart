

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../components/header.dart';
import '../customepaint.dart';

class MyProfilepage extends StatefulWidget {
  @override
  _MyProfilepageState createState() => _MyProfilepageState();
}

class _MyProfilepageState extends State<MyProfilepage> {
  int _pageIndex = 0;
  String type="account";
  TextEditingController nameController=TextEditingController();
  TextEditingController adharController=TextEditingController();
  TextEditingController panController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController contactController=TextEditingController();
  TextEditingController dobController=TextEditingController();
  TextEditingController genderController=TextEditingController();
  TextEditingController nationalityController=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
   nameController.text="Aryan Raj";
   adharController.text="*1234";
   panController.text="*1234";
   emailController.text="aryansethi@gmail.com";
   contactController.text="91+ 9867345212";
   dobController.text="22/03/1998";
   genderController.text="Male";
   nationalityController.text="India";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      backgroundColor:Colors.white,
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*.9,
          // padding: EdgeInsets.only(top: 16,left: 16,right: 16),
          child: SingleChildScrollView(
              child:Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [

                            Image.asset("image/Ellipse 94.png",height: 95,color: Color(0xffF3E8E9),),
                            CircleAvatar(
                              radius: 37,
                              backgroundImage: AssetImage('image/image 40.png'),
                              // child: Image.asset("image/image 40.png",fit: BoxFit.fill,),
                            ),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(

                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      // textAlign: TextAlign.center,
                                      text: TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        children: <TextSpan>[
                                          TextSpan(text: 'Hello ',style:  Theme.of(context).textTheme.headline6!.copyWith(
                                            color: Color(0xffE74B52),
                                            fontWeight: FontWeight.bold,),),
                                          TextSpan(text: 'Aryan R.', style:  Theme.of(context).textTheme.headline6!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,),),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 3,),
                                    Row(
                                      children: [
                                        Image.asset("image/Vector (11).png",height: 16,color: Colors.red,),
                                        SizedBox(width: 3,),
                                        Text("Mumbai. India",
                                          textAlign: TextAlign.center,
                                          style:
                                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0xff2D2D2D),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(width: 16,),
                                ElevatedButton(
                                  style:   ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Color(0XFFFFFFFF)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                              side: BorderSide(color: Color(0xff747474),width: 0.38)
                                          )
                                      )
                                  ),
                                  onPressed: (){
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                    child: Row(
                                      children: [
                                        Text('EDIT', style:
                                        Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Theme.of(context).colorScheme.primary,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 2
                                        ),),

                                        SizedBox(width: 5,),
                                        Icon(Icons.edit_outlined, color: Color(0XFF2D2D2D),size: 15,)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3,),
                            Container(
                              width: MediaQuery.of(context).size.width*.6,
                              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
                                textAlign: TextAlign.left,
                                style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Color(0xff959595),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    color: Colors.white,
                    child: DefaultTabController(
                      length: 3,
                      child:  SingleChildScrollView(
                        child: TabBar(
                          onTap: (index) {
                            setState(() {

                              if(index==0) { type="account";}
                              if(index==1) {type="address";}
                              if(index==2) {type="banking";}
                            });
                            print(index);
                          },
                          // indicator: BoxDecoration(
                          //     color: tabColor
                          // ),
                          // isScrollable: true,
                          padding: EdgeInsets.all(0),
                          unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.6),
                          labelColor: const Color(0xFF000000),
                          indicatorColor: Theme.of(context).colorScheme.primary,
                          labelStyle:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,),
                          tabs: [
                            Tab(
                                text: "ACCOUNT"
                            ),
                            Tab(
                                text: "ADDRESS"
                            ),
                            Tab(
                                text: "BANCKING"
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),
                  // SizedBox(height: 10,),
                  type=="account"?Container(
                    color:Colors.white,
                    padding: EdgeInsets.only(top: 0,left: 16,right: 16),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                            color:Colors.white,
                              boxShadow: [
                                BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                              ]
                          ),
                          child: TextField(

                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(
                                labelText: 'Full Name',
                                hintText: 'Enter Your Name',
                                fillColor: Colors.white,
                                isDense: true

                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color:Colors.white,
                              boxShadow: [
                                BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                              ]
                          ),
                          child: TextField(
                            controller: adharController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(

                                labelText: 'Aadhar Details',
                                hintText: '*1234',

                                isDense: true
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color:Colors.white,
                              boxShadow: [
                                BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                              ]
                          ),
                          child: TextField(
                            controller: panController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(

                                labelText: 'PAN Card Details',
                                hintText: '*1234',

                                isDense: true
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color:Colors.white,
                              boxShadow: [
                                BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                              ]
                          ),
                          child: TextField(
                            controller: emailController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(

                                labelText: 'Email Address',
                                hintText: 'aryansethi@gmail.com',
                                suffixIcon: Icon(Icons.edit,color: Colors.black,),

                                isDense: true
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color:Colors.white,
                              boxShadow: [
                                BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                              ]
                          ),
                          child: TextField(
                            controller: contactController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(

                                labelText: 'Contact Number',
                                hintText: '91+ 9867345212',
                                suffixIcon: Icon(Icons.edit,color: Colors.black,),
                               isDense: true
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color:Colors.white,
                              boxShadow: [
                                BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                              ]
                          ),
                          child: TextField(
                            controller: dobController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(

                                labelText: 'Date of Birth',
                                hintText: '22/03/1998',

                                isDense: true
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color:Colors.white,
                              boxShadow: [
                                BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                              ]
                          ),
                          child: TextField(
                            controller: genderController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(

                                labelText: 'Gender',
                                hintText: 'Male',

                                isDense: true
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color:Colors.white,
                              boxShadow: [
                                BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                              ]
                          ),
                          child: TextField(
                            controller: nationalityController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(

                                labelText: 'Nationality',
                                hintText: 'Indian',

                                isDense: true
                            ),
                          ),
                        ),
                        SizedBox(height: 100,)
                      ],
                    ),
                  ):Container(),
                  type=="address"?Container(
                    padding: EdgeInsets.only(top: 0,left: 16,right: 16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 350,
                          width: MediaQuery.of(context).size.width*.9,
                          child: ListView.builder(
                            // itemExtent: 150,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) =>  Padding(
                                padding: const EdgeInsets.only(left: 0.0,right: 0.0,top: 16),
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Color(0xffF9F9F9)
                                      // image: DecorationImage(
                                      //   image: AssetImage("image/Rectangle 1536.png"),
                                      //   fit: BoxFit.cover,
                                      // ),
                                    ),
                                  height:140,
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width*.9,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Address Line ${index+1}",
                                            textAlign: TextAlign.center,
                                            style:
                                            Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Color(0xff2D2D2D),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Spacer(),
                                          ElevatedButton(
                                            style:   ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(index==0?Color(0XFFF9F9F9):Theme.of(context).colorScheme.primary.withOpacity(0.2)),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(18.0),
                                                        side: BorderSide(color: Color(0xff747474),width: 0.38)
                                                    )
                                                )
                                            ),
                                            onPressed: (){
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.only(right: 8.0,left: 8,top: 10,bottom: 10),
                                              child: Text(index==0?'Default':"Make Default", style:
                                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: Theme.of(context).colorScheme.primary,
                                                decoration:index==0?TextDecoration.none: TextDecoration.underline,
                                                fontWeight:index==0? FontWeight.w400:FontWeight.bold,
                                              ),),
                                            ),
                                          ),
                                          Spacer(),
                                          Image.asset("image/oredit.png",height: 18,),
                                          // Icon(Icons.edit,size: 20,color: Color(0xff747474),),
                                          SizedBox(width: 5,),
                                          Image.asset("image/updelete.png",height: 18,),

                                        ],
                                      ),
                                      SizedBox(height: 16,),
                                      Text("107, GK-1, Andheri East, Suburban, Mumbai, Maharashtra India - 400234",
                                        textAlign: TextAlign.left,
                                        style:
                                        Theme.of(context).textTheme.bodyText1!.copyWith(
                                          color: Color(0xff959595),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                              ),
                              itemCount: 2),
                        ),
                        // ElevatedButton(
                        //   style:   ButtonStyle(
                        //       backgroundColor: MaterialStateProperty.all(Color(0XFF8DAB7F)),
                        //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        //           RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(15.0),
                        //             // side: BorderSide(color: Colors.red)
                        //           )
                        //       )
                        //   ),
                        //   onPressed: (){
                        //   },
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(right: 10.0,left: 10,top: 12,bottom: 12),
                        //     child: Text('Add new address', style:
                        //     Theme.of(context).textTheme.subtitle1!.copyWith(
                        //       color: Color(0XFFFFFFFF),
                        //       fontWeight: FontWeight.w600,
                        //     ),),
                        //   ),
                        // ),

                        InkWell(
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
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
                              child: Text("ADD NEW ADDRESS",
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
                        SizedBox(height: 32,)
                      ],
                    ),
                  ):Container(),
                  type=="banking"?Container(
                    padding: EdgeInsets.only(top: 0,left: 16,right: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Bank Details 1",
                              textAlign: TextAlign.center,
                              style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0xff2D2D2D),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 20,),
                            ElevatedButton(
                              style:   ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: BorderSide(color: Color(0xff747474),width: 0.38)
                                      )
                                  )
                              ),
                              onPressed: (){
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 8,top: 10,bottom: 10),
                                child: Text('Default', style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w400,
                                ),),
                              ),
                            ),
                            Spacer(),

                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                              color:Color(0xffF9F9F9),
                              boxShadow: [
                                BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                              ]
                          ),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(

                                labelText: 'Mode of Deposit',
                                hintText: 'Net Banking',

                                isDense: true
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                              color:Color(0xffF9F9F9),
                              boxShadow: [
                                BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                              ]
                          ),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(

                                labelText: 'Deposit Amount',
                                hintText: '1,00,000',

                                isDense: true
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                              color:Color(0xffF9F9F9),
                              boxShadow: [
                                BoxShadow(color:  Color(0xffEAEEF2),blurRadius: 2,offset: Offset(2,2))
                              ]
                          ),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(

                                labelText: 'Bid Limit',
                                hintText: '`10,00,000',

                                isDense: true
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        // SizedBox(
                        //   width: 240,
                        //   child: ElevatedButton(
                        //     style:   ButtonStyle(
                        //         backgroundColor: MaterialStateProperty.all(Color(0XFF8DAB7F)),
                        //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        //             RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(15.0),
                        //               // side: BorderSide(color: Colors.red)
                        //             )
                        //         )
                        //     ),
                        //     onPressed: (){
                        //     },
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(right: 10.0,left: 10,top: 12,bottom: 12),
                        //       child: Row(
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Text('Increade Bid Limit', style:
                        //           Theme.of(context).textTheme.subtitle1!.copyWith(
                        //             color: Color(0XFFFFFFFF),
                        //             fontWeight: FontWeight.w600,
                        //           ),),
                        //           SizedBox(width: 10,),
                        //           Icon(Icons.info_outline,color: Color(0XFFFFFFFF),size: 20,)
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        InkWell(
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
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
                              child:  Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Increade Bid Limit', style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Color(0XFFFFFFFF),
                                  fontWeight: FontWeight.w600,
                                ),),
                                SizedBox(width: 10,),
                                Icon(Icons.info_outline,color: Color(0XFFFFFFFF),size: 20,)
                              ],
                            ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ):Container(),
                  const SizedBox(height: 16,),
                  SizedBox(
                      height: 1100,
                      width: MediaQuery.of(context).size.width,
                      child: Footer()),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                  )
                ],
              )
          ),
        ),
      ),
      bottomNavigationBar: Dashboard2Ui(),
    );
  }
}

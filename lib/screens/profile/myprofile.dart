

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
  @override
  void initState() {
    // TODO: implement initState
   nameController.text="Aryan Raj";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
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

                            Image.asset("image/Ellipse 94.png",height: 75,),
                            CircleAvatar(
                              radius: 25,
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
                                            color: Color(0xff8DAB7F),
                                            fontWeight: FontWeight.w600,),),
                                          TextSpan(text: 'Aryan R.', style:  Theme.of(context).textTheme.headline6!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,),),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 3,),
                                    Row(
                                      children: [
                                        Image.asset("image/Vector (11).png",height: 16,),
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
                                        Text('Edit', style:
                                        Theme.of(context).textTheme.bodyText1!.copyWith(
                                          color: Color(0XFF2D2D2D),
                                          fontWeight: FontWeight.w600,
                                        ),),

                                        SizedBox(width: 5,),
                                        Icon(Icons.edit, color: Color(0XFF2D2D2D),size: 15,)
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
                    color: Color(0xffFFFFFF),
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
                  SizedBox(height: 10,),
                  type=="account"?Container(
                    padding: EdgeInsets.only(top: 0,left: 16,right: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Full Name',
                                hintText: 'Enter Your Name',
                                filled: true,
                                fillColor: Color(0xffF9F9F9),
                                isDense: true
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Aadhar Details',
                                hintText: '*1234',
                                filled: true,
                                fillColor: Color(0xffF9F9F9),
                                isDense: true
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'PAN Card Details',
                                hintText: '*1234',
                                filled: true,
                                fillColor: Color(0xffF9F9F9),
                                isDense: true
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email Address',
                                hintText: 'aryansethi@gmail.com',
                                suffixIcon: Icon(Icons.edit,color: Colors.black,),
                                filled: true,
                                fillColor: Color(0xffF9F9F9),
                                isDense: true
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Contact Number',
                                hintText: '91+ 9867345212',
                                suffixIcon: Icon(Icons.edit,color: Colors.black,),
                                filled: true,
                                fillColor: Color(0xffF9F9F9),
                                isDense: true
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Date of Birth',
                                hintText: '22/03/1998',
                                filled: true,
                                fillColor: Color(0xffF9F9F9),
                                isDense: true
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Gender',
                                hintText: 'Male',
                                filled: true,
                                fillColor: Color(0xffF9F9F9),
                                isDense: true
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nationality',
                                hintText: 'Indian',
                                filled: true,
                                fillColor: Color(0xffF9F9F9),
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
                                      image: DecorationImage(
                                        image: AssetImage("image/Rectangle 1536.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  height:140,
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width*.9,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Address Line 1",
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
                                                backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
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
                                                color: Color(0XFF466D33),
                                                fontWeight: FontWeight.w400,
                                              ),),
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(Icons.edit,size: 20,color: Color(0xff747474),),
                                          SizedBox(width: 5,),
                                          Icon(Icons.delete,size: 20,color: Color(0xff747474),),

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
                        ElevatedButton(
                          style:   ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0XFF8DAB7F)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    // side: BorderSide(color: Colors.red)
                                  )
                              )
                          ),
                          onPressed: (){
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0,left: 10,top: 12,bottom: 12),
                            child: Text('Add new address', style:
                            Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Color(0XFFFFFFFF),
                              fontWeight: FontWeight.w600,
                            ),),
                          ),
                        ),
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
                                          borderRadius: BorderRadius.circular(10.0),
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
                                  color: Color(0XFF466D33),
                                  fontWeight: FontWeight.w400,
                                ),),
                              ),
                            ),
                            Spacer(),

                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Mode of Deposit',
                                hintText: 'Net Banking',
                                filled: true,
                                fillColor: Color(0xffF9F9F9),
                                isDense: true
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Deposit Amount',
                                hintText: '1,00,000',
                                filled: true,
                                fillColor: Color(0xffF9F9F9),
                                isDense: true
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Bid Limit',
                                hintText: '`10,00,000',
                                filled: true,
                                fillColor: Color(0xffF9F9F9),
                                isDense: true
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          width: 240,
                          child: ElevatedButton(
                            style:   ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color(0XFF8DAB7F)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      // side: BorderSide(color: Colors.red)
                                    )
                                )
                            ),
                            onPressed: (){
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0,left: 10,top: 12,bottom: 12),
                              child: Row(
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

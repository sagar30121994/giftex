

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';
import 'package:giftex/screens/productdetailspage/productdetailpage.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../components/header.dart';
import '../customepaint.dart';

class MyAuctionReviewpage extends StatefulWidget {
  @override
  _MyAuctionReviewpageState createState() => _MyAuctionReviewpageState();
}

class _MyAuctionReviewpageState extends State<MyAuctionReviewpage> {
  int _pageIndex = 0;
  String type="auction";
  TextEditingController nameController=TextEditingController();
  List<Menu> data = [];
  static const countdownDuration = Duration(minutes: 10);
  Duration duration = Duration();
  // Timer? timer;
  String auctionType="";
  bool countDown =true,selected=false;
  Widget _buildList(Menu list) {
    if (list.subMenu!.isEmpty)
      return Builder(
          builder: (context) {
            return ListTile(
              // onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategory(list.name))),
                leading: Checkbox(
                  value: selected,
                  onChanged: (bool? value){},
                ),
                title: Text(list!.name!, style:
                Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),)
            );
          }
      );
    return ExpansionTile(

      title: Text(
        list.name!,
        style:
        Theme.of(context).textTheme.subtitle1!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: list.subMenu!.map(_buildList).toList(),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    dataList.forEach((element) {
      data.add(Menu.fromJson(element));
    });
    nameController.text="Aryan Raj";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*.9,
          // padding: EdgeInsets.only(top: 16,left: 16,right: 16),
          child: SingleChildScrollView(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text("My Auction Review",
                      textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      // itemExtent: 150,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) =>  Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                              color: Color(0xffFFFFFF),
                              height:550,
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 150 / 2.0,bottom: 0),
                                    child: Container(
                                      //replace this Container with your Card
                                      color: Color(0xffF9F9F9),
                                      height:500.0,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25.0,right: 25),
                                      child: Image.asset("image/Bitmap6.png",height: 250,
                                        width: MediaQuery.of(context).size.width*.65,
                                        fit: BoxFit.contain,

                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 250,bottom: 0,left: 25.0,right: 25),
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(width: 20,),
                                          Text("JAMINI ROY",
                                            textAlign: TextAlign.center,
                                            style:
                                            Theme.of(context).textTheme.headline6!.copyWith(
                                              color: Colors.black,
                                              letterSpacing: 2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Mother & Child",
                                            textAlign: TextAlign.center,
                                            style:
                                            Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Color(0xff747474),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Estimate Value ",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                                      color: Color(0xff747474),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text("₹50,000- ₹75,000",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Color(0xff202232),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Bid Closing in",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                                      color: Color(0xff747474),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    children: [
                                                      Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(8),
                                                            color: Color(0xff8C9FB1),
                                                          ),
                                                          padding: EdgeInsets.all(4),
                                                          child:Text("02",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
                                                      ),
                                                      Container(
                                                        // color: Colors.black,
                                                          padding: EdgeInsets.all(4),
                                                          child:Text(":")
                                                      ),
                                                      Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(8),
                                                            color: Color(0xff8C9FB1),
                                                          ),

                                                          padding: EdgeInsets.all(4),
                                                          child:Text("14",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
                                                      ),

                                                      Container(
                                                        // color: Colors.black,
                                                          padding: EdgeInsets.all(4),
                                                          child:Text(":")
                                                      ),

                                                      Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(8),
                                                            color: Color(0xff8C9FB1),
                                                          ),
                                                          padding: EdgeInsets.all(4),
                                                          child:Text("59",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Current Bid",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                                      color: Color(0xff747474),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text("₹50,000",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Color(0xff202232),
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Next Valid Bid",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                    Theme.of(context).textTheme.subtitle1!.copyWith(
                                                      color: Color(0xff747474),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text("₹75,000",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Theme.of(context).colorScheme.primary,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              ElevatedButton(
                                                style:   ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
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
                                                  child: Text('PROXY BID', style:
                                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                                    color: Color(0XFF2D2D2D),
                                                    fontWeight: FontWeight.bold,
                                                  ),),
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              InkWell(
                                                onTap: (){
                                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
                                                },
                                                child: Container(
                                                  height: 50,
                                                  // width: 150,
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [Color(0xffE74B52),Color(0xffE74B52),]
                                                      ),
                                                      // color: Color(0xff466D33),
                                                      borderRadius: BorderRadius.circular(24)
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 32.0,left: 32,top: 12,bottom: 12),
                                                      child: Text('BID NOW', style:
                                                      Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        color: Color(0XFFFFFFFF),
                                                        fontWeight: FontWeight.bold,
                                                      ),),
                                                    ),
                                                  ),
                                                ),),
                                            ],
                                          ),
                                          SizedBox(height: 8,),
                                        ],
                                      )
                                  ),

                                  Positioned(
                                    right: 16,
                                    top: 50,
                                    child: Column(
                                      children: [
                                        Container(


                                          child: Text("Lot 01"),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            color: Colors.lightBlueAccent.withOpacity(.2),

                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),

                                        ),

                                        SizedBox(height:12),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(16),
                                              color: Color(0xffEAF1DB)

                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                          child: Text("5 BIDS"),

                                        ),
                                        SizedBox(height:12),
                                        Icon(Icons.favorite_border,color: Colors.grey,),
                                        SizedBox(height:12),
                                        Icon(Icons.open_in_full,color: Colors.grey,),
                                        SizedBox(height:12),
                                        // Container(
                                        //   padding: EdgeInsets.all(16),
                                        //   decoration: BoxDecoration(
                                        //     color:  Colors.lightBlueAccent.withOpacity(.2),
                                        //     borderRadius: BorderRadius.circular(32)
                                        //
                                        //   ),
                                        // )
                                        Image.asset("image/earth.png",height: 50,)
                                      ],
                                    ),
                                  )

                                ],
                              )
                          ),
                        ),
                        itemCount: 4),
                  ),
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

    );
  }

}
class Menu {
  String? name;
  IconData? icon;
  List<Menu>? subMenu = [];

  Menu({this.name, this.subMenu, this.icon});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    if (json['subMenu'] != null) {
      subMenu!.clear();
      json['subMenu'].forEach((v) {
        subMenu?.add(new Menu.fromJson(v));
      });
    }
  }
}
List dataList = [
  {
    "name": "Category",
    "icon": Icons.payment,
    "subMenu": [
      {"name": "Contemporary Art"},
      {"name": "Paintings"},
      {"name": "Antique Furniture"},
      {"name": "Antique"}
    ]
  },
  {
    "name": "Artist Name",
    "icon": Icons.volume_up,
    "subMenu": [
      {"name": "Jamini Roy"},
      {"name": "M. F. Hussain"},
      {"name": "Horace Van Ruth"},
      {"name": "Sailoz Mookherhea"}
    ]
  },
  {
    "name": "Price",

    "subMenu": [
      {"name": "0-500"},
      {"name": "500-1000"},
      {"name": "1000-2000"},
      {"name": "above 2000"}
    ]
  },
];

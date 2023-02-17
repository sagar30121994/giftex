

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
                                            fontWeight: FontWeight.w400,),),
                                          TextSpan(text: 'Aryan R.', style:  Theme.of(context).textTheme.headline6!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,),),
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
                                    child: Text('Edit', style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0XFF2D2D2D),
                                      fontWeight: FontWeight.w600,
                                    ),),
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
                                  color: Color(0xff747474),
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
                          padding: const EdgeInsets.only(left: 0.0,right: 0.0,top: 16),
                          child: Container(
                              color: Color(0xffFFFFFF),
                              height:400,
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
                                      child: Image.asset("image/Bitmap6.png",height: 180,),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 370 / 2.0,bottom: 0,left: 25.0,right: 25),
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(width: 20,),
                                          Text("Jamini Roy",
                                            textAlign: TextAlign.center,
                                            style:
                                            Theme.of(context).textTheme.headline6!.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
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
                                                  Text("Category Name",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Color(0xff747580),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text("20cm X 25cm",
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
                                                  Text("Bid Closing in",
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
                                                      fontWeight: FontWeight.w600,
                                                    ),
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
                                                  padding: const EdgeInsets.only(right: 0.0,left: 0,top: 12,bottom: 12),
                                                  child: Text('Proxy Bid', style:
                                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                                    color: Color(0XFF2D2D2D),
                                                    fontWeight: FontWeight.w600,
                                                  ),),
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              ElevatedButton(
                                                style:   ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(Color(0XFF8DAB7F)),
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20.0),
                                                          // side: BorderSide(color: Colors.red)
                                                        )
                                                    )
                                                ),
                                                onPressed: (){
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(right: 0.0,left:0,top: 12,bottom: 12),
                                                  child: Text('Buy Now', style:
                                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                                    color: Color(0XFFFFFFFF),
                                                    fontWeight: FontWeight.w600,
                                                  ),),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                  ),
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
      bottomNavigationBar: Dashboard2Ui(),
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

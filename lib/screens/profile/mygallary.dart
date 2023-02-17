

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../components/header.dart';
import '../customepaint.dart';

class MyGallarypage extends StatefulWidget {
  @override
  _MyGallarypageState createState() => _MyGallarypageState();
}

class _MyGallarypageState extends State<MyGallarypage> {
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
      body: Container(
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
                  child: Text("My Gallery",
                    textAlign: TextAlign.center,
                    style:
                    Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text("Your curated list of wishlist",
                    textAlign: TextAlign.center,
                    style:
                    Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  color: Color(0xffFFFFFF),
                  child: DefaultTabController(
                    length: 2,
                    child:  SingleChildScrollView(
                      child: TabBar(
                        onTap: (index) {
                          setState(() {

                            if(index==0) { type="auction";}
                            if(index==1) {type="store";}
                          });
                          print(index);
                        },
                        // indicator: BoxDecoration(
                        //     color: tabColor
                        // ),
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
                              text: "AUCTION GALLERY"
                          ),
                          Tab(
                              text: "STORE GALLERY"
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 10,),
                type=="auction"?Container(
                  height: 600,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.menu_sharp,size: 30,),
                          SizedBox(width: 10,),
                          Icon(Icons.dashboard_outlined,size: 30,),
                          SizedBox(width: 10,),
                        ],
                      ),
                      SizedBox(
                        height: 500,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          // itemExtent: 150,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) =>  Padding(
                              padding: const EdgeInsets.only(left: 0.0,right: 0.0,top: 16),
                              child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("image/Rectangle (6).png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height:330,
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height:180,
                                            child: Column(
                                              children: [
                                                Image.asset("image/Bitmap1.png",height: 140,width: 90,fit: BoxFit.cover,),
                                                Spacer(),
                                                Text("Bid Closing in",
                                                  textAlign: TextAlign.center,
                                                  style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0xff747580),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 16,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(

                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(16)),
                                                      color: Color.fromRGBO(117, 206, 246, 0.249918),
                                                    ),
                                                    child: Text('Lot 01', style:
                                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Color(0XFF2D2D2D),
                                                      fontWeight: FontWeight.w600,
                                                    ),),
                                                  ),
                                                  SizedBox(width: 16,),
                                                  Container(

                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(16)),
                                                      color: Color.fromRGBO(234, 241, 219, 1),
                                                    ),
                                                    child: Text('5 BIDS', style:
                                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      color: Color(0XFF929090),
                                                      fontWeight: FontWeight.w600,
                                                    ),),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10,),
                                              Text("Jamini Roy",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 5,),
                                              Text("Mother & Child",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Color(0xff747474),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(height: 16,),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Estimate Value ",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                    Theme.of(context).textTheme.bodyText1!.copyWith(
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
                                              SizedBox(height: 16,),
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
                                                        Theme.of(context).textTheme.bodyText1!.copyWith(
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
                                                  SizedBox(width: 15,),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Next Valid Bid",
                                                        textAlign: TextAlign.center,
                                                        style:
                                                        Theme.of(context).textTheme.bodyText1!.copyWith(
                                                          color: Color(0xff747474),
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(height: 10,),
                                                      Text("₹75,000",
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
                                              SizedBox(height: 10,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                    style:   ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(16.0),
                                                                side: BorderSide(color: Color(0xff747474),width: 0.38)
                                                            )
                                                        )
                                                    ),
                                                    onPressed: (){
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 0.0,left: 0,top: 12,bottom: 12),
                                                      child: Text('Proxy Bid', style:
                                                      Theme.of(context).textTheme.caption!.copyWith(
                                                        color: Color(0XFF2D2D2D),
                                                        fontWeight: FontWeight.w400,
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
                                                      padding: const EdgeInsets.only(right: 0.0,left: 0,top: 12,bottom: 12),
                                                      child: Text('Bid Now', style:
                                                      Theme.of(context).textTheme.caption!.copyWith(
                                                        color: Color(0XFFFFFFFF),
                                                        fontWeight: FontWeight.w600,
                                                      ),),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )
                              ),
                            ),
                            itemCount: 2),
                      ),
                    ],
                  ),
                ):Container(),
                type=="store"?Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.menu_sharp,size: 30,),
                          SizedBox(width: 10,),
                          Icon(Icons.dashboard_outlined,size: 30,),
                          SizedBox(width: 10,),
                        ],
                      ),
                      SizedBox(
                        height: 500,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          // itemExtent: 150,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) =>  Padding(
                              padding: const EdgeInsets.only(left: 0.0,right: 0.0,top: 16),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                  height:210,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("image/Rectangle (7).png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset("image/Bitmap1.png",height: 80,width: 90,fit: BoxFit.cover,),
                                          SizedBox(width: 20,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10,),
                                              Text("Jamini Roy",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 5,),
                                              Text("Mother & Child",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                                  color: Color(0xff747474),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Image.asset("image/Vector (15).png",height: 30,)
                                        ],
                                      ),
                                      SizedBox(height: 10,),
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
                                              Text("MRP.",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                                  color: Color(0xff747580),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Text("₹50,000",
                                                textAlign: TextAlign.center,
                                                style:
                                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                                  color: Color(0xff466D33),
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
                                                        borderRadius: BorderRadius.circular(16.0),
                                                        side: BorderSide(color: Color(0xff747474),width: 0.38)
                                                    )
                                                )
                                            ),
                                            onPressed: (){
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 0.0,left: 0,top: 12,bottom: 12),
                                              child: Text('ADD TO CART', style:
                                              Theme.of(context).textTheme.caption!.copyWith(
                                                color: Color(0XFF2D2D2D),
                                                fontWeight: FontWeight.w400,
                                              ),),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                              ),
                            ),
                            itemCount: 4),
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



import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';
import 'package:giftex/screens/productdetailspage/productdetailpage.dart';

import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../customepaint.dart';

class FillterSearchpage extends StatefulWidget {
  @override
  _FillterSearchpageState createState() => _FillterSearchpageState();
}

class _FillterSearchpageState extends State<FillterSearchpage> {
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
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Image.asset("image/app1.png"),
        actions: [
          Image.asset("image/app2.png"),
          SizedBox(width: 3,),
          Image.asset("image/app3.png"),
          SizedBox(width: 3,),
          Container(
              width: 45,
              color: Color(0XFF8DAB7F),
              child: Image.asset("image/app4.png")),
          // SizedBox(width: 3,),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*.9,
        // padding: EdgeInsets.only(top: 16,left: 16,right: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 320,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0,bottom: 0,right:160,left: 0),
                      child: Image.asset("image/Rectangle 1456 (1).png", height: 260.0,width: MediaQuery.of(context).size.width*.8,fit: BoxFit.cover,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 210,bottom: 0,right:0,left: 0),
                      child: Image.asset("image/Rectangle 1455.png", height: 80.0,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30,bottom: 0,right:0,left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("image/image 13.png", height: 200.0,width: 100,fit: BoxFit.cover,),
                          SizedBox(width: 16,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Arts",
                                style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Color(0XFF000000),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 16,),
                              Text(
                                "Shop\nPaintings",
                                style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                  color: Color(0XFF000000),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 16,),
                              Container(
                                width: MediaQuery.of(context).size.width*.5,
                                child: Text(
                                  "Discover our online destination where purchasing is immediate",
                                  style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0XFF747474).withOpacity(0.79),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
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
                                  padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                  child: Text('Explore', style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0XFFFFFFFF),
                                    fontWeight: FontWeight.w600,
                                  ),),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ),
                  ],
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Art Paintings",
                  style:
                  Theme.of(context).textTheme.headline6!.copyWith(
                    color: Color(0XFF000000),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("image/Rectangle (9).png",fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),
              ),
              Container(
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
                      height: 450,
                      width: MediaQuery.of(context).size.width*.9,
                      child: ListView.builder(
                        // itemExtent: 150,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) =>  Padding(
                            padding: const EdgeInsets.only(left: 0.0,right: 0.0,top: 16),
                            child: Container(
                                padding: EdgeInsets.all(10),
                                height:170,
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
                                            SizedBox(height: 15,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [

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
                                                SizedBox(width: 10,),
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
                                                    child: Text('View details', style:
                                                    Theme.of(context).textTheme.caption!.copyWith(
                                                      color: Color(0XFF466D33),
                                                      fontWeight: FontWeight.w400,
                                                    ),),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                    SizedBox(height: 10,),

                                  ],
                                )
                            ),
                          ),
                          itemCount: 4),
                    ),
                    SizedBox(height: 15,),
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
                        child: Text('Load More', style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0XFF2D2D2D),
                          fontWeight: FontWeight.w400,
                        ),),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext dialogContext)
                                {
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.all(0),
                                    content: Container(
                                        padding: EdgeInsets.all(16),
                                        height: 550,
                                        color: Color(0xffF5F5F5),
                                        child:Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.sort,size: 30,color: Colors.black,),
                                                SizedBox(width: 8,),
                                                Text("Filters",
                                                  textAlign: TextAlign.center,
                                                  style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0xff000000),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text("Reset",
                                                  textAlign: TextAlign.center,
                                                  style:
                                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: Color(0xff7B9B6C),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 16,),
                                            SingleChildScrollView(
                                              child: SizedBox(
                                                height: 400,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  // physics: ScrollPhysics(),
                                                  itemCount: data.length,
                                                  itemBuilder: (BuildContext context, int index) =>
                                                      _buildList(data[index]),
                                                ),
                                              ),
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
                                                    child: Text('Close', style:
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
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => FillterSearchpage()));
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                                    child: Text('Apply', style:
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
                                  );
                                });
                          },
                          child: Container(
                            color: Color(0xffF4F4F4),
                            padding: EdgeInsets.only(left: 20,top: 12,right: 20,bottom: 12),
                            child: Row(
                              children: [
                                Icon(Icons.sort,size: 30,color: Colors.black,),
                                SizedBox(width: 8,),
                                Text("Filters",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),),
                        ),
                        SizedBox(width: 30,),
                        InkWell(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                                    ),
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [

                                            Text("Sort By",
                                              textAlign: TextAlign.center,
                                              style:
                                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0xff000000),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16,),
                                        ListTile(
                                          leading: Checkbox(
                                            value: selected,
                                            onChanged: (bool? value){},
                                          ),
                                          title: Text("Contemporary Art", style:
                                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: Checkbox(
                                            value: selected,
                                            onChanged: (bool? value){},
                                          ),
                                          title: Text("M. F. Hussian", style:
                                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: Checkbox(
                                            value: selected,
                                            onChanged: (bool? value){},
                                          ),
                                          title: Text("Antique", style:
                                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: Checkbox(
                                            value: selected,
                                            onChanged: (bool? value){},
                                          ),
                                          title: Text("Impressionist & Modern Art", style:
                                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                                child: Text('Close', style:
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
                                                padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                                                child: Text('Apply', style:
                                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                                  color: Color(0XFFFFFFFF),
                                                  fontWeight: FontWeight.w600,
                                                ),),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            color: Color(0xffF4F4F4),
                            padding: EdgeInsets.only(left: 20,top:12,right: 20,bottom: 12),
                            child: Row(
                              children: [
                                Icon(Icons.sort,size: 30,color: Colors.black,),
                                SizedBox(width: 8,),
                                Text("Sort By",
                                  textAlign: TextAlign.center,
                                  style:
                                  Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),),
                        )
                      ],
                    ),
                    SizedBox(height: 16,),
                    SizedBox(

                        width: MediaQuery.of(context).size.width,
                        child: Footer()),
                  ],
                ),
              )
            ],
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

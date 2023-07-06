import 'package:flutter/material.dart';
import 'package:giftex/screens/components/bottomnavigationbar/dashborard2.dart';

import '../components/footer/footer.dart';
import '../components/header.dart';

class MyOrderProductpage extends StatefulWidget {
  @override
  _MyOrderProductpageState createState() => _MyOrderProductpageState();
}

class _MyOrderProductpageState extends State<MyOrderProductpage> {
  int _pageIndex = 0;
  String type = "auction";
  TextEditingController nameController = TextEditingController();
  List<Menu> data = [];
  static const countdownDuration = Duration(minutes: 10);
  Duration duration = Duration();
  // Timer? timer;
  String auctionType = "";
  bool countDown = true, selected = false;
  Widget _buildList(Menu list) {
    if (list.subMenu!.isEmpty)
      return Builder(builder: (context) {
        return ListTile(
            // onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategory(list.name))),
            leading: Checkbox(
              value: selected,
              onChanged: (bool? value) {},
            ),
            title: Text(
              list.name!,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
            ));
      });
    return ExpansionTile(
      title: Text(
        list.name!,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
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
    nameController.text = "Aryan Raj";
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
          height: MediaQuery.of(context).size.height * .9,
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: SingleChildScrollView(
              child: Column(
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
                        Image.asset(
                          "image/Ellipse 94.png",
                          height: 75,
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('image/image 40.png'),
                          // child: Image.asset("image/image 40.png",fit: BoxFit.fill,),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
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
                                      TextSpan(
                                        text: 'Hello ',
                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                              color: Color(0xff8DAB7F),
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                      TextSpan(
                                        text: 'Aryan R.',
                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "image/Vector (11).png",
                                      height: 16,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "Mumbai. India",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0xff2D2D2D),
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Color(0xff747474), width: 0.38)))),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                                child: Text(
                                  'Edit',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: Color(0XFF2D2D2D),
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * .6,
                        //   child: Text(
                        //     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
                        //     textAlign: TextAlign.left,
                        //     style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        //           color: Color(0xff747474),
                        //           fontWeight: FontWeight.w400,
                        //         ),
                        //   ),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Order Id  #123456789768",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("image/Rectangle (8).png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Details",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Order Date : 19/09/2022",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Order Status : Delivered",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Order Total : ₹50,000",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "(incl GST & Shipping)",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Item Tracking Status",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Order Placed : 19/09/2022",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Order Shipped : 20/09/2022",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Order Delivered : 24/09/2022",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Product Details",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Image.asset(
                      "image/Rectangle (8).png",
                      fit: BoxFit.cover,
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "image/Bitmap1.png",
                        height: 140,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .6,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      "Product Id #123456789768",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0xff2D2D2D),
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      "Artist name",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0xff747474),
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Jamini Roy",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Mother & Child",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0xff747474),
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Category: Abstract",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0xff747580),
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "20cm X 25cm",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Color(0xff202232),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Payment Details",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Shipping Details",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Ayan Sethi\nAddress : 107, Gk-1, Andheri East, Mumbai, Maharashtra, India 101010",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone Number",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0xff2D2D2D),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "+91 9999999990",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0xff202232),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email Id",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0xff2D2D2D),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "ayansethi@gmail.com",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0xff202232),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Details",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0xff2D2D2D),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Payment via Visa *1456",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0xff202232),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Order Summary",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("image/Mask group.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Product MRP",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0xff2D2D2D),
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        Spacer(),
                        Text(
                          "₹ 50,000",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0xff2D2D2D),
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          "Shipping",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0xff2D2D2D),
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        Spacer(),
                        Text(
                          "₹ 1,000",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0xff2D2D2D),
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          "GST (18 %)",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0xff2D2D2D),
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        Spacer(),
                        Text(
                          "₹ 4,000",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0xff2D2D2D),
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Image.asset("image/Line 45.png"),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          "Total",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0xff2D2D2D),
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Spacer(),
                        Text(
                          "₹ 55,000",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Color(0xff2D2D2D),
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            side: BorderSide(color: Color(0xff747474), width: 0.38)))),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0.0, left: 0, top: 12, bottom: 12),
                      child: Text(
                        'DOWNLOAD INVOICE',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Color(0XFF466D33),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0XFF8DAB7F)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          // side: BorderSide(color: Colors.red)
                        ))),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0.0, left: 0, top: 12, bottom: 12),
                      child: Text(
                        'WRITE A REVIEW',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Color(0XFFFFFFFF),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(height: 1100, width: MediaQuery.of(context).size.width, child: Footer()),
              SliverToBoxAdapter(
                child: Container(
                  color: Color(0xff1F2A52),
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
          )),
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

import 'package:flutter/material.dart';
import 'package:giftex/screens/components/footer/footer.dart';
import 'package:giftex/screens/components/header.dart';

class ContactusPage extends StatefulWidget {
  @override
  _ContactusPageState createState() => _ContactusPageState();
}

class _ContactusPageState extends State<ContactusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .90,
          child: SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                "CONTACT US",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "FIND YOUR SERVICES THAT FITS YOUR NEEDS",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .80,
                child: Text(
                  "We feature premium artworks including modern, contemporary, and street art",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              // const SizedBox(height: 16,),
              Container(
                height: 260,
                child: Stack(
                  children: [
                    Positioned(
                      top: 54,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 0),
                        child: Container(
                          //replace this Container with your Card
                          color: Color(0xff1F2A52),
                          height: 160.0,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 54,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xff8C9FB1),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(265),
                                bottomRight: Radius.circular(265),
                              ),
                            ),
                            height: 140.0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 54,
                        child: Image.asset(
                          "image/table.png",
                          height: 184,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      height: 255,
                      color: Color(0xffF3E8E9),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset("image/Vector (14).png"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "HEAD OFFICE",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.headline6!.copyWith(
                                      letterSpacing: 2,
                                      color: Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "No 5, Floor 1, Plot - 32, Bhogilal Hargovinddas Building, Kakushroo Dubash Marg, Kala Ghoda, Fort, Mumbai City, Maharashtra, 400001",
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Divider(),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "image/rcall.png",
                                width: 24,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "+91 22 6901 4800",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "image/mail.png",
                                width: 24,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "contact@astaguru.com",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
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
                    Container(
                      height: 220,
                      color: Color(0xffEAEEF2),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset("image/Vector (12).png"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "GALLERY",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "22/26 ICIA Building, K. Dubhash Marg, Next to M. C. Ghia Hall, Kala Ghoda. Mumbai - 400 023",
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "image/rcall.png",
                                width: 24,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "+91 22 6901 4800",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "image/mail.png",
                                width: 24,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "contact@astaguru.com",
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffEAEEF2),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lets Get In Touch",
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Color(0XFF000000),
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Fill The Form Below And Get In Touch",
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Color(0XFF000000),
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                            padding: EdgeInsets.only(left: 8),
                            child: TextField(
                              // controller: nameController,
                              keyboardType: TextInputType.name,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Name',
                                hintText: 'Enter Your Name',
                                // prefixIcon:
                                // prefixIcon: ,
                                icon: Image.asset("image/people.png", height: 32),
                                filled: true,
                                isDense: false,
                                fillColor: Color(0xffFFFFFF),
                                // isDense: true
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                            padding: EdgeInsets.only(left: 8),
                            child: TextField(
                              // controller: nameController,
                              keyboardType: TextInputType.emailAddress,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Email ID',
                                hintText: 'aryansethi@gmail.com',
                                icon: Image.asset("image/email.png", height: 24),
                                // prefixIcon: Icon(Icons.email_outlined,color: Color(0xff779868)),
                                filled: true,
                                fillColor: Color(0xffFFFFFF),
                                // isDense: true
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                            padding: EdgeInsets.only(left: 8),
                            child: TextField(
                              // controller: nameController,
                              keyboardType: TextInputType.phone,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Mobile No.',
                                hintText: '91+ 9867345212',
                                icon: Image.asset("image/phone.png", height: 28),
                                // prefixIcon: Icon(Icons.call,color: Color(0xff779868),),
                                filled: true,
                                fillColor: Color(0xffFFFFFF),
                                // isDense: true
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                            padding: EdgeInsets.only(left: 8),
                            child: TextField(
                              // controller: nameController,

                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),

                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Queries',

                                icon: Image.asset("image/pqueries.png", height: 28),
                                // prefixIcon: Image.asset("image/pass.png",height: 8),
                                filled: true,
                                fillColor: Color(0xffFFFFFF),
                                // isDense: true
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
                            },
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xffB45156),
                                    Color(0xffE74B52),
                                  ]),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "SUBMIT",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xffffffff),
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Image.asset("image/imapo.png"),
                          SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
              Container(
                color: Color(0xff1F2A52),
                height: 30,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          )),
        ),
      ),
      // bottomNavigationBar: Dashboard2Ui(),
    );
  }

  Widget _buildPlayerModelList() {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 0,
      child: ExpansionTile(
        backgroundColor: Color(0xffF9F9F9),
        leading: Image.asset("image/Group.png"),
        title: Text(
          "Sales Representative ",
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Color(0XFF000000),
                fontWeight: FontWeight.w600,
              ),
        ),
        subtitle: Row(
          children: [
            Image.asset("image/Vector (11).png"),
            SizedBox(
              width: 5,
            ),
            Text(
              "Mumbai",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Color(0XFF000000),
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Job Description",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 15,
                      color: Color(0xff8DAB7F),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Generating leads.",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Color(0XFF000000),
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
                    Icon(
                      Icons.circle,
                      size: 15,
                      color: Color(0xff8DAB7F),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Meeting or exceeding sales goals.",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Color(0XFF000000),
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
                    Icon(
                      Icons.circle,
                      size: 15,
                      color: Color(0xff8DAB7F),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      child: Text(
                        "Negotiating all contracts with prospective clients.",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 15,
                      color: Color(0xff8DAB7F),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      child: Text(
                        "Helping determine pricing schedules for quotes, promotions, and negotiations.",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 15,
                      color: Color(0xff8DAB7F),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Preparing weekly and monthly reports.",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Color(0XFF000000),
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
                    Icon(
                      Icons.circle,
                      size: 15,
                      color: Color(0xff8DAB7F),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      child: Text(
                        "Giving sales presentations to a range of prospective clients.",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0XFF000000),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 380,
                  child: Stack(
                    children: [
                      Container(
                        height: 360,
                        width: 410,
                        color: Color(0xffEAF1DB).withOpacity(0.7),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lets Work Together",
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0XFF000000),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Fill the form below and get in touch",
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0XFF000000),
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Name',
                                    hintText: 'Enter Your Name',
                                    prefixIcon: Icon(Icons.person_outline_sharp),
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email Id',
                                    hintText: 'Enter Your Email',
                                    prefixIcon: Icon(Icons.email_outlined),
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Mobile No',
                                    hintText: 'Enter Your No',
                                    prefixIcon: Icon(Icons.add_ic_call),
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Upload Resume',
                                    hintText: '',
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 340.0),
                        child: Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color(0XFF8DAB7F)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  // side: BorderSide(color: Colors.red)
                                ))),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                              child: Text(
                                'Apply Now',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0XFFFFFFFF),
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemModel {
  bool expanded;
  String? headerItem;
  String? discription;
  Color? colorsItem;
  String? img;

  ItemModel({this.expanded: false, this.headerItem, this.discription, this.colorsItem, this.img});
}

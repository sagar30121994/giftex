import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/responce/profile/GetRegInfoResponse.dart';
import 'package:giftex/viewmodel/bottomviewmodel.dart';
import 'package:giftex/viewmodel/profile/profileviewmodel.dart';
import 'package:intl/intl.dart';

import '../../data/network/models/responce/profile/GetCityResponse.dart';
import '../components/bottomnavigationbar/bottomnavigationbar.dart';
import '../components/footer/footer.dart';
import '../components/header.dart';

ProfileViewModel profileViewModel = ProfileViewModel();

class MyProfilepage extends StatefulWidget {
  BottomViewModel bottomViewModel;

  MyProfilepage(this.bottomViewModel);

  @override
  _MyProfilepageState createState() => _MyProfilepageState();
}

class _MyProfilepageState extends State<MyProfilepage> {
// class _MyProfilepageState extends State<MyProfilepage> implements PayUCheckoutProProtocol {
  int _pageIndex = 0;
  CountryList? selectedCountry;
  IndianStateList? selectedState;
  CityList? selectedCity;
  String type = "account";
  String _addressLine2 = "";
  String _yourName = "";
  String _addressLine1 = "";
  String _pinCode = "";
  String _gstNumber = "";
  int addressCount = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController adharController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController defaultController = TextEditingController();

  TextEditingController depositmodeController = TextEditingController();
  TextEditingController depositAmountController = TextEditingController();
  TextEditingController bidLimitController = TextEditingController();
  String newAddress = '';

  Future laodData() async {
    await bottomViewModel.profileViewModel!.getUserAllDetails();
    await profileViewModel.getRegInfo();
    setState(() {
      selectedCountry = profileViewModel.getRegInfoResponse!.countryList!.first;
      selectedState = profileViewModel.getRegInfoResponse!.indianStateList!.first;
    });
    nameController.text =
        "${(widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.basicDetails!.firstName ?? '')} ${(widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.basicDetails!.lastName ?? '')}";
    adharController.text =
        "${(widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.bankDetails!.adhaarCardNum ?? '')}";
    panController.text =
        "${(widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.bankDetails!.panCardNum ?? '')}";
    emailController.text =
        "${(widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.basicDetails!.email ?? '')}";
    contactController.text =
        "${(widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.basicDetails!.mobile ?? '')}";
    dobController.text =
        "${(widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.basicDetails!.dob ?? '')}";
    genderController.text =
        "${(widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.basicDetails!.gender ?? '')}";
    nationalityController.text =
        "${(widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.basicDetails!.nationality ?? '')}";

    depositAmountController.text =
        "${(widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.dipositedAmount ?? '0')}";

    bidLimitController.text =
        "${(widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.balanceAmount ?? '0')}";

    widget.bottomViewModel.profileViewModel!.getDashboardOverview().then((value) {});

    depositmodeController.text = "Net Banking";

    addressCount = widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address!.length;
  }

  // late PayUCheckoutProFlutter _checkoutPro;

  static const platform = const MethodChannel('paymentsChannel');

  @override
  void initState() {
    profileViewModel.setupValidations();
    laodData();

    super.initState();
    // _checkoutPro = PayUCheckoutProFlutter(this);
  }

  Future<void> makePayment(
      {String? amount,
      String? key,
      String? salt,
      String? product,
      String? transactionId,
      String? firstname,
      String? email,
      String? surl,
      String? furl,
      String? udf1,
      String? udf2,
      String? udf5,
      String? isproduction,
      String? hash,
      String? phone}) async {
    _handleLocationChanges();

    try {
      final String result = await platform.invokeMethod('makePayment', {
        "amount": amount,
        "key": key,
        "salt": salt,
        "product": product,
        "phone": phone,
        "transactionId": transactionId,
        "firstname": firstname,
        "email": email,
        "surl": surl,
        "furl": furl,
        "udf1": udf1,
        "udf2": udf2,
        "udf5": udf5,
        "isproduction": isproduction,
        "hash": hash
      });
    } on PlatformException catch (e) {
      debugPrint('Failed: ${e.message}.');
    }
  }

  void _handleLocationChanges() {
    const EventChannel _stream = EventChannel('paymentStream');

    _stream.receiveBroadcastStream().listen((onData) {
      print("************${onData}");
    });
  }

  String formateNumber(String number) {
    var f = NumberFormat('##,##,##,##,###.##', 'HI');

    return f.format(double.parse(number));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .9,
        // padding: EdgeInsets.only(top: 16,left: 16,right: 16),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
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
                        height: 95,
                        color: Color(0xffF3E8E9),
                      ),
                      CircleAvatar(
                        radius: 37,
                        backgroundImage: NetworkImage(
                            '${(widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.basicDetails!.profilePicUrl ?? '')}'),
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
                                            color: Color(0xffE74B52),
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    TextSpan(
                                      text:
                                          '${(widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.basicDetails!.firstName ?? '')}',
                                      style: Theme.of(context).textTheme.headline6!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
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
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!
                                          .address!.isEmpty
                                      ? Container()
                                      : Text(
                                          '${(widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address!.first!.city ?? '')}',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: Color(0xff2D2D2D),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Color(0XFFFFFFFF)),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                            side: BorderSide(color: Color(0xff747474), width: 0.38)))),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context, MaterialPageRoute(builder: (context) => DashboardUi(12)));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                                      child: Row(
                                        children: [
                                          Text(
                                            'EDIT',
                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: Theme.of(context).colorScheme.primary,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 2),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.edit_outlined,
                                            color: Color(0XFF2D2D2D),
                                            size: 15,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 16,
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
                      //           color: Color(0xff959595),
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
            Container(
              color: Colors.white,
              child: DefaultTabController(
                length: 3,
                child: SingleChildScrollView(
                  child: TabBar(
                    onTap: (index) async {
                      setState(() {
                        if (index == 0) {
                          type = "account";
                        }
                        if (index == 1) {
                          type = "address";
                        }
                        if (index == 2) {
                          type = "banking";
                          // await widget.bottomViewModel.profileViewModel!.getPaymentGrid();
                        }
                      });
                      if (index == 2) {
                        await widget.bottomViewModel.profileViewModel!.getPaymentGrid();
                      }
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
                    labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                    tabs: [
                      Tab(text: "ACCOUNT"),
                      Tab(text: "ADDRESS"),
                      Tab(text: "BANKING"),
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(height: 10,),
            type == "account"
                ? Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 0, left: 16, right: 16),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                          child: TextField(
                            controller: nameController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                            decoration: InputDecoration(
                                labelText: 'Full Name',
                                hintText: 'Enter Your Name',
                                fillColor: Colors.white,
                                isDense: true),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                          child: TextField(
                            controller: adharController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                            decoration: InputDecoration(labelText: 'Aadhar Details', hintText: '*1234', isDense: true),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                          child: TextField(
                            controller: panController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                            decoration:
                                InputDecoration(labelText: 'PAN Card Details', hintText: '*1234', isDense: true),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                          child: TextField(
                            controller: emailController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                            decoration: InputDecoration(
                                labelText: 'Email Address',
                                // hintText: 'aryansethi@gmail.com',
                                suffixIcon: Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                                isDense: true),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                          child: TextField(
                            controller: contactController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                            decoration: InputDecoration(
                                labelText: 'Contact Number',
                                // hintText: '91+ 9867345212',
                                suffixIcon: Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                                isDense: true),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                          child: TextField(
                            controller: dobController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                            decoration: InputDecoration(
                                labelText: 'Date of Birth',
                                // hintText: '22/03/1998',
                                isDense: true),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                          child: TextField(
                            controller: genderController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                            decoration: InputDecoration(
                                labelText: 'Gender',
                                // hintText: 'Male',
                                isDense: true),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                          child: TextField(
                            controller: nationalityController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                            decoration: InputDecoration(labelText: 'Nationality', hintText: 'Indian', isDense: true),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  )
                : Container(),
            type == "address"
                ? Container(
                    padding: EdgeInsets.only(top: 0, left: 16, right: 16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 350,
                          width: MediaQuery.of(context).size.width * .9,
                          child: ListView.builder(
                            // itemExtent: 150,
                            itemCount: widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!
                                .profile!.address!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 8),
                              child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(color: Color(0xffF9F9F9)
                                      // image: DecorationImage(
                                      //   image: AssetImage("image/Rectangle 1536.png"),
                                      //   fit: BoxFit.cover,
                                      // ),
                                      ),
                                  alignment: Alignment.center,
                                  height: 150,
                                  width: MediaQuery.of(context).size.width * .9,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                "${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].type ?? ''}",
                                                textAlign: TextAlign.start,
                                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                      color: Color(0xff2D2D2D),
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                              ),
                                            ),

                                            Flexible(
                                              flex: 3,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(index == 0
                                                        ? Color(0XFFF9F9F9)
                                                        : Theme.of(context).colorScheme.primary.withOpacity(0.2)),
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(18.0),
                                                            side: BorderSide(color: Color(0xff747474))))),
                                                onPressed: () async {
                                                  String? tempid;
                                                  tempid = profileViewModel!.getUserAllDetailsResponse == null
                                                      ? ""
                                                      : profileViewModel!.getUserAllDetailsResponse!.result == null
                                                          ? ''
                                                          : (profileViewModel!.getUserAllDetailsResponse!.result!
                                                                  .profile!.address![index].id! ??
                                                              "");

                                                  await _showSetDefaultAddressDialog(context, tempid);
                                                },
                                                child: Container(
                                                  // padding: const EdgeInsets.only(right: 8.0,left: 8,top: 10,bottom: 10),
                                                  child: Text(
                                                    index == 0 ? 'Default' : "Make Default",
                                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                                          color: Theme.of(context).colorScheme.primary,
                                                          decoration: index == 0
                                                              ? TextDecoration.none
                                                              : TextDecoration.underline,
                                                          fontWeight: index == 0 ? FontWeight.w400 : FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            Flexible(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () async {
                                                    String? tempid;
                                                    tempid = profileViewModel!.getUserAllDetailsResponse == null
                                                        ? ""
                                                        : profileViewModel!.getUserAllDetailsResponse!.result == null
                                                            ? ''
                                                            : (profileViewModel!.getUserAllDetailsResponse!.result!
                                                                    .profile!.address![index].id! ??
                                                                "");

                                                    await _showUpdateUserDialog(context, index, tempid);
                                                  },
                                                  child: Image.asset(
                                                    "image/oredit.png",
                                                    height: 18,
                                                  ),
                                                )),
                                            // Icon(Icons.edit,size: 20,color: Color(0xff747474),),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () async {
                                                    String? tempid;
                                                    tempid = profileViewModel!.getUserAllDetailsResponse == null
                                                        ? ""
                                                        : profileViewModel!.getUserAllDetailsResponse!.result == null
                                                            ? ''
                                                            : (profileViewModel!.getUserAllDetailsResponse!.result!
                                                                    .profile!.address![index].id! ??
                                                                "");

                                                    await _showDeleteAddressDialog(context, tempid);
                                                  },
                                                  child: Image.asset(
                                                    "image/updelete.png",
                                                    height: 18,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].addLine1 ?? ''} ${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].addLine2 ?? ''}, ${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].city ?? ''}, ${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].state ?? ''}, ${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].country ?? ''} - ${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].pinCode ?? ''}.",
                                          textAlign: TextAlign.left,
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: Color(0xff959595),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
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
                          onTap: () async {
                            await _showAddUserDialog(context);
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * .75,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xffB45156),
                                  Color(0xffE74B52),
                                ]),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "ADD NEW ADDRESS",
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
                          height: 32,
                        )
                      ],
                    ),
                  )
                : Container(),
            type == "banking"
                ? Container(
                    padding: EdgeInsets.only(top: 0, left: 16, right: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Bank Details 1",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0xff2D2D2D),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Color(0xff747474), width: 0.38)))),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0, left: 8, top: 10, bottom: 10),
                                child: Text(
                                  'Default',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: Theme.of(context).colorScheme.primary,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Color(0xffF9F9F9),
                              boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                          child: TextField(
                            controller: depositmodeController,
                            readOnly: true,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                            decoration: InputDecoration(
                                labelText: 'Mode of Deposit', hintText: '', isDense: true, border: InputBorder.none),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Color(0xffF9F9F9),
                              boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                          child: TextField(
                            controller: depositAmountController,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                            decoration:
                                InputDecoration(labelText: 'Deposit Amount', hintText: '1,00,000', isDense: true),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                              color: Color(0xffF9F9F9),
                              boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                          child: TextField(
                            controller: bidLimitController,
                            readOnly: true,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                            decoration: InputDecoration(
                                labelText: 'Bid Limit',
                                hintText: '`10,00,000',
                                isDense: true,
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                          onTap: () {
                            _showPaymentGridDialog(context);
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * .75,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xffB45156),
                                  Color(0xffE74B52),
                                ]),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Increase Bid Limit',
                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                          color: Color(0XFFFFFFFF),
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.info_outline,
                                    color: Color(0XFFFFFFFF),
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 16,
            ),
            Container(
              color: Color(0Xff2D2D2D),
              child: Column(
                children: [
                  Container(width: MediaQuery.of(context).size.width, child: Footer()),
                  Container(
                    color: Color(0Xff1F2A52),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
            //SizedBox(height: 1270, width: MediaQuery.of(context).size.width, child: Footer()),
            Container(
              color: Color(0xff1F2A52),
              //    height: 30,
              width: MediaQuery.of(context).size.width,
            ),
            /* SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                )*/
          ],
        )),
      ),
      // bottomNavigationBar: CommonBottumNavBar(3),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: CommonFloatingActionButton(),
    );
  }

  Future<void> _showAddUserDialog(BuildContext context) async {
    TextEditingController _YourNameController = TextEditingController();
    TextEditingController _AddressLine1Controller = TextEditingController();
    TextEditingController _AddressLine2Controller = TextEditingController();
    TextEditingController _PinCodeController = TextEditingController();
    TextEditingController _GSTNumberController = TextEditingController();
    await profileViewModel.getCity("15");

    selectedCountry = profileViewModel.getRegInfoResponse == null
        ? null
        : profileViewModel.getRegInfoResponse!.countryList == null
            ? null
            : (profileViewModel.getRegInfoResponse!.countryList?[98]);
    selectedState = profileViewModel.getRegInfoResponse == null
        ? null
        : (profileViewModel.getRegInfoResponse!.indianStateList == null)
            ? null
            : (profileViewModel.getRegInfoResponse!.indianStateList?[14]);
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            scrollable: true,
            title: Text("Add New Address"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: Observer(builder: (context) {
                    return TextField(
                      controller: _YourNameController,
                      onChanged: (str) {
                        profileViewModel.setYourName(str);
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      enableSuggestions: true,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: InputBorder.none,
                        labelText: 'Full Name',

                        errorText: profileViewModel.profileViewModelErrorState.yourName,
                        // prefixIcon:
                        // prefixIcon: ,
                        // icon: Image.asset("image/people.png", height: 32),
                        filled: true,
                        isDense: false,
                        fillColor: Color(0xffFFFFFF),
                        // isDense: true
                      ),
                    );
                  }),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: Observer(builder: (context) {
                    return TextField(
                      controller: _AddressLine1Controller,
                      onChanged: (str) {
                        profileViewModel.setAddressLine1(str);
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      enableSuggestions: true,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: InputBorder.none,
                        labelText: 'Address Line 1',

                        errorText: profileViewModel.profileViewModelErrorState.addressLine1,
                        // prefixIcon:
                        // prefixIcon: ,
                        // icon: Image.asset("image/people.png", height: 32),
                        filled: true,
                        isDense: false,
                        fillColor: Color(0xffFFFFFF),
                        // isDense: true
                      ),
                    );
                  }),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: Observer(builder: (context) {
                    return TextField(
                      controller: _AddressLine2Controller,
                      onChanged: (str) {
                        profileViewModel.setAddressLine1(str);
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      enableSuggestions: true,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: InputBorder.none,
                        labelText: 'Address Line 2',
                        errorText: profileViewModel.profileViewModelErrorState.addressLine2,
                        // prefixIcon:
                        // prefixIcon: ,
                        // icon: Image.asset("image/people.png", height: 32),
                        filled: true,
                        isDense: false,
                        fillColor: Color(0xffFFFFFF),
                        // isDense: true
                      ),
                    );
                  }),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: Observer(builder: (context) {
                    return TextField(
                      controller: _PinCodeController,
                      onChanged: (str) {
                        profileViewModel.setPinCode(str);
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      enableSuggestions: true,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      maxLength: 6,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: InputBorder.none,
                        labelText: 'Pin Code',
                        errorText: profileViewModel.profileViewModelErrorState.pinCode,
                        filled: true,
                        isDense: false,
                        fillColor: Color(0xffFFFFFF),
                        // isDense: true
                      ),
                    );
                  }),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: DropdownButtonFormField<CountryList?>(
                      value: selectedCountry,
                      isExpanded: true,
                      hint: Text("Select Country"),
                      items: (profileViewModel.getRegInfoResponse!.countryList ?? [])!.map((CountryList? e) {
                        return DropdownMenuItem(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '${e!.name ?? ''}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (CountryList? v) {
                        setState(() {
                          selectedCountry = v;
                        });
                      }),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: DropdownButtonFormField<IndianStateList?>(
                      value: selectedState,
                      isExpanded: true,
                      hint: Text("Select State"),
                      items: (profileViewModel.getRegInfoResponse!.indianStateList ?? [])!.map((IndianStateList? e) {
                        return DropdownMenuItem(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '${e!.name ?? ''}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (IndianStateList? v) async {
                        setState(() {
                          selectedState = v;
                        });
                        await profileViewModel.getCity(selectedState!.id ?? '');
                      }),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: Observer(builder: (context) {
                    return profileViewModel.isloadingcity
                        ? LinearProgressIndicator(
                            minHeight: 2,
                          )
                        : profileViewModel.getCityResponse == null
                            ? Container()
                            : profileViewModel.getCityResponse!.cityList == null
                                ? Container()
                                : DropdownButtonFormField<CityList?>(
                                    value: selectedCity,
                                    isExpanded: true,
                                    hint: Text("Select City"),
                                    items: (profileViewModel.getCityResponse!.cityList ?? [])!.map((CityList? e) {
                                      return DropdownMenuItem(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            '${e!.name ?? ''}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )),
                                        value: e,
                                      );
                                    }).toList(),
                                    onChanged: (CityList? v) {
                                      setState(() {
                                        selectedCity = v;
                                      });
                                    });
                  }),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: Observer(builder: (context) {
                    return TextField(
                      controller: _GSTNumberController,
                      onChanged: (str) {
                        profileViewModel.setGSTNumber(str);
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      enableSuggestions: true,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      maxLength: 15,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: InputBorder.none,
                        labelText: 'GST Number',
                        errorText: profileViewModel.profileViewModelErrorState.gSTNumber,
                        filled: true,
                        isDense: false,
                        fillColor: Color(0xffFFFFFF),
                        // isDense: true
                      ),
                    );
                  }),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  profileViewModel.validateAll();
                  if ((selectedState == null)) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please Select State'),
                      backgroundColor: Colors.orange,
                    ));
                  } else if ((selectedCity == null)) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please Select City'),
                      backgroundColor: Colors.orange,
                    ));
                  } else if (profileViewModel.profileViewModelErrorState.hasErrors) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please Enter all Mandatory Fields'),
                      backgroundColor: Colors.orange,
                    ));
                  } else {
                    await profileViewModel.getCity("15");
                    selectedState = profileViewModel.getRegInfoResponse!.indianStateList == null
                        ? null
                        : profileViewModel.getRegInfoResponse!.indianStateList![14];
                    String type = "Postal";
                    if (addressCount == 0) {
                      type = "Postal";
                    } else {
                      type = "Billing";
                    }
                    profileViewModel.validateAll();
                    HttpResponse res = await profileViewModel.AddMyNewAddress(
                        "",
                        _YourNameController.text,
                        _AddressLine1Controller.text,
                        _AddressLine2Controller.text,
                        _PinCodeController.text,
                        _GSTNumberController.text,
                        (selectedCountry == null) ? '' : selectedCountry!.name ?? '',
                        (selectedState == null) ? '' : selectedState!.name ?? '',
                        (selectedCity == null) ? '' : selectedCity!.name ?? '',
                        type,
                        "add");
                    if (res.status == 200) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(res.message ?? ''),
                        backgroundColor: Colors.green,
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(res.message ?? ''),
                        backgroundColor: Colors.orange,
                      ));
                    }
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Save'),
              ),
            ],
          );
        });
      },
    );
  }

  Future<void> _showUpdateUserDialog(BuildContext context, int index, String id) async {
    TextEditingController _YourNameController = TextEditingController();
    TextEditingController _AddressLine1Controller = TextEditingController();
    TextEditingController _AddressLine2Controller = TextEditingController();
    TextEditingController _PinCodeController = TextEditingController();
    TextEditingController _GSTNumberController = TextEditingController();

    await profileViewModel.getCity("15");
    selectedCountry = profileViewModel.getRegInfoResponse!.countryList![98];
    selectedState = profileViewModel.getRegInfoResponse!.indianStateList![14];

    _YourNameController.text =
        "${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].yourName ?? ''}";
    _AddressLine1Controller.text =
        "${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].addLine1 ?? ''}";
    _AddressLine2Controller.text =
        "${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].addLine2 ?? ''}";
    _PinCodeController.text =
        "${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].pinCode ?? ''}";
    _GSTNumberController.text =
        "${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].gstNum ?? ''}";

    profileViewModel.getRegInfoResponse!.countryList!.forEach((element) {
      if ((element.name ?? '').toUpperCase() ==
          "${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].country ?? ''}"
              .toUpperCase()) {
        selectedCountry = element;
      }
    });

    profileViewModel.getRegInfoResponse!.indianStateList!.forEach((element) {
      if ((element.name ?? '').toUpperCase() ==
          "${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].state ?? ''}"
              .toUpperCase()) {
        selectedState = element;
      }
    });

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            scrollable: true,
            title: Text("Update Address"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: Observer(builder: (context) {
                    return TextField(
                      controller: _YourNameController,
                      onChanged: (str) {
                        profileViewModel.setYourName(str);
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      enableSuggestions: true,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: InputBorder.none,
                        labelText: 'Full Name',
                        // hintText:"${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].yourName ?? ''}",

                        errorText: profileViewModel.profileViewModelErrorState.yourName,
                        filled: true,
                        isDense: false,
                        fillColor: Color(0xffFFFFFF),
                        // isDense: true
                      ),
                    );
                  }),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: Observer(builder: (context) {
                    return TextField(
                      controller: _AddressLine1Controller,
                      onChanged: (str) {
                        profileViewModel.setAddressLine1(str);
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      enableSuggestions: true,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: InputBorder.none,
                        labelText: 'Address Line 1',
                        // hintText: "${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].addLine1 ?? ''}",

                        errorText: profileViewModel.profileViewModelErrorState.addressLine1,
                        // prefixIcon:
                        // prefixIcon: ,
                        // icon: Image.asset("image/people.png", height: 32),
                        filled: true,
                        isDense: false,
                        fillColor: Color(0xffFFFFFF),
                        // isDense: true
                      ),
                    );
                  }),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: Observer(builder: (context) {
                    return TextField(
                      controller: _AddressLine2Controller,
                      onChanged: (str) {
                        profileViewModel.setAddressLine2(str);
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      enableSuggestions: true,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: InputBorder.none,
                        labelText: 'Address Line 2',
                        // hintText: "${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].addLine2 ?? ''}",
                        errorText: profileViewModel.profileViewModelErrorState.addressLine2,
                        filled: true,
                        isDense: false,
                        fillColor: Color(0xffFFFFFF),
                        // isDense: true
                      ),
                    );
                  }),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: Observer(builder: (context) {
                    return TextField(
                      controller: _PinCodeController,
                      onChanged: (str) {
                        profileViewModel.setPinCode(str);
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      enableSuggestions: true,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      maxLength: 6,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: InputBorder.none,
                        labelText: 'Pin Code',
                        // hintText: "${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].pinCode ?? ''}",
                        errorText: profileViewModel.profileViewModelErrorState.pinCode,
                        filled: true,
                        isDense: false,
                        fillColor: Color(0xffFFFFFF),
                        // isDense: true
                      ),
                    );
                  }),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: DropdownButtonFormField<CountryList?>(
                      value: selectedCountry,
                      isExpanded: true,
                      hint: Text("Select Country"),
                      items: (profileViewModel.getRegInfoResponse!.countryList ?? [])!.map((CountryList? e) {
                        return DropdownMenuItem(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '${e!.name ?? ''}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (CountryList? v) {
                        setState(() {
                          selectedCountry = v;
                        });
                      }),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: DropdownButtonFormField<IndianStateList?>(
                      value: selectedState,
                      isExpanded: true,
                      hint: Text("Select State"),
                      items: (profileViewModel.getRegInfoResponse!.indianStateList ?? [])!.map((IndianStateList? e) {
                        return DropdownMenuItem(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '${e!.name ?? ''}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (IndianStateList? v) async {
                        setState(() {
                          selectedState = v;
                        });
                        await profileViewModel.getCity(selectedState!.id ?? '');
                      }),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: Observer(builder: (context) {
                    return profileViewModel.isloadingcity
                        ? LinearProgressIndicator(
                            minHeight: 2,
                          )
                        : profileViewModel.getCityResponse == null
                            ? Container()
                            : profileViewModel.getCityResponse!.cityList == null
                                ? Container()
                                : DropdownButtonFormField<CityList?>(
                                    value: selectedCity,
                                    isExpanded: true,
                                    hint: Text("Select City"),
                                    items: (profileViewModel.getCityResponse!.cityList ?? [])!.map((CityList? e) {
                                      return DropdownMenuItem(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            '${e!.name ?? ''}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )),
                                        value: e,
                                      );
                                    }).toList(),
                                    onChanged: (CityList? v) {
                                      setState(() {
                                        selectedCity = v;
                                      });
                                    });
                  }),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xffEAEEF2), blurRadius: 2, offset: Offset(2, 2))]),
                  child: Observer(builder: (context) {
                    return TextField(
                      controller: _GSTNumberController,
                      onChanged: (str) {
                        profileViewModel.setGSTNumber(str);
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      enableSuggestions: true,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                      maxLength: 15,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: InputBorder.none,
                        labelText: 'GST Number',
                        // hintText: "${widget.bottomViewModel.profileViewModel!.getUserAllDetailsResponse!.result!.profile!.address?[index].gstNum ?? ''}",
                        errorText: profileViewModel.profileViewModelErrorState.gSTNumber,
                        filled: true,
                        isDense: false,
                        fillColor: Color(0xffFFFFFF),
                        // isDense: true
                      ),
                    );
                  }),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  profileViewModel.validateAll();
                  if ((selectedState == null)) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please Select State'),
                      backgroundColor: Colors.orange,
                    ));
                  } else if ((selectedCity == null)) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please Select City'),
                      backgroundColor: Colors.orange,
                    ));
                  } else if (profileViewModel.profileViewModelErrorState.hasErrors) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please Enter all Mandatory Fields'),
                      backgroundColor: Colors.orange,
                    ));
                  } else {
                    await profileViewModel.getCity("15");
                    selectedState = profileViewModel.getRegInfoResponse!.indianStateList == null
                        ? null
                        : profileViewModel.getRegInfoResponse!.indianStateList![14];
                    String type = "Postal";
                    if (addressCount == 0) {
                      type = "Postal";
                    } else {
                      type = "Billing";
                    }
                    profileViewModel.validateAll();
                    HttpResponse res = await profileViewModel.AddMyNewAddress(
                        "",
                        _YourNameController.text,
                        _AddressLine1Controller.text,
                        _AddressLine2Controller.text,
                        _PinCodeController.text,
                        _GSTNumberController.text,
                        (selectedCountry == null) ? '' : selectedCountry!.name ?? '',
                        (selectedState == null) ? '' : selectedState!.name ?? '',
                        (selectedCity == null) ? '' : selectedCity!.name ?? '',
                        type,
                        "update");
                    if (res.status == 200) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(res.message ?? ''),
                        backgroundColor: Colors.green,
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(res.message ?? ''),
                        backgroundColor: Colors.orange,
                      ));
                    }
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Save'),
              ),
            ],
          );
        });
      },
    );
  }

  Future<void> _showDeleteAddressDialog(BuildContext context, String addressId) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('Delete Address'),
            content: Text('Are you sure, you want to delete this address ?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  HttpResponse res = await profileViewModel.deleteMyAddress(addressId);
                  if (res.status == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(res.message ?? ''),
                      backgroundColor: Colors.green,
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(res.message ?? ''),
                      backgroundColor: Colors.orange,
                    ));
                  }
                  Navigator.of(context).pop();
                },
                child: Text('Delete'),
              ),
            ],
          );
        });
      },
    );
  }

  Future<void> _showPaymentGridDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('Increase Bid Limit'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "PAY AMOUNT",
                  style:
                      Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Bid Limits running low. Increase them immediately. Select one of the below slabs and see you bid limit increase immediately.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Deposit Amount",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold)),
                      Text("Bid Limits",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold)),
                      Text("Pay Now",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  children: widget.bottomViewModel.profileViewModel!.paymentGridResponse!.result!.paymentGrids!
                      .map(
                        (e) => SizedBox(
                          width: MediaQuery.of(context).size.width * .8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("₹${formateNumber(e.paymentAmount ?? "0")}",
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold)),
                              Text("₹${formateNumber(e.paymentAmount ?? "0.0")}",
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold)),
                              ElevatedButton(
                                  onPressed: () async {
                                    await widget.bottomViewModel.profileViewModel!.getPayment(e.paymentAmount!);

                                    // await widget.bottomViewModel.profileViewModel!.getPayment("1");

                                    // _checkoutPro.openCheckoutScreen(
                                    makePayment(
                                      udf1: widget.bottomViewModel.profileViewModel!.paymentResponce!.udf1!,
                                      udf2: widget.bottomViewModel.profileViewModel!.paymentResponce!.udf2!,
                                      udf5: widget.bottomViewModel.profileViewModel!.paymentResponce!.udf5!,
                                      key: widget.bottomViewModel.profileViewModel!.paymentResponce!.key ?? "",
                                      amount: widget.bottomViewModel.profileViewModel!.paymentResponce!.amount ?? "",
                                      // "1",
                                      product:
                                          widget.bottomViewModel.profileViewModel!.paymentResponce!.productinfo ?? "",
                                      firstname:
                                          widget.bottomViewModel.profileViewModel!.paymentResponce!.firstname ?? "",
                                      email: widget.bottomViewModel.profileViewModel!.paymentResponce!.email ?? "",
                                      phone: widget.bottomViewModel.profileViewModel!.paymentResponce!.phone ?? "",
                                      surl: widget.bottomViewModel.profileViewModel!.paymentResponce!.surl ?? "",
                                      furl: widget.bottomViewModel.profileViewModel!.paymentResponce!.furl ?? "",
                                      // merchantID: '',
                                      salt: 'g4RzXdFq6SskDEOF8xdpmcutWzE8GxCU',
                                      // ud: '',
                                      // udf4: '',
                                      // udf6: '',
                                      // udf7: '',
                                      // udf8: '',
                                      // udf9: '',
                                      // udf10: '',
                                      // isDebug: true,
                                      transactionId:
                                          widget.bottomViewModel.profileViewModel!.paymentResponce!.txnid ?? "",
                                      hash: widget.bottomViewModel.profileViewModel!.paymentResponce!.hash ?? "",
                                    );
                                    // payUCheckoutProConfig: PayUParams.createPayUConfigParams(),
                                    // PayuPaymentResult _paymentResult = await FlutterPayuUnofficial.initiatePayment(
                                    //     paymentParams: _paymentParam, showCompletionScreen: false);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "PAY NOW",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        });
      },
    );
  }

  Future<void> _showSetDefaultAddressDialog(BuildContext context, String addressId) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('Default Address'),
            content: Text('Are you sure, you want to set this address as default address?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  HttpResponse res = await profileViewModel.setDefaultAddress(addressId);
                  if (res.status == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(res.message ?? ''),
                      backgroundColor: Colors.green,
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(res.message ?? ''),
                      backgroundColor: Colors.orange,
                    ));
                  }
                  Navigator.of(context).pop();
                },
                child: Text('Delete'),
              ),
            ],
          );
        });
      },
    );
  }

  Future<void> paymentStatus(BuildContext context, bool isSuccess, bool isCanceled) async {
    laodData();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text(isCanceled
                ? "Payment Cancelled"
                : isSuccess
                    ? 'Payment Successful'
                    : "Payment Failed"),
            // content: Text('Are you sure, you want to set this address as default address?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              ),
            ],
          );
        });
      },
    );
  }

// @override
// generateHash(Map response) {
//   // TODO: implement generateHash
//   Map hashResponse = {};
//
//   //Keep the salt and hash calculation logic in the backend for security reasons. Don't use local hash logic.
//   //Uncomment following line to test the test hash.
//   hashResponse = HashService.generateHash(response);
//
//   _checkoutPro.hashGenerated(hash: hashResponse);
// }
//
// @override
// onError(Map? response) {
//   // TODO: implement onError
//   paymentStatus(context, false, false);
// }
//
// @override
// onPaymentCancel(Map? response) {
//   // TODO: implement onPaymentCancel
//   paymentStatus(context, false, true);
// }
//
// @override
// onPaymentFailure(response) {
//   // TODO: implement onPaymentFailure
//   paymentStatus(context, false, false);
// }
//
// @override
// onPaymentSuccess(response) {
//   // TODO: implement onPaymentSuccess
//   paymentStatus(context, true, false);
// }
}
//
// class PayUParams {
//   //
//   // PayUParams(this.udf1,this.udf2,this.udf5,this.mkey,this.phone,this.fname,this.email,this.tr_id,this.productinfo,this.surl,this.furl,this.amount);
//   // String udf1,udf2,udf5,mkey,phone,fname,email,tr_id,productinfo,surl,furl,amount;
//
//   static Map createPayUPaymentParams(
//       String udf1, udf2, udf5, mkey, amount, productinfo, fname, email, phone, surl, furl) {
//     var siParams = {
//       PayUSIParamsKeys.isFreeTrial: true,
//       PayUSIParamsKeys.billingAmount: amount, //Required
//       PayUSIParamsKeys.billingInterval: 2, //Required
//       PayUSIParamsKeys.paymentStartDate:
//           '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}', //Required
//       PayUSIParamsKeys.paymentEndDate:
//           '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}', //Required
//       PayUSIParamsKeys.billingCycle: //Required
//           'once', //Can be any of 'daily','weekly','yearly','adhoc','once','monthly'
//       PayUSIParamsKeys.remarks: 'Test SI transaction',
//       PayUSIParamsKeys.billingCurrency: 'INR',
//       PayUSIParamsKeys.billingLimit: 'ON', //ON, BEFORE, AFTER
//       PayUSIParamsKeys.billingRule: 'MAX', //MAX, EXACT
//     };
//
//     var additionalParam = {
//       PayUAdditionalParamKeys.udf1: udf1,
//       PayUAdditionalParamKeys.udf2: udf2,
//       PayUAdditionalParamKeys.udf5: udf5,
//       PayUAdditionalParamKeys.merchantAccessKey: mkey,
//     };
//
//     //
//     // var spitPaymentDetails =
//     // {
//     //   "type": "absolute",
//     //   "splitInfo": {
//     //     PayUTestCredentials.merchantKey: {
//     //       "aggregatorSubTxnId": "1234567540099887766650092", //unique for each transaction
//     //       "aggregatorSubAmt": "1"
//     //     },
//     //     /* "qOoYIv": {
//     //       "aggregatorSubTxnId": "12345678",
//     //       "aggregatorSubAmt": "40"
//     //    },*/
//     //   }
//     // };
//
//     var payUPaymentParams = {
//       PayUPaymentParamKey.key: mkey,
//       PayUPaymentParamKey.amount: amount,
//       PayUPaymentParamKey.productInfo: productinfo,
//       PayUPaymentParamKey.firstName: fname,
//       PayUPaymentParamKey.email: email,
//       PayUPaymentParamKey.phone: phone,
//       PayUPaymentParamKey.ios_surl: surl,
//       PayUPaymentParamKey.ios_furl: furl,
//       PayUPaymentParamKey.android_surl: surl,
//       PayUPaymentParamKey.android_furl: furl,
//       PayUPaymentParamKey.environment: "1", //0 => Production 1 => Test
//       PayUPaymentParamKey.userCredential: null, //TODO: Pass user credential to fetch saved cards => A:B - Optional
//       PayUPaymentParamKey.transactionId: DateTime.now().millisecondsSinceEpoch.toString(),
//       PayUPaymentParamKey.additionalParam: additionalParam,
//       PayUPaymentParamKey.enableNativeOTP: true,
//       // PayUPaymentParamKey.splitPaymentDetails:json.encode(spitPaymentDetails),
//       // PayUPaymentParamKey.userToken: "", //TODO: Pass a unique token to fetch offers. - Optional
//     };
//
//     return payUPaymentParams;
//   }
//
//   static Map createPayUConfigParams() {
//     // var paymentModesOrder = [
//     //   {"Wallets": "PHONEPE"},
//     //   {"UPI": "TEZ"},
//     //   {"Wallets": ""},
//     //   {"EMI": ""},
//     //   {"NetBanking": ""},
//     // ];
//     //
//     // var cartDetails = [
//     //   {"GST": "5%"},
//     //   {"Delivery Date": "25 Dec"},
//     //   {"Status": "In Progress"}
//     // ];
//     // var enforcePaymentList = [
//     //   {"payment_type": "CARD", "enforce_ibiboCode": "UTIBENCC"},
//     // ];
//     //
//     // var customNotes = [
//     //   {
//     //     "custom_note": "Its Common custom note for testing purpose",
//     //     "custom_note_category": [PayUPaymentTypeKeys.emi, PayUPaymentTypeKeys.card]
//     //   },
//     //   {"custom_note": "Payment options custom note", "custom_note_category": null}
//     // ];
//
//     var payUCheckoutProConfig = {
//       PayUCheckoutProConfigKeys.primaryColor: "#4994EC",
//       PayUCheckoutProConfigKeys.secondaryColor: "#FFFFFF",
//       PayUCheckoutProConfigKeys.merchantName: "Giftex",
//       // PayUCheckoutProConfigKeys.merchantLogo: "logo",
//       PayUCheckoutProConfigKeys.showExitConfirmationOnCheckoutScreen: true,
//       PayUCheckoutProConfigKeys.showExitConfirmationOnPaymentScreen: true,
//       // PayUCheckoutProConfigKeys.cartDetails: cartDetails,
//       PayUCheckoutProConfigKeys.merchantResponseTimeout: 30000,
//
//       PayUCheckoutProConfigKeys.autoSelectOtp: true,
//       // PayUCheckoutProConfigKeys.enforcePaymentList: enforcePaymentList,
//       PayUCheckoutProConfigKeys.waitingTime: 30000,
//       PayUCheckoutProConfigKeys.autoApprove: true,
//       PayUCheckoutProConfigKeys.merchantSMSPermission: true,
//       PayUCheckoutProConfigKeys.showCbToolbar: true,
//     };
//     return payUCheckoutProConfig;
//   }
// }

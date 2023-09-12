// import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/screens/kyc/paydeposit.dart';
import 'package:giftex/viewmodel/profile/profileviewmodel.dart';
import 'package:giftex/data/network/models/responce/profile/GetRegInfoResponse.dart';
import '../../data/network/models/responce/profile/GetCityResponse.dart';

ProfileViewModel profileViewModel = ProfileViewModel();

class KYCAddresspage extends StatefulWidget {
  @override
  _KYCAddresspageState createState() => _KYCAddresspageState();
}

class _KYCAddresspageState extends State<KYCAddresspage> {
  TextEditingController dobController = TextEditingController();

  @override
  void initState() {
    loadData();
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
                          padding: EdgeInsets.only(top: 0, bottom: 0, right: 0, left: 0),
                          child: Image.asset(
                            "image/Shapebh.png",
                            height: 200.0,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0, bottom: 0, right: 0, left: 0),
                          child: Image.asset(
                            "image/Shapebgup.png",
                            height: 130.0,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 0, right: 0, left: 100),
                          child: Image.asset(
                            "image/Group 14185 (1).png",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 70, bottom: 0, right: 0, left: 130),
                          child: Image.asset(
                            "image/Group 14127 (2).png",
                            height: 120.0,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 0, right: 0, left: 16),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.grey,
                              size: 32,
                            ),
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
                          Text(
                            "ADDRESS DETAILS",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline5!.copyWith(
                                  color: Color(0xff2D2D2D),
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            // margin: EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * .70,
                            height: 50,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffDDE3E8), width: 1),
                                // image: DecorationImage(
                                //   image: AssetImage("image/Rectangle 2 (2).png"),
                                //   fit: BoxFit.cover,
                                // ),
                                color: Colors.white),
                            child: Center(
                              child: TextFormField(
                                maxLines: 1,
                                // controller: userInput,
                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                onChanged: (value) {
                                  setState(() {
                                    // userInput.text = value.toString();
                                  });
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  focusColor: Colors.white,
                                  border: InputBorder.none,
                                  fillColor: Colors.grey,
                                  hintText: "Search Area",
                                  //make hint text
                                  prefixIcon: Icon(Icons.search),
                                  hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Color(0xff979797),
                                        fontWeight: FontWeight.w500,
                                      ),

                                  //create lable
                                  // labelText: 'Email/Mobile',
                                  //lable style
                                  labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                            // margin: EdgeInsets.all(15),
                            height: 50,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 6,
                                    color: Color.fromRGBO(226, 223, 202, 0.39),
                                  ),
                                  BoxShadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 8,
                                    color: Color.fromRGBO(226, 223, 202, 0.39),
                                  )
                                ],
                                border: Border.all(color: Color(0xffDDE3E8), width: 1),
                                // image: DecorationImage(
                                //   image: AssetImage("image/Rectangle 2 (2).png"),
                                //   fit: BoxFit.cover,
                                // ),
                                color: Colors.white),
                            child: Image.asset("image/Vector (11).png", color: Theme.of(context).colorScheme.primary),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                     /* Image.asset("image/MAp (1).png"),
                      SizedBox(
                        height: 16,
                      ),*/
                      Row(
                        children: [
                          Text(
                            "Enter Complete Address",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(2, 2),
                                blurRadius: 6,
                                color: Color.fromRGBO(226, 223, 202, 0.39),
                              ),
                              BoxShadow(
                                offset: Offset(2, 2),
                                blurRadius: 8,
                                color: Color.fromRGBO(226, 223, 202, 0.39),
                              )
                            ],
                            border: Border.all(color: Color(0xffDDE3E8), width: 1),
                            // image: DecorationImage(
                            //   image: AssetImage("image/Rectangle 2 (2).png"),
                            //   fit: BoxFit.cover,
                            // ),
                            color: Colors.white),
                        child: TextFormField(
                          maxLines: 3,
                          // controller: userInput,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                          onChanged: (value) {
                            setState(() {
                              profileViewModel.setaddress(value);
                              // userInput.text = value.toString();
                            });
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            border: InputBorder.none,
                            fillColor: Colors.grey,

                            hintText: "Flat No, Floor, Building Name,Street Name, Landmarks,Contact No, etc.",

                            //make hint text
                            hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Color(0xff788995).withOpacity(0.4),
                                  fontWeight: FontWeight.w500,
                                ),

                            //create lable
                            // labelText: 'Email/Mobile',
                            //lable style
                            labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
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
                ),
                SizedBox(height: 16,),

                InkWell(
                  onTap: ()async {
                    profileViewModel.validateAll();
                    if ((selectedState == null)) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please Select State'),
                        backgroundColor: Colors.orangeAccent,
                      ));
                    } else if ((selectedCity == null)) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please Select City'),
                        backgroundColor: Colors.orangeAccent,
                      ));
                    } else if (profileViewModel.profileViewModelErrorState.hasErrors) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please Enter all Mandatory Fields'),
                        backgroundColor: Colors.orangeAccent,
                      ));
                    } else {
                      await profileViewModel.getCity("15");
                      selectedState = profileViewModel.getRegInfoResponse!.indianStateList == null
                          ? null
                          : profileViewModel.getRegInfoResponse!.indianStateList![14];
                      String type = "Postal";


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
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * .75,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xff015000),
                          Color(0xff023020),
                          Color(0xff015000),
                        ]),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "SAVE",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16,),

                InkWell(
                  onTap: () async {
                    HttpResponse res = await profileViewModel.UpdateRegMyAddress();
                    if (res.status == 200) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Record Updated....'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${res.message!}"),
                          backgroundColor: Colors.orange,
                        ),
                      );
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (context) => KYCPayDepositpage()));
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
                        "CONTINUE",
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
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  CountryList? selectedCountry;
  IndianStateList? selectedState;
  CityList? selectedCity;
  TextEditingController _YourNameController = TextEditingController();
  TextEditingController _AddressLine1Controller = TextEditingController();
  TextEditingController _AddressLine2Controller = TextEditingController();
  TextEditingController _PinCodeController = TextEditingController();
  TextEditingController _GSTNumberController = TextEditingController();

  Future<void> _showAddUserDialog(BuildContext context) async {
    TextEditingController _YourNameController = TextEditingController();
    TextEditingController _AddressLine1Controller = TextEditingController();
    TextEditingController _AddressLine2Controller = TextEditingController();
    TextEditingController _PinCodeController = TextEditingController();
    TextEditingController _GSTNumberController = TextEditingController();

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
                      backgroundColor: Colors.green,
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

  Future loadData() async{
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
  }
}

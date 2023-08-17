import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/data/network/models/httpreponsehandler.dart';
import 'package:giftex/data/network/models/responce/profile/GetRegInfoResponse.dart';
import 'package:giftex/screens/liveauction/liveauction.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:giftex/viewmodel/bottomviewmodel.dart';
import 'package:intl/intl.dart';

// DashboardUi ui = DashboardUi();
class UpcomingAuctionItem extends StatefulWidget {
  UpcomingAuctionItem(this.index, this.auctionViewModel, this.bottomViewModel);

  int index;
  BottomViewModel bottomViewModel;
  AuctionViewModel auctionViewModel;

  @override
  State<UpcomingAuctionItem> createState() => _UpcomingAuctionItemState();
}

class _UpcomingAuctionItemState extends State<UpcomingAuctionItem> with AutomaticKeepAliveClientMixin {
  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 0);

  bool isFirst = false;
  bool isFirstLike = false;
  bool isRFirstLike = false;

  @override
  void initState() {
    super.initState();
  }

  String formateNumber(String number) {
    var f = NumberFormat('##,##,##,##,###.##', 'HI');

    return f.format(double.parse(number));
  }

  @override
  Widget build(BuildContext context) {
    return widget.index % 2 != 0
        ? Container(
            decoration: BoxDecoration(color: Color(0xffF8F8F8)),
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 4),
            // margin: EdgeInsets.symmetric(vertical: 32),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![widget.index].image}",
                  height: 120,
                  fit: BoxFit.contain,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                          "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![widget.index].auctionName!}",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                        "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![widget.index].displayDate!.split(",")[0].trim()}",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.normal, color: Colors.black, letterSpacing: 2)),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![widget.index].displayDate!.split(",")[1].trim()}",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                            )),
                    SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        if ((auctionViewModel.upcomingAuctionResponse!.result!.auctions![widget.index].auctionDate!) !=
                            "TBA") {
                          setState(() {
                            auctionViewModel.upComingLotsResponse = null;
                            auctionViewModel.selectedAuction =
                                auctionViewModel.upcomingAuctionResponse!.result!.auctions![3];

                            widget.bottomViewModel.setIndex(8);
                          });
                        } else {
                          showinterestPopup(auctionViewModel
                              .upcomingAuctionResponse!.result!.auctions![widget.index].auctionId
                              .toString());
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color(0xffEAEEF2), borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          (auctionViewModel.upcomingAuctionResponse!.result!.auctions![widget.index].auctionDate!) ==
                                  "TBA"
                              ? "SHOW INTEREST"
                              : "EXPLORE",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage(
                        "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![widget.index].image}"),
                    fit: BoxFit.fill,
                    opacity: .2)),
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 4),
            // margin: EdgeInsets.symmetric(vertical: 32),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Image.network("${auctionViewModel.upcomingAuctionResponse!.result!.auctions![2].image}",height: 120,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Text(
                        "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![widget.index].auctionName!}",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                        "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![widget.index].displayDate!.split(",")[0].trim()}",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.normal, color: Colors.white, letterSpacing: 2)),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        "${auctionViewModel.upcomingAuctionResponse!.result!.auctions![widget.index].displayDate!.split(",")[1].trim()}",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.white,
                            )),
                    SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        if ((auctionViewModel.upcomingAuctionResponse!.result!.auctions![widget.index].auctionDate!) !=
                            "TBA") {
                          auctionViewModel.upComingLotsResponse = null;
                          setState(() {
                            auctionViewModel.selectedAuction =
                                auctionViewModel.upcomingAuctionResponse!.result!.auctions![widget.index];

                            widget.bottomViewModel.setIndex(8);
                          });
                        } else {
                          showinterestPopup(auctionViewModel
                              .upcomingAuctionResponse!.result!.auctions![widget.index].auctionId
                              .toString());
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color(0xffEAEEF2), borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          (auctionViewModel.upcomingAuctionResponse!.result!.auctions![widget.index].auctionDate!) ==
                                  "TBA"
                              ? "SHOW INTEREST"
                              : "EXPLORE",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  void showinterestPopup(String auctionId) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController countrycode = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController message = TextEditingController();

    String? err_name, err_email, err_counrtyCode, err_phone, err_message;

    showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: Container(
              padding: EdgeInsets.all(16),
              height: 580,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffEAEEF2),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: Color(0xff979797),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "image/Vector (22).png",
                          color: Color(0XFF202232),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'SHOW INTEREST',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Color(0XFF202232), fontWeight: FontWeight.w400, letterSpacing: 2),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          labelText: "Name*",
                          border: getInputBorder(),
                          enabledBorder: getInputBorder(),
                          errorText: err_name),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email ID",
                          border: getInputBorder(),
                          enabledBorder: getInputBorder(),
                          errorText: err_email),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (context) {
                      return profileViewModel.isloading
                          ? LinearProgressIndicator(
                              minHeight: 2,
                            )
                          : InputDecorator(
                              decoration: InputDecoration(
                                border: getInputBorder(),
                                enabledBorder: getInputBorder(),
                                contentPadding: EdgeInsets.all(0),
                              ),
                              child: DropdownMenu<CountryList>(
                                  textStyle: TextStyle(color: Colors.black),
                                  controller: countrycode,
                                  onSelected: (item) {
                                    countrycode.text = item!.code ?? '';
                                  },
                                  menuStyle: MenuStyle(
                                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                                  ),
                                  inputDecorationTheme: InputDecorationTheme(
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
                                    //  fillColor: Colors.blue.shade100
                                  ),
                                  dropdownMenuEntries: profileViewModel.getRegInfoResponse!.countryList!
                                      .map((e) => DropdownMenuEntry(
                                          value: e,
                                          label: "${e.name ?? ''} (${e.code ?? ''})",
                                          style: ButtonStyle(
                                            foregroundColor: MaterialStatePropertyAll(Colors.black),
                                            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
                                            backgroundColor: MaterialStatePropertyAll(Colors.white),
                                          )))
                                      .toList(),
                                  width: MediaQuery.of(dialogContext).size.width * .70,
                                  hintText: "Country Code",
                                  errorText: err_counrtyCode),
                            );
                    }),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: phone,
                      inputFormatters: [],
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: InputDecoration(
                          labelText: "Phone Number",
                          border: getInputBorder(),
                          counter: Container(),
                          enabledBorder: getInputBorder(),
                          errorText: err_phone),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: message,
                      decoration: InputDecoration(
                          labelText: "Message",
                          border: getInputBorder(),
                          enabledBorder: getInputBorder(),
                          errorText: err_message),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0XFFB45156)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Color(0XFFB45156), width: 0.5)))),
                        onPressed: () async {
                          if (name.text == '' || email.text == '' || countrycode.text == '') {
                            if (name.text == '') {
                              err_name = 'Please enter Name';
                            }
                            if (email.text == '') {
                              err_email = 'Please enter Email';
                            }

                            if (countrycode.text == '') {
                              err_counrtyCode = 'Please enter Country Code';
                            }
                          } else {
                            HttpResponse res = await auctionViewModel.showIntrestInAuction(
                                name.text, email.text, countrycode.text, phone.text, message.text, auctionId);
                            if (res.status == 200) {
                              ScaffoldMessenger.maybeOf(context)!.showSnackBar(SnackBar(
                                content: Text("Thank you for your interest.", style: TextStyle(color: Colors.black)),
                                backgroundColor: Colors.green,
                              ));
                              Navigator.maybeOf(context)!.pop();
                            } else {
                              ScaffoldMessenger.maybeOf(context)!.showSnackBar(SnackBar(
                                content: Text(res.message ?? '', style: TextStyle(color: Colors.black)),
                                backgroundColor: Colors.orange,
                              ));
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0.0, left: 0, top: 12, bottom: 12),
                          child: Text(
                            'Submit',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 1.33333),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  getInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

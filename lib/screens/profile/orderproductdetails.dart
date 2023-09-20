import 'package:flutter/material.dart';
import 'package:giftex/data/network/models/responce/purchase/mypurchasereponse.dart';
import 'package:giftex/screens/components/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:giftex/viewmodel/profile/profileviewmodel.dart';

import '../components/footer/footer.dart';
import '../components/header.dart';

class MyOrderProductpage extends StatefulWidget {
  MyOrderProductpage(this.profileViewModel, this.lot);

  ProfileViewModel profileViewModel;
  Data lot;

  @override
  _MyOrderProductpageState createState() => _MyOrderProductpageState();
}

class _MyOrderProductpageState extends State<MyOrderProductpage> {
  String getOrderStatus(int status) {
    if (status == 0 && status <= 2) {
      return "Order Placed";
    } else if (status == 3 || status == 2) {
      return "Processing";
    } else if (status == 5 || status == 6) {
      return "Preparing For Shipping";
    } else if (status == 7) {
      return "Shipped";
    } else if (status == 8) {
      return "Delivered";
    } else {
      return "Order Placed";
    }
  }

  @override
  void initState() {
    // TODO: implement initState

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
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 16, left: 8, right: 8),
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
                          height: 95,
                          color: const Color(0xffF3E8E9),
                        ),
                        CircleAvatar(
                          radius: 37,
                          backgroundImage: NetworkImage(widget.profileViewModel.getUserAllDetailsResponse!.result!
                                  .profile!.basicDetails!.profilePicUrl ??
                              ''),
                          // child: Image.asset("image/image 40.png",fit: BoxFit.fill,),
                        ),
                      ],
                    ),
                    const SizedBox(
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
                                        text: widget.profileViewModel.getUserAllDetailsResponse!.result!.profile!
                                                .basicDetails!.firstName ??
                                            '',
                                        style: Theme.of(context).textTheme.headline6!.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "image/Vector (11).png",
                                      height: 16,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    widget.profileViewModel.getUserAllDetailsResponse!.result!.profile!.address!.isEmpty
                                        ? Container()
                                        : Text(
                                            widget.profileViewModel.getUserAllDetailsResponse!.result!.profile!.address!
                                                    .first.city ??
                                                '',
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
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20.0),
                                                  side: BorderSide(color: Color(0xff747474), width: 0.38)))),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context, MaterialPageRoute(builder: (context) => DashboardUi(12)));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 0.0, left: 8, top: 12, bottom: 12),
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Order Id  #${widget.lot.orderNumber}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 200,
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
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Text(
                    //   "Order Date : ${widget.lot.deliveryDate}",
                    //   textAlign: TextAlign.center,
                    //   style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    //         color: Color(0xff2D2D2D),
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Order Status : ${getOrderStatus(widget.lot.completedStage ?? 0)}",
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
                      "Order Total : ₹${widget.lot.buyerInvoiceAmount}",
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
                    // Text(
                    //   "Item Tracking Status",
                    //   textAlign: TextAlign.center,
                    //   style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    //         color: Color(0xff2D2D2D),
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Text(
                    //   "Order Placed : ${widget.lot.deliveryDate}",
                    //   textAlign: TextAlign.center,
                    //   style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    //         color: Color(0xff2D2D2D),
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    // ),
                    // SizedBox(
                    //   height: 16,
                    // ),
                    // Text(
                    //   "Order Shipped : ${widget.lot.deliveryDate}",
                    //   textAlign: TextAlign.center,
                    //   style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    //         color: Color(0xff2D2D2D),
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    // ),
                    // SizedBox(
                    //   height: 16,
                    // ),
                    // Text(
                    //   "Order Delivered : ${widget.lot.deliveryDate}",
                    //   textAlign: TextAlign.center,
                    //   style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    //         color: Color(0xff2D2D2D),
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Product Details",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
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
                      Image.network(
                        widget.lot.lot!.thumbImage ?? "",
                        height: 140,
                        width: 110,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Product Id #${widget.lot.orderNumber}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          color: Color(0xff2D2D2D),
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Artist name",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          color: Color(0xff202232),
                                          // color: Color(0xff747474),
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  // SizedBox(
                                  //   height: 5,
                                  // ),
                                  Text(
                                    "${widget.lot.artistName}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                          color: Colors.black,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  // SizedBox(
                                  //   height: 5,
                                  // ),
                                  Text(
                                    "${widget.lot.lot!.lotTitle}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          color: Color(0xff747474),
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Category: ${widget.lot.lot!.category}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          color: Color(0xff202232),
                                          // color: Color(0xff747580),
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  Text(
                                    "${widget.lot.lot!.info!.size}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          color: Color(0xff747474),
                                          // color: Color(0xff202232),
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Payment Details",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Shipping Details",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "${widget.lot.clientName}\nAddress : ${widget.lot.address!.addressLine1 ?? ""} ${widget.lot.address!.addressLine2 ?? ""} ${widget.lot.address!.city ?? ""} ${widget.lot.address!.state ?? ""} ${widget.lot.address!.pincode ?? ""}",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
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
                          "+91 ${widget.lot.mobilenumber ?? ""}",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Color(0xff202232),
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
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
                          "${widget.lot.clientEmailid ?? ""}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Color(0xff202232),
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
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
                          "${"Net Banking"}",
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
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Order Summary",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Color(0xff2D2D2D),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // height: 200,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(color: Color(0xffF7FAFD)),
                child: Column(
                    children: widget.lot.subItemList!
                        .map((e) => Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Text(
                                    "${e.key}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                          color: Color(0xff2D2D2D),
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "₹ ${e.value}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                          color: Color(0xff2D2D2D),
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ],
                              ),
                            ))
                        .toList()),
              ),

              // [
              //     Row(
              //       children: [
              //         Text(
              //           "Product MRP",
              //           textAlign: TextAlign.center,
              //           style: Theme.of(context).textTheme.subtitle1!.copyWith(
              //                 color: Color(0xff2D2D2D),
              //                 fontWeight: FontWeight.w400,
              //               ),
              //         ),
              //         Spacer(),
              //         Text(
              //           "₹ ${widget.lot.subItemList![0].value}",
              //           textAlign: TextAlign.center,
              //           style: Theme.of(context).textTheme.subtitle1!.copyWith(
              //                 color: Color(0xff2D2D2D),
              //                 fontWeight: FontWeight.w400,
              //               ),
              //         ),
              //       ],
              //     ),
              //     SizedBox(
              //       height: 16,
              //     ),
              //     Row(
              //       children: [
              //         Text(
              //           "Shipping",
              //           textAlign: TextAlign.center,
              //           style: Theme.of(context).textTheme.subtitle1!.copyWith(
              //                 color: Color(0xff2D2D2D),
              //                 fontWeight: FontWeight.w400,
              //               ),
              //         ),
              //         Spacer(),
              //         Text(
              //           "₹ 1,000",
              //           textAlign: TextAlign.center,
              //           style: Theme.of(context).textTheme.subtitle1!.copyWith(
              //                 color: Color(0xff2D2D2D),
              //                 fontWeight: FontWeight.w400,
              //               ),
              //         ),
              //       ],
              //     ),
              //     SizedBox(
              //       height: 16,
              //     ),
              //     Row(
              //       children: [
              //         Text(
              //           "GST (18 %)",
              //           textAlign: TextAlign.center,
              //           style: Theme.of(context).textTheme.subtitle1!.copyWith(
              //                 color: Color(0xff2D2D2D),
              //                 fontWeight: FontWeight.w400,
              //               ),
              //         ),
              //         Spacer(),
              //         Text(
              //           "₹ 4,000",
              //           textAlign: TextAlign.center,
              //           style: Theme.of(context).textTheme.subtitle1!.copyWith(
              //                 color: Color(0xff2D2D2D),
              //                 fontWeight: FontWeight.w400,
              //               ),
              //         ),
              //       ],
              //     ),
              //     SizedBox(
              //       height: 16,
              //     ),
              Image.asset("image/Line 45.png", width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
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
                      "₹ ${widget.lot.buyerInvoiceTotalAmount}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Color(0xff2D2D2D),
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              //   ],
              // ),
              // ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ElevatedButton(
                  //   style: ButtonStyle(
                  //       backgroundColor: MaterialStateProperty.all(Color(0XFFF9F9F9)),
                  //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(16.0),
                  //           side: BorderSide(color: Color(0xff747474), width: 0.38)))),
                  //   onPressed: () {},
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(right: 0.0, left: 0, top: 12, bottom: 12),
                  //     child: Text(
                  //       'DOWNLOAD INVOICE',
                  //       style: Theme.of(context).textTheme.caption!.copyWith(
                  //             color: Color(0XFF466D33),
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: 10,
                  ),
                  // ElevatedButton(
                  //   style: ButtonStyle(
                  //       backgroundColor: MaterialStateProperty.all(Color(0XFF8DAB7F)),
                  //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20.0),
                  //         // side: BorderSide(color: Colors.red)
                  //       ))),
                  //   onPressed: () {},
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(right: 0.0, left: 0, top: 12, bottom: 12),
                  //     child: Text(
                  //       'WRITE A REVIEW',
                  //       style: Theme.of(context).textTheme.caption!.copyWith(
                  //             color: Color(0XFFFFFFFF),
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
              )
            ],
          )),
        ),
      ),
    );
  }
}

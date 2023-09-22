import 'package:flutter/material.dart';
import 'package:giftex/viewmodel/auction/auctionviewmodel.dart';
import 'package:intl/intl.dart';

class PastAuctionResultData extends StatefulWidget {
  PastAuctionResultData(this.auctionViewModel);
  AuctionViewModel auctionViewModel;

  @override
  State<PastAuctionResultData> createState() => _PastAuctionResultDataState();
}

class _PastAuctionResultDataState extends State<PastAuctionResultData> {
  @override
  void initState() {
    // TODO: implement initState
    widget.auctionViewModel.getAuctionResult();
    super.initState();
  }

  String formateNumber(String number) {
    var f = NumberFormat('##,##,##,##,###.##', 'HI');

    return f.format(double.parse(number));
  }

  @override
  Widget build(BuildContext context) {
    return widget.auctionViewModel.isLoadingForUpCommingAuction
        ? SliverToBoxAdapter(child: LinearProgressIndicator())
        : widget.auctionViewModel.autionResultResponse == null
            ? SliverToBoxAdapter(child: Container())
            : SliverToBoxAdapter(
                child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("TOTAL",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 8,
                        ),
                        Text("WINNING VALUE",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.red, fontWeight: FontWeight.bold, letterSpacing: 3)),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("(Inclusive of margin)",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 3)),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 400,
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        // borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              width: MediaQuery.of(context).size.width * .8,
                              decoration: BoxDecoration(
                                  // color: Colors.grey,
                                  image: DecorationImage(image: AssetImage("image/doller.png"))),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text("US Dollars",
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                            color: Colors.black,
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 3)),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                        "\$${formateNumber("${widget.auctionViewModel.autionResultResponse!.totalWinningUS}")}",
                                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            letterSpacing: 3)),
                                  ],
                                ),
                              ),
                            )),
                            Expanded(
                                child: Container(
                              width: MediaQuery.of(context).size.width * .8,
                              decoration: BoxDecoration(
                                  // color: Colors.blue,
                                  image: DecorationImage(image: AssetImage("image/rupees.png"))),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text("Indian Rupees",
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            letterSpacing: 3)),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                        "₹${formateNumber("${widget.auctionViewModel.autionResultResponse!.totalWinning}")}",
                                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            letterSpacing: 3)),
                                  ],
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Text("TOP 10 LOTS SOLD",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 3)),
                      ),
                    ),
                    Column(
                      children: widget.auctionViewModel.autionResultResponse!.lots!
                          .sublist(
                              0,
                              widget.auctionViewModel.autionResultResponse!.lots!.length > 10
                                  ? 10
                                  : widget.auctionViewModel.autionResultResponse!.lots!.length)
                          .map((e) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                          child: Container(
                            height: 180,
                            // margin: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                color:
                                    // Colors.black
                                    Color(0xffF9F9F9),
                                border: Border.all(color: Colors.grey.shade100)),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(e.artistName ?? ""),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * .65,
                                            child: Text(e.title ?? "",
                                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                                    color: Colors.black,
                                                    // fontWeight:
                                                    //     FontWeight.bold,
                                                    letterSpacing: 3)),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Center(child: Text("Lot ${e.lotNo}")),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: Color(0xffEAEEF2),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Winning value (US \$)",
                                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                                    color: Colors.grey,
                                                    // fontWeight: FontWeight.bold,
                                                  )),
                                          Text("\$${formateNumber("${e.winningValueUs}")}",
                                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Winning value (INR \u20b9)",
                                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                                    color: Colors.grey,
                                                    // fontWeight: FontWeight.bold,
                                                  )),
                                          Text("₹${formateNumber("${e.winningValue}")}",
                                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ));
  }
}

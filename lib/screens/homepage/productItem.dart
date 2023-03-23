import 'package:flutter/material.dart';
import 'package:giftex/screens/productdetailspage/productdetailpage.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          color: Color(0xffFFFFFF),
          height:550,
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0,right: 25),
                  child: Image.network("image/Bitmap6.png",height: 250,
                    width: MediaQuery.of(context).size.width*.65,
                    fit: BoxFit.contain,

                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 250,bottom: 0,left: 25.0,right: 25),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                      Text("JAMINI ROY",
                        textAlign: TextAlign.center,
                        style:
                        Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.black,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
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
                              Text("Estimate Value ",
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
                                  fontWeight: FontWeight.bold,
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
                              Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xff8C9FB1),
                                      ),
                                      padding: EdgeInsets.all(4),
                                      child:Text("02",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
                                  ),
                                  Container(
                                    // color: Colors.black,
                                      padding: EdgeInsets.all(4),
                                      child:Text(":")
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xff8C9FB1),
                                      ),

                                      padding: EdgeInsets.all(4),
                                      child:Text("14",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
                                  ),

                                  Container(
                                    // color: Colors.black,
                                      padding: EdgeInsets.all(4),
                                      child:Text(":")
                                  ),

                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xff8C9FB1),
                                      ),
                                      padding: EdgeInsets.all(4),
                                      child:Text("59",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white),)
                                  ),
                                ],
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Next Valid Bid",
                                textAlign: TextAlign.center,
                                style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Color(0xff747474),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text("₹75,000",
                                textAlign: TextAlign.center,
                                style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
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
                              child: Text('PROXY BID', style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Color(0XFF2D2D2D),
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                          SizedBox(width: 10,),
                          InkWell(
                            onTap: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => GetOtppage()));
                            },
                            child: Container(
                              height: 50,
                              // width: 150,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Color(0xffE74B52),Color(0xffE74B52),]
                                  ),
                                  // color: Color(0xff466D33),
                                  borderRadius: BorderRadius.circular(24)
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 32.0,left: 32,top: 12,bottom: 12),
                                  child: Text('BID NOW', style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0XFFFFFFFF),
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                              ),
                            ),),
                        ],
                      ),
                      SizedBox(height: 8,),
                    ],
                  )
              ),

              Positioned(
                right: 16,
                top: 50,
                child: Column(
                  children: [
                    Container(


                      child: Text("Lot 01"),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.lightBlueAccent.withOpacity(.2),

                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),

                    ),

                    SizedBox(height:12),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xffEAF1DB)

                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                      child: Text("5 BIDS"),

                    ),
                    SizedBox(height:12),
                    Icon(Icons.favorite_border,color: Colors.grey,),
                    SizedBox(height:12),
                    Icon(Icons.open_in_full,color: Colors.grey,),
                    SizedBox(height:12),
                    // Container(
                    //   padding: EdgeInsets.all(16),
                    //   decoration: BoxDecoration(
                    //     color:  Colors.lightBlueAccent.withOpacity(.2),
                    //     borderRadius: BorderRadius.circular(32)
                    //
                    //   ),
                    // )
                    Image.asset("image/earth.png",height: 50,)
                  ],
                ),
              )

            ],
          )
      ),
    );
  }
}

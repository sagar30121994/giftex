

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftex/screens/aboutus/aboutus.dart';
import 'package:giftex/screens/contactus/contactus.dart';
import 'package:giftex/screens/faq/faq.dart';
import 'package:giftex/screens/howtobuy/howtobuy.dart';
import 'package:giftex/screens/howtosell/howtosell.dart';
import 'package:giftex/screens/servicepage/servicepage.dart';
import 'package:giftex/screens/termsandconditions/termsandconditions.dart';


class Footer extends StatefulWidget {
  Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.white,
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 170,bottom: 0),
                child: Container(
                  //replace this Container with your Card
                  width: MediaQuery.of(context).size.width,
                  height: 1700,
                  // color: Color(0Xff1F2A52),
                  color: Color(0Xff1F2A52),
                  // height: 830.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 340,

                    color: Theme.of(context).colorScheme.surface,
                    width: MediaQuery.of(context).size.width*.90,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16,),
                        Text("SUBSCRIBE TO",
                          textAlign: TextAlign.center,
                          style:
                          Theme.of(context).textTheme.headline6!.copyWith(
                              color: Color(0xffB45156),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.3
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("OUR NEWSLETTER",
                          textAlign: TextAlign.center,
                          style:
                          Theme.of(context).textTheme.headline6!.copyWith(
                              color: Color(0xff373737),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.3
                          ),
                        ),
                        SizedBox(height: 16,),
                        Text("Lorem ipsum dolor sit amet, consecte tur adipiscing elit, Lorem ipsum ",
                          textAlign: TextAlign.center,
                          style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            // controller: usernameController,
                            decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Name',
                                // filled: true,
                                enabledBorder:  UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey.shade400)
                                )
                            ),
                          ),
                        ),
                        // SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            // controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Email',
                                // filled: true,
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                ),
                                enabledBorder:  UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey.shade400)
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 300,),
              Padding(
                padding: EdgeInsets.only(top: 315,bottom: 50),
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: Container(

                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.0),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xffB45156),
                              Color(0xffE74B52),
                            ],
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0,left: 8,top: 12,bottom: 12),
                        child: Text('SUBMIT', style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0XFFFFFFFF),
                          fontWeight: FontWeight.w600,
                        ),),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 390,bottom: 0,right: 16,left: 16),
                child:  Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("image/app1.png",color: Colors.white,),
                        SizedBox(width: 12,),
                        Text("ASTAGURU",
                          textAlign: TextAlign.center,
                          style:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.33333
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text("Lorem ipsum dolor sit amet, consecte tur adipiscing elit, Lorem ipsum dolor sit. Lorem ipsum dolor sit amet, consecte tur.",
                        textAlign: TextAlign.center,
                        style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white.withOpacity(.70),
                          fontWeight: FontWeight.w200,
                          wordSpacing: 1,

                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                   Container(

                     child: SingleChildScrollView(
                       child: Column(
                         children: [
                           Container(
                             child: ExpansionTileCard(
                               finalPadding: EdgeInsets.all(0),
                               baseColor: Color(0xff1F2A52),
                               expandedColor: Color(0xff1F2A52),
                               elevation: 0,
                               shadowColor:Color(0xff1F2A52),
                               initialElevation: 0,
                               contentPadding: EdgeInsets.all(4),

                               key: cardA,

                               trailing: Icon(Icons.add,size: 18,color: Colors.white,),
                               // leading: Container(
                               //   height: 60,
                               //   width: 60,
                               //
                               //   child: Stack(
                               //     children: [
                               //       Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                               //       Center(child: Image.asset("image/Group (9).png",height:35,fit: BoxFit.cover,))
                               //     ],),
                               // ),
                               title: Text("KNOW MORE",textAlign: TextAlign.start,
                                 style:
                                 Theme
                                     .of(context)
                                     .textTheme
                                     .subtitle1!
                                     .copyWith(
                                   color: Color(0XFFFFFFFF),
                                   fontWeight: FontWeight.bold,
                                 ),),
                               children: <Widget>[
                                 InkWell(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                   },
                                   child: Padding(
                                     padding: const EdgeInsets.only(left: 20.0,top: 10),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text("Buy",textAlign: TextAlign.start,
                                           style:
                                           Theme
                                               .of(context)
                                               .textTheme
                                               .subtitle1!
                                               .copyWith(
                                             color: Color(0XFFFFFFFF),
                                             fontWeight: FontWeight.w500,
                                           ),),
                                       ],
                                     ),
                                   ),
                                 ),
                                 InkWell(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => HowToSellPage()));
                                   },
                                   child: Padding(
                                     padding: const EdgeInsets.only(left: 20.0,top: 16),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text("Sell",textAlign: TextAlign.start,
                                           style:
                                           Theme
                                               .of(context)
                                               .textTheme
                                               .subtitle1!
                                               .copyWith(
                                             color: Color(0XFFFFFFFF),
                                             fontWeight: FontWeight.w400,
                                           ),),
                                       ],
                                     ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20.0,top: 16),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Request an Estimate",textAlign: TextAlign.start,
                                         style:
                                         Theme
                                             .of(context)
                                             .textTheme
                                             .subtitle1!
                                             .copyWith(
                                           color: Color(0XFFFFFFFF),
                                           fontWeight: FontWeight.w400,
                                         ),),
                                     ],
                                   ),
                                 ),
                                 InkWell(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => FaqPage()));
                                   },
                                   child: Padding(
                                     padding: const EdgeInsets.only(left: 20.0,top: 16),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text("Faq's",textAlign: TextAlign.start,
                                           style:
                                           Theme
                                               .of(context)
                                               .textTheme
                                               .subtitle1!
                                               .copyWith(
                                             color: Color(0XFFFFFFFF),
                                             fontWeight: FontWeight.w400,
                                           ),),
                                       ],
                                     ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20.0,top: 16),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Blogs",textAlign: TextAlign.start,
                                         style:
                                         Theme
                                             .of(context)
                                             .textTheme
                                             .subtitle1!
                                             .copyWith(
                                           color: Color(0XFFFFFFFF),
                                           fontWeight: FontWeight.w400,
                                         ),),
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20.0,top: 16),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Shipping",textAlign: TextAlign.start,
                                         style:
                                         Theme
                                             .of(context)
                                             .textTheme
                                             .subtitle1!
                                             .copyWith(
                                           color: Color(0XFFFFFFFF),
                                           fontWeight: FontWeight.w400,
                                         ),),
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20.0,top: 16),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Storage",textAlign: TextAlign.start,
                                         style:
                                         Theme
                                             .of(context)
                                             .textTheme
                                             .subtitle1!
                                             .copyWith(
                                           color: Color(0XFFFFFFFF),
                                           fontWeight: FontWeight.w400,
                                         ),),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),

                           Divider(color: Colors.grey,),
                           Container(

                             child: ExpansionTileCard(
                               baseColor: Color(0xff1F2A52),
                               expandedColor: Color(0xff1F2A52),
                               key: cardB,
                               trailing: Icon(Icons.add,size: 18,color: Colors.white,),
                               elevation: 0,
                               shadowColor:Color(0xff1F2A52),
                               initialElevation: 0,
                               contentPadding: EdgeInsets.all(4),
                               // leading: Container(
                               //   height: 60,
                               //   width: 60,
                               //
                               //   child: Stack(
                               //     children: [
                               //       Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                               //       Center(child: Image.asset("image/Group (9).png",height:35,fit: BoxFit.cover,))
                               //     ],),
                               // ),
                               title: Text("SERVICES",textAlign: TextAlign.start,
                                 style:
                                 Theme
                                     .of(context)
                                     .textTheme
                                     .subtitle1!
                                     .copyWith(
                                   color: Color(0XFFFFFFFF),
                                   fontWeight: FontWeight.bold,
                                 ),),
                               children: <Widget>[
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20.0,top: 10),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Client Advisory",textAlign: TextAlign.start,
                                         style:
                                         Theme
                                             .of(context)
                                             .textTheme
                                             .subtitle1!
                                             .copyWith(
                                           color: Color(0XFFFFFFFF),
                                           fontWeight: FontWeight.w500,
                                         ),),
                                     ],
                                   ),
                                 ),
                                 InkWell(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => Servicepage()));
                                   },
                                   child: Padding(
                                     padding: const EdgeInsets.only(left: 20.0,top: 16),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text("Restoration",textAlign: TextAlign.start,
                                           style:
                                           Theme
                                               .of(context)
                                               .textTheme
                                               .subtitle1!
                                               .copyWith(
                                             color: Color(0XFFFFFFFF),
                                             fontWeight: FontWeight.w400,
                                           ),),
                                       ],
                                     ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20.0,top: 16),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Collection Services",textAlign: TextAlign.start,
                                         style:
                                         Theme
                                             .of(context)
                                             .textTheme
                                             .subtitle1!
                                             .copyWith(
                                           color: Color(0XFFFFFFFF),
                                           fontWeight: FontWeight.w400,
                                         ),),
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20.0,top: 16),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Museum Services",textAlign: TextAlign.start,
                                         style:
                                         Theme
                                             .of(context)
                                             .textTheme
                                             .subtitle1!
                                             .copyWith(
                                           color: Color(0XFFFFFFFF),
                                           fontWeight: FontWeight.w400,
                                         ),),
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20.0,top: 16),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Post Sale Services",textAlign: TextAlign.start,
                                         style:
                                         Theme
                                             .of(context)
                                             .textTheme
                                             .subtitle1!
                                             .copyWith(
                                           color: Color(0XFFFFFFFF),
                                           fontWeight: FontWeight.w400,
                                         ),),
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20.0,top: 16),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Private Sales",textAlign: TextAlign.start,
                                         style:
                                         Theme
                                             .of(context)
                                             .textTheme
                                             .subtitle1!
                                             .copyWith(
                                           color: Color(0XFFFFFFFF),
                                           fontWeight: FontWeight.w400,
                                         ),),
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20.0,top: 16),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Storage",textAlign: TextAlign.start,
                                         style:
                                         Theme
                                             .of(context)
                                             .textTheme
                                             .subtitle1!
                                             .copyWith(
                                           color: Color(0XFFFFFFFF),
                                           fontWeight: FontWeight.w400,
                                         ),),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           Divider(color: Colors.grey,),
                           Container(

                             child: ExpansionTileCard(
                               baseColor: Color(0xff1F2A52),
                               expandedColor: Color(0xff1F2A52),
                               key: cardC,
                               elevation: 0,
                               shadowColor:Color(0xff1F2A52),
                               initialElevation: 0,
                               contentPadding: EdgeInsets.all(4),
                               trailing: Icon(Icons.add,size: 18,color: Colors.white,),
                               // leading: Container(
                               //   height: 60,
                               //   width: 60,
                               //
                               //   child: Stack(
                               //     children: [
                               //       Image.asset("image/Shape (19).png",height:60,fit: BoxFit.cover,),
                               //       Center(child: Image.asset("image/Group (9).png",height:35,fit: BoxFit.cover,))
                               //     ],),
                               // ),
                               title: Text("ABOUT",textAlign: TextAlign.start,
                                 style:
                                 Theme
                                     .of(context)
                                     .textTheme
                                     .subtitle1!
                                     .copyWith(
                                   color: Color(0XFFFFFFFF),
                                   fontWeight: FontWeight.bold,
                                 ),),
                               children: <Widget>[
                                 InkWell(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => Aboutuspage()));
                                   },
                                   child: Padding(
                                     padding: const EdgeInsets.only(left: 20.0,top: 10),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text("Who We Are",textAlign: TextAlign.start,
                                           style:
                                           Theme
                                               .of(context)
                                               .textTheme
                                               .subtitle1!
                                               .copyWith(
                                             color: Color(0XFFFFFFFF),
                                             fontWeight: FontWeight.w500,
                                           ),),
                                       ],
                                     ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20.0,top: 16),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Our Management",textAlign: TextAlign.start,
                                         style:
                                         Theme
                                             .of(context)
                                             .textTheme
                                             .subtitle1!
                                             .copyWith(
                                           color: Color(0XFFFFFFFF),
                                           fontWeight: FontWeight.w400,
                                         ),),
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20.0,top: 16),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Press",textAlign: TextAlign.start,
                                         style:
                                         Theme
                                             .of(context)
                                             .textTheme
                                             .subtitle1!
                                             .copyWith(
                                           color: Color(0XFFFFFFFF),
                                           fontWeight: FontWeight.w400,
                                         ),),
                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20.0,top: 16),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Careers",textAlign: TextAlign.start,
                                         style:
                                         Theme
                                             .of(context)
                                             .textTheme
                                             .subtitle1!
                                             .copyWith(
                                           color: Color(0XFFFFFFFF),
                                           fontWeight: FontWeight.w400,
                                         ),),
                                     ],
                                   ),
                                 ),
                                 InkWell(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => ContactusPage()));
                                   },
                                   child: Padding(
                                     padding: const EdgeInsets.only(left: 20.0,top: 16),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text("Contact Us",textAlign: TextAlign.start,
                                           style:
                                           Theme
                                               .of(context)
                                               .textTheme
                                               .subtitle1!
                                               .copyWith(
                                             color: Color(0XFFFFFFFF),
                                             fontWeight: FontWeight.w400,
                                           ),),
                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           Divider(color: Colors.grey,),
                         ],
                       ),
                     ),
                   ),

                    SizedBox(height: 10,),
                    Text("FOLLOW US",textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white.withOpacity(.70),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("image/Vector (17).png",color: Color(0xffFFFFFF),),
                          SizedBox(width: 10,),
                          Image.asset("image/Group 377.png",color: Color(0xffFFFFFF),),
                          SizedBox(width: 10,),
                          Image.asset("image/Vector (18).png",color: Color(0xffFFFFFF),),
                          SizedBox(width: 10,),
                          Image.asset("image/Group 376.png",color: Color(0xffFFFFFF),),
                        ],
                      ),
                    ),
                    SizedBox(height: 34,),
                    Text("DOWNLOAD OUR APP",textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("image/Group (12).png",color: Color(0xffFFFFFF),),
                        SizedBox(width: 10,),
                        Text("Apple Store",textAlign: TextAlign.center,
                          style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w200,
                              letterSpacing: 1.14286
                          ),
                        ),
                        SizedBox(width: 16,),
                        Container(
                          color: Colors.grey.shade600,
                          width: 1,
                          height: 35,
                        ),
                        SizedBox(width: 16,),
                        Image.asset("image/Vector (19).png",color: Color(0xffFFFFFF),),
                        SizedBox(width: 10,),
                        Text("Play Store",textAlign: TextAlign.center,
                          style:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w200,
                              letterSpacing: 1.14286
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24,),
                    Divider(color: Colors.grey,),
                    SizedBox(height: 16,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditions()));
                      },
                      child: Text("Terms & Condition | Privacy Policy | Copyright 2022",textAlign: TextAlign.center,
                        style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Image.asset("image/Group 461.png",color: Color(0xffFFFFFF),),
                    // SizedBox(height: 150,)
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}

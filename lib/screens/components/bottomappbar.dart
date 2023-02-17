import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/screens/artmovement/artmovement.dart';
import 'package:giftex/viewmodel/bottomviewmodel.dart';
BottomViewModel bottomViewModel =BottomViewModel();
class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardE = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardF = new GlobalKey();


  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
      shape: CircularNotchedRectangle(),

      color: Color(0xffD9D9D9),
      child: Observer(
          builder: (context) {
            return Container(

              height: 75,
              padding: EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      bottomViewModel.selectedIndex=0;
                    },
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(4),
                            child: Image.asset("image/home.png",width: 24,height: 24,
                              color: bottomViewModel.selectedIndex==0?Theme.of(context).colorScheme.primary:Colors.black,


                            )),


                        Text("HOME",

                          style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 1,
                            color: bottomViewModel.selectedIndex==0?Theme.of(context).colorScheme.primary:Colors.black,
                          ),)
                      ],
                    ),
                  ),




                  InkWell(
                    onTap: (){
                      bottomViewModel.selectedIndex=1;


                    },
                    child:Column(
                      children: [
                        Icon(
                          Icons.dashboard_outlined,size: 32,
                          color: bottomViewModel.selectedIndex==1?Theme.of(context).colorScheme.primary:Colors.black,
                        ),
                        Text("SERVICE",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 1,
                            color: bottomViewModel.selectedIndex==1?Theme.of(context).colorScheme.primary:Colors.black,
                          ),)
                      ],
                    ),



                  ),

                  Container(),


                  InkWell(
                    onTap: (){
                      bottomViewModel.selectedIndex=2;
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: MediaQuery.of(context).size.height*.7,
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        child: ExpansionTileCard(
                                          finalPadding: EdgeInsets.all(0),
                                          baseColor: Color(0xffFFFFFF),
                                          expandedColor: Color(0xffF3F2EC),
                                          key: cardA,

                                          // trailing: Icon(Icons.add,size: 18,color: Colors.black,),
                                          leading: Container(
                                            height: 60,
                                            width: 60,

                                            child: Image.asset("image/Group 14051.png",),
                                          ),
                                          title: Text("JEWELLERY",textAlign: TextAlign.start,
                                            style:
                                            Theme
                                                .of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(
                                              color: Color(0XFF989379),
                                              fontWeight: FontWeight.w700,
                                            ),),
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(16),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Image.asset("image/Group (21).png",height:20,fit: BoxFit.cover,),
                                                      InkWell(
                                                        onTap: (){
                                                          // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                                        },
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 10.0,top: 0),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text("ART",textAlign: TextAlign.start,
                                                                style:
                                                                Theme
                                                                    .of(context)
                                                                    .textTheme
                                                                    .headline6!
                                                                    .copyWith(
                                                                    color: Color(0XFF5D7E4D),
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 1
                                                                ),),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  InkWell(
                                                    onTap: (){
                                                      // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 20.0,top: 10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Painting",textAlign: TextAlign.start,
                                                            style:
                                                            Theme
                                                                .of(context)
                                                                .textTheme
                                                                .subtitle1!
                                                                .copyWith(
                                                                color: Color(0XFF171515),
                                                                fontWeight: FontWeight.w500,
                                                                letterSpacing: 1
                                                            ),),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Image.asset("image/Line 45.png",fit: BoxFit.cover,),
                                                  InkWell(
                                                    onTap: (){
                                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => HowToSellPage()));
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 20.0,top: 16),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Sculpture",textAlign: TextAlign.start,
                                                            style:
                                                            Theme
                                                                .of(context)
                                                                .textTheme
                                                                .subtitle1!
                                                                .copyWith(
                                                                color: Color(0XFF171515),
                                                                fontWeight: FontWeight.w500,
                                                                letterSpacing: 1
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
                                                        Text("Photography",textAlign: TextAlign.start,
                                                          style:
                                                          Theme
                                                              .of(context)
                                                              .textTheme
                                                              .subtitle1!
                                                              .copyWith(
                                                              color: Color(0XFF171515),
                                                              fontWeight: FontWeight.w500,
                                                              letterSpacing: 1
                                                          ),),
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: (){
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ArtMovementPage()));
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 20.0,top: 16),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Modern Art",textAlign: TextAlign.start,
                                                            style:
                                                            Theme
                                                                .of(context)
                                                                .textTheme
                                                                .subtitle1!
                                                                .copyWith(
                                                                color: Color(0XFF171515),
                                                                fontWeight: FontWeight.w500,
                                                                letterSpacing: 1
                                                            ),),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: ExpansionTileCard(
                                          finalPadding: EdgeInsets.all(0),
                                          baseColor: Color(0xffFFFFFF),
                                          expandedColor: Color(0xffF3F2EC),
                                          key: cardB,

                                          // trailing: Icon(Icons.add,size: 18,color: Colors.black,),
                                          leading: Container(
                                            height: 60,
                                            width: 60,

                                            child: Image.asset("image/Group (18).png",),
                                          ),
                                          title: Text("FURNITURE",textAlign: TextAlign.start,
                                            style:
                                            Theme
                                                .of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(
                                              color: Color(0XFF989379),
                                              fontWeight: FontWeight.w700,
                                            ),),
                                          children: <Widget>[
                                            // Container(
                                            //   padding: EdgeInsets.all(16),
                                            //   child: Column(
                                            //     children: [
                                            //       Row(
                                            //         mainAxisAlignment: MainAxisAlignment.start,
                                            //         crossAxisAlignment: CrossAxisAlignment.center,
                                            //         children: [
                                            //           Image.asset("image/Group (21).png",height:20,fit: BoxFit.cover,),
                                            //           InkWell(
                                            //             onTap: (){
                                            //               // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                            //             },
                                            //             child: Padding(
                                            //               padding: const EdgeInsets.only(left: 10.0,top: 0),
                                            //               child: Row(
                                            //                 mainAxisAlignment: MainAxisAlignment.start,
                                            //                 crossAxisAlignment: CrossAxisAlignment.start,
                                            //                 children: [
                                            //                   Text("ART",textAlign: TextAlign.start,
                                            //                     style:
                                            //                     Theme
                                            //                         .of(context)
                                            //                         .textTheme
                                            //                         .headline6!
                                            //                         .copyWith(
                                            //                         color: Color(0XFF5D7E4D),
                                            //                         fontWeight: FontWeight.w700,
                                            //                         letterSpacing: 1
                                            //                     ),),
                                            //                 ],
                                            //               ),
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 10),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Painting",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       Image.asset("image/Line 45.png",fit: BoxFit.cover,),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) => HowToSellPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Sculpture",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       Padding(
                                            //         padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //         child: Row(
                                            //           mainAxisAlignment: MainAxisAlignment.start,
                                            //           crossAxisAlignment: CrossAxisAlignment.start,
                                            //           children: [
                                            //             Text("Photography",textAlign: TextAlign.start,
                                            //               style:
                                            //               Theme
                                            //                   .of(context)
                                            //                   .textTheme
                                            //                   .subtitle1!
                                            //                   .copyWith(
                                            //                   color: Color(0XFF171515),
                                            //                   fontWeight: FontWeight.w500,
                                            //                   letterSpacing: 1
                                            //               ),),
                                            //           ],
                                            //         ),
                                            //       ),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) => FaqPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Modern Art",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       SizedBox(height: 10,)
                                            //     ],
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: ExpansionTileCard(
                                          finalPadding: EdgeInsets.all(0),
                                          baseColor: Color(0xffFFFFFF),
                                          expandedColor: Color(0xffF3F2EC),
                                          key: cardC,

                                          // trailing: Icon(Icons.add,size: 18,color: Colors.black,),
                                          leading: Container(
                                            height: 60,
                                            width: 60,

                                            child: Image.asset("image/Group (19).png",),
                                          ),
                                          title: Text("WATCHES",textAlign: TextAlign.start,
                                            style:
                                            Theme
                                                .of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(
                                              color: Color(0XFF989379),
                                              fontWeight: FontWeight.w700,
                                            ),),
                                          children: <Widget>[
                                            // Container(
                                            //   padding: EdgeInsets.all(16),
                                            //   child: Column(
                                            //     children: [
                                            //       Row(
                                            //         mainAxisAlignment: MainAxisAlignment.start,
                                            //         crossAxisAlignment: CrossAxisAlignment.center,
                                            //         children: [
                                            //           Image.asset("image/Group (21).png",height:20,fit: BoxFit.cover,),
                                            //           InkWell(
                                            //             onTap: (){
                                            //               // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                            //             },
                                            //             child: Padding(
                                            //               padding: const EdgeInsets.only(left: 10.0,top: 0),
                                            //               child: Row(
                                            //                 mainAxisAlignment: MainAxisAlignment.start,
                                            //                 crossAxisAlignment: CrossAxisAlignment.start,
                                            //                 children: [
                                            //                   Text("ART",textAlign: TextAlign.start,
                                            //                     style:
                                            //                     Theme
                                            //                         .of(context)
                                            //                         .textTheme
                                            //                         .headline6!
                                            //                         .copyWith(
                                            //                         color: Color(0XFF5D7E4D),
                                            //                         fontWeight: FontWeight.w700,
                                            //                         letterSpacing: 1
                                            //                     ),),
                                            //                 ],
                                            //               ),
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 10),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Painting",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       Image.asset("image/Line 45.png",fit: BoxFit.cover,),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) => HowToSellPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Sculpture",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       Padding(
                                            //         padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //         child: Row(
                                            //           mainAxisAlignment: MainAxisAlignment.start,
                                            //           crossAxisAlignment: CrossAxisAlignment.start,
                                            //           children: [
                                            //             Text("Photography",textAlign: TextAlign.start,
                                            //               style:
                                            //               Theme
                                            //                   .of(context)
                                            //                   .textTheme
                                            //                   .subtitle1!
                                            //                   .copyWith(
                                            //                   color: Color(0XFF171515),
                                            //                   fontWeight: FontWeight.w500,
                                            //                   letterSpacing: 1
                                            //               ),),
                                            //           ],
                                            //         ),
                                            //       ),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) => FaqPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Modern Art",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       SizedBox(height: 10,)
                                            //     ],
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: ExpansionTileCard(
                                          finalPadding: EdgeInsets.all(0),
                                          baseColor: Color(0xffFFFFFF),
                                          expandedColor: Color(0xffF3F2EC),
                                          key: cardD,

                                          // trailing: Icon(Icons.add,size: 18,color: Colors.black,),
                                          leading: Container(
                                            height: 60,
                                            width: 60,

                                            child: Image.asset("image/Group 14228.png",),
                                          ),
                                          title: Text("BOOKS",textAlign: TextAlign.start,
                                            style:
                                            Theme
                                                .of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(
                                              color: Color(0XFF989379),
                                              fontWeight: FontWeight.w700,
                                            ),),
                                          children: <Widget>[
                                            // Container(
                                            //   padding: EdgeInsets.all(16),
                                            //   child: Column(
                                            //     children: [
                                            //       Row(
                                            //         mainAxisAlignment: MainAxisAlignment.start,
                                            //         crossAxisAlignment: CrossAxisAlignment.center,
                                            //         children: [
                                            //           Image.asset("image/Group (21).png",height:20,fit: BoxFit.cover,),
                                            //           InkWell(
                                            //             onTap: (){
                                            //               // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                            //             },
                                            //             child: Padding(
                                            //               padding: const EdgeInsets.only(left: 10.0,top: 0),
                                            //               child: Row(
                                            //                 mainAxisAlignment: MainAxisAlignment.start,
                                            //                 crossAxisAlignment: CrossAxisAlignment.start,
                                            //                 children: [
                                            //                   Text("ART",textAlign: TextAlign.start,
                                            //                     style:
                                            //                     Theme
                                            //                         .of(context)
                                            //                         .textTheme
                                            //                         .headline6!
                                            //                         .copyWith(
                                            //                         color: Color(0XFF5D7E4D),
                                            //                         fontWeight: FontWeight.w700,
                                            //                         letterSpacing: 1
                                            //                     ),),
                                            //                 ],
                                            //               ),
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 10),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Painting",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       Image.asset("image/Line 45.png",fit: BoxFit.cover,),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) => HowToSellPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Sculpture",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       Padding(
                                            //         padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //         child: Row(
                                            //           mainAxisAlignment: MainAxisAlignment.start,
                                            //           crossAxisAlignment: CrossAxisAlignment.start,
                                            //           children: [
                                            //             Text("Photography",textAlign: TextAlign.start,
                                            //               style:
                                            //               Theme
                                            //                   .of(context)
                                            //                   .textTheme
                                            //                   .subtitle1!
                                            //                   .copyWith(
                                            //                   color: Color(0XFF171515),
                                            //                   fontWeight: FontWeight.w500,
                                            //                   letterSpacing: 1
                                            //               ),),
                                            //           ],
                                            //         ),
                                            //       ),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) => FaqPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Modern Art",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       SizedBox(height: 10,)
                                            //     ],
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: ExpansionTileCard(
                                          finalPadding: EdgeInsets.all(0),
                                          baseColor: Color(0xffFFFFFF),
                                          expandedColor: Color(0xffF3F2EC),
                                          key: cardE,

                                          // trailing: Icon(Icons.add,size: 18,color: Colors.black,),
                                          leading: Container(
                                            height: 60,
                                            width: 60,

                                            child: Image.asset("image/Vector (20).png",),
                                          ),
                                          title: Text("MERCENDISE",textAlign: TextAlign.start,
                                            style:
                                            Theme
                                                .of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(
                                              color: Color(0XFF989379),
                                              fontWeight: FontWeight.w700,
                                            ),),
                                          children: <Widget>[
                                            // Container(
                                            //   padding: EdgeInsets.all(16),
                                            //   child: Column(
                                            //     children: [
                                            //       Row(
                                            //         mainAxisAlignment: MainAxisAlignment.start,
                                            //         crossAxisAlignment: CrossAxisAlignment.center,
                                            //         children: [
                                            //           Image.asset("image/Group (21).png",height:20,fit: BoxFit.cover,),
                                            //           InkWell(
                                            //             onTap: (){
                                            //               // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                            //             },
                                            //             child: Padding(
                                            //               padding: const EdgeInsets.only(left: 10.0,top: 0),
                                            //               child: Row(
                                            //                 mainAxisAlignment: MainAxisAlignment.start,
                                            //                 crossAxisAlignment: CrossAxisAlignment.start,
                                            //                 children: [
                                            //                   Text("ART",textAlign: TextAlign.start,
                                            //                     style:
                                            //                     Theme
                                            //                         .of(context)
                                            //                         .textTheme
                                            //                         .headline6!
                                            //                         .copyWith(
                                            //                         color: Color(0XFF5D7E4D),
                                            //                         fontWeight: FontWeight.w700,
                                            //                         letterSpacing: 1
                                            //                     ),),
                                            //                 ],
                                            //               ),
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 10),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Painting",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       Image.asset("image/Line 45.png",fit: BoxFit.cover,),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) => HowToSellPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Sculpture",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       Padding(
                                            //         padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //         child: Row(
                                            //           mainAxisAlignment: MainAxisAlignment.start,
                                            //           crossAxisAlignment: CrossAxisAlignment.start,
                                            //           children: [
                                            //             Text("Photography",textAlign: TextAlign.start,
                                            //               style:
                                            //               Theme
                                            //                   .of(context)
                                            //                   .textTheme
                                            //                   .subtitle1!
                                            //                   .copyWith(
                                            //                   color: Color(0XFF171515),
                                            //                   fontWeight: FontWeight.w500,
                                            //                   letterSpacing: 1
                                            //               ),),
                                            //           ],
                                            //         ),
                                            //       ),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) => FaqPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Modern Art",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       SizedBox(height: 10,)
                                            //     ],
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: ExpansionTileCard(
                                          finalPadding: EdgeInsets.all(0),
                                          baseColor: Color(0xffFFFFFF),
                                          expandedColor: Color(0xffF3F2EC),
                                          key: cardF,

                                          // trailing: Icon(Icons.add,size: 18,color: Colors.black,),
                                          leading: Container(
                                            height: 60,
                                            width: 60,

                                            child: Image.asset("image/Group (21).png",),
                                          ),
                                          title: Text("PRINT",textAlign: TextAlign.start,
                                            style:
                                            Theme
                                                .of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(
                                              color: Color(0XFF989379),
                                              fontWeight: FontWeight.w700,
                                            ),),
                                          children: <Widget>[
                                            // Container(
                                            //   padding: EdgeInsets.all(16),
                                            //   child: Column(
                                            //     children: [
                                            //       Row(
                                            //         mainAxisAlignment: MainAxisAlignment.start,
                                            //         crossAxisAlignment: CrossAxisAlignment.center,
                                            //         children: [
                                            //           Image.asset("image/Group (21).png",height:20,fit: BoxFit.cover,),
                                            //           InkWell(
                                            //             onTap: (){
                                            //               // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                            //             },
                                            //             child: Padding(
                                            //               padding: const EdgeInsets.only(left: 10.0,top: 0),
                                            //               child: Row(
                                            //                 mainAxisAlignment: MainAxisAlignment.start,
                                            //                 crossAxisAlignment: CrossAxisAlignment.start,
                                            //                 children: [
                                            //                   Text("ART",textAlign: TextAlign.start,
                                            //                     style:
                                            //                     Theme
                                            //                         .of(context)
                                            //                         .textTheme
                                            //                         .headline6!
                                            //                         .copyWith(
                                            //                         color: Color(0XFF5D7E4D),
                                            //                         fontWeight: FontWeight.w700,
                                            //                         letterSpacing: 1
                                            //                     ),),
                                            //                 ],
                                            //               ),
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) =>HowToBuyPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 10),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Painting",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       Image.asset("image/Line 45.png",fit: BoxFit.cover,),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) => HowToSellPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Sculpture",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       Padding(
                                            //         padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //         child: Row(
                                            //           mainAxisAlignment: MainAxisAlignment.start,
                                            //           crossAxisAlignment: CrossAxisAlignment.start,
                                            //           children: [
                                            //             Text("Photography",textAlign: TextAlign.start,
                                            //               style:
                                            //               Theme
                                            //                   .of(context)
                                            //                   .textTheme
                                            //                   .subtitle1!
                                            //                   .copyWith(
                                            //                   color: Color(0XFF171515),
                                            //                   fontWeight: FontWeight.w500,
                                            //                   letterSpacing: 1
                                            //               ),),
                                            //           ],
                                            //         ),
                                            //       ),
                                            //       InkWell(
                                            //         onTap: (){
                                            //           // Navigator.push(context, MaterialPageRoute(builder: (context) => FaqPage()));
                                            //         },
                                            //         child: Padding(
                                            //           padding: const EdgeInsets.only(left: 20.0,top: 16),
                                            //           child: Row(
                                            //             mainAxisAlignment: MainAxisAlignment.start,
                                            //             crossAxisAlignment: CrossAxisAlignment.start,
                                            //             children: [
                                            //               Text("Modern Art",textAlign: TextAlign.start,
                                            //                 style:
                                            //                 Theme
                                            //                     .of(context)
                                            //                     .textTheme
                                            //                     .subtitle1!
                                            //                     .copyWith(
                                            //                     color: Color(0XFF171515),
                                            //                     fontWeight: FontWeight.w500,
                                            //                     letterSpacing: 1
                                            //                 ),),
                                            //             ],
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       SizedBox(height: 10,)
                                            //     ],
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Column(
                      children: [

                        Container(
                            padding: EdgeInsets.all(4),
                            child: Image.asset("image/bag.png",width: 24,height: 24,
                              color: bottomViewModel.selectedIndex==2?Theme.of(context).colorScheme.primary:Colors.black,
                            )),

                        // Icon(
                        //   Icons.shopping_bag_outlined,size: 32),
                        Text("STORE",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 1,
                            color: bottomViewModel.selectedIndex==2?Theme.of(context).colorScheme.primary:Colors.black,
                          ),)
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      bottomViewModel.selectedIndex=3;
                    },
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(4),
                            child: Image.asset("image/profile.png",width: 24,height: 24,
                              color: bottomViewModel.selectedIndex==3?Theme.of(context).colorScheme.primary:Colors.black,)),
                        // Icon(
                        //   Icons.person_outline,size: 32),

                        Text("PROFILE",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 1,
                            color: bottomViewModel.selectedIndex==3?Theme.of(context).colorScheme.primary:Colors.black,
                          ),)
                      ],
                    ),
                  ),

                ],
              ),
            );
          }
      ),
    );
  }
}

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:giftex/data/local/client/prefs.dart';
import 'package:giftex/screens/components/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:giftex/screens/termsandconditions/termsandconditions.dart';
import 'package:giftex/viewmodel/user/footerviewmodel.dart';

FooterViewModel footerViewModel = FooterViewModel();

class Footer extends StatefulWidget {
  Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  LocalSharedPrefrence? prefrence;

  @override
  void initState() {
    // TODO: implement initState
    prefrence = LocalSharedPrefrence();
    nameController.text = prefrence?.getFullname() ?? '';
    emailController.text = prefrence?.getEmail() ?? '';
    footerViewModel.setupValidations();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        color: Color(0xff1F2A52),
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 0),
                  child: Container(
                    //replace this Container with your Card
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    // color: Color(0Xff1F2A52),
                    color: Colors.white,
                    // height: 830.0,
                  ),
                ),
                Center(
                  child: Container(
                    color: Theme.of(context).colorScheme.surface,
                    width: MediaQuery.of(context).size.width * .90,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "SUBSCRIBE TO",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Color(0xffB45156), fontWeight: FontWeight.bold, letterSpacing: 3.3),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "OUR NEWSLETTER",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Color(0xff373737), fontWeight: FontWeight.bold, letterSpacing: 3.3),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consecte tur adipiscing elit, Lorem ipsum ",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        // SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            controller: nameController,
                            onChanged: (str) {},
                            decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Name',
                                // filled: true,
                                errorText: footerViewModel.subscribeViewModelErrorState.name,
                                enabledBorder:
                                    UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400))),
                          ),
                        ),
                        // SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            controller: emailController,
                            onChanged: (str) {},
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Email',
                                errorText: footerViewModel.subscribeViewModelErrorState.email,
                                // filled: true,
                                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                enabledBorder:
                                    UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400))),
                          ),
                        ),

                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xff1F2A52),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      if (nameController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please Enter A Valid Name"),
                          backgroundColor: Colors.red,
                        ));
                        return;
                      }
                      if (emailController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please Enter A Valid Email"),
                          backgroundColor: Colors.red,
                        ));
                        return;
                      }

                      if (!footerViewModel.subscribeViewModelErrorState.hasErrors) {
                        footerViewModel.insertsubscribeForm().then((value) => {
                              emailController.text = "",
                              nameController.text = "",
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Thank you for subscribing"),
                                backgroundColor: Colors.green,
                              ))
                            });
                      }
                    },
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.0),
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Color(0xffB45156),
                                  Color(0xffE74B52),
                                ],
                              )),
                          child: footerViewModel.isLoadingForUpCommingAuction
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                                  child: Text(
                                    'SUBMIT',
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          color: Color(0XFFFFFFFF),
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 0, right: 16, left: 16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "image/app1.png",
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "ASTAGURU",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 1.33333),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consecte tur adipiscing elit, Lorem ipsum dolor sit. Lorem ipsum dolor sit amet, consecte tur.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white.withOpacity(.70),
                            fontWeight: FontWeight.w200,
                            wordSpacing: 1,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                              shadowColor: Color(0xff1F2A52),
                              initialElevation: 0,
                              contentPadding: EdgeInsets.all(4),

                              key: cardA,

                              trailing: Icon(
                                Icons.add,
                                size: 18,
                                color: Colors.white,
                              ),
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
                              title: Text(
                                "KNOW MORE",
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0XFFFFFFFF),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             DashboardUi(11)));
                                    bottomViewModel.selectedIndex = 11;
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => HowToBuyPage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Buy",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             DashboardUi(10)));
                                    bottomViewModel.selectedIndex = 10;
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => HowToSellPage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sell",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 20.0, top: 16),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.start,
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       Text(
                                //         "Request an Estimate",
                                //         textAlign: TextAlign.start,
                                //         style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                //               color: Color(0XFFFFFFFF),
                                //               fontWeight: FontWeight.w400,
                                //             ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 17;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "FAQs",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    bottomViewModel.selectedIndex = 33;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Blogs",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 20.0, top: 16),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.start,
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       Text(
                                //         "Shipping",
                                //         textAlign: TextAlign.start,
                                //         style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                //               color: Color(0XFFFFFFFF),
                                //               fontWeight: FontWeight.w400,
                                //             ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 20.0, top: 16),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.start,
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       Text(
                                //         "Storage",
                                //         textAlign: TextAlign.start,
                                //         style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                //               color: Color(0XFFFFFFFF),
                                //               fontWeight: FontWeight.w400,
                                //             ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Container(
                            child: ExpansionTileCard(
                              baseColor: Color(0xff1F2A52),
                              expandedColor: Color(0xff1F2A52),
                              key: cardB,
                              trailing: Icon(
                                Icons.add,
                                size: 18,
                                color: Colors.white,
                              ),
                              elevation: 0,
                              shadowColor: Color(0xff1F2A52),
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
                              title: Text(
                                "SERVICES",
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0XFFFFFFFF),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 18;
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => FaqPage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Client Advisory",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             Servicepage()));
                                    bottomViewModel.selectedIndex = 19;
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Servicepage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Restoration",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 20;
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Servicepage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Collection Services",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 21;
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Servicepage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Museum Services",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 22;
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Servicepage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Post Sale Services",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 23;
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Servicepage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Private Sales",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 24;
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Servicepage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Storage",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Container(
                            child: ExpansionTileCard(
                              baseColor: Color(0xff1F2A52),
                              expandedColor: Color(0xff1F2A52),
                              key: cardC,
                              elevation: 0,
                              shadowColor: Color(0xff1F2A52),
                              initialElevation: 0,
                              contentPadding: EdgeInsets.all(4),
                              trailing: Icon(
                                Icons.add,
                                size: 18,
                                color: Colors.white,
                              ),
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
                              title: Text(
                                "ABOUT",
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Color(0XFFFFFFFF),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 29;
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Aboutuspage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Who We Are",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 20.0, top: 16),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.start,
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       Text(
                                //         "Our Management",
                                //         textAlign: TextAlign.start,
                                //         style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                //               color: Color(0XFFFFFFFF),
                                //               fontWeight: FontWeight.w400,
                                //             ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 25;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Press",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    bottomViewModel.selectedIndex = 26;
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Aboutuspage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, top: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Careers",
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                color: Color(0XFFFFFFFF),
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     bottomViewModel.selectedIndex = 29;
                                //     // Navigator.push(context, MaterialPageRoute(builder: (context) => ContactusPage()));
                                //   },
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(left: 20.0, top: 16),
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.start,
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       children: [
                                //         Text(
                                //           "Contact Us",
                                //           textAlign: TextAlign.start,
                                //           style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                //                 color: Color(0XFFFFFFFF),
                                //                 fontWeight: FontWeight.w400,
                                //               ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "FOLLOW US",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white.withOpacity(.70),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "image/Vector (17).png",
                          color: Color(0xffFFFFFF),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "image/Group 377.png",
                          color: Color(0xffFFFFFF),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "image/Vector (18).png",
                          color: Color(0xffFFFFFF),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "image/Group 376.png",
                          color: Color(0xffFFFFFF),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditions()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Terms & Condition | Privacy Policy | Copyright 2022",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

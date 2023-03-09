import 'package:flutter/material.dart';
import 'package:giftex/screens/components/bottomnavigationbar/bottomnavigationbar.dart';

class KYCPage extends StatefulWidget {
  const KYCPage({Key? key}) : super(key: key);

  @override
  State<KYCPage> createState() => _KYCPageState();
}

class _KYCPageState extends State<KYCPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(

        backgroundColor: Color(0xffF7FAFD),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Image.asset("image/shapewhite.png"),
                    Image.asset("image/Shapered.png"),
                    Positioned(
                      top: 54,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Text("HELLO ARYAN RAJ",style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Color(0xff1F2A52),
                         fontWeight: FontWeight.bold
                          )),

                          SizedBox(height: 16,),
                          Text("You're Few Steps Away from\nParticipating in Auction",style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0xff1F2A52),
                         fontWeight: FontWeight.bold,

                          ),
                          textAlign: TextAlign.center,

                          ),
                          SizedBox(height: 32,),
                          Image.asset("image/gkyc.png",width: 210,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 32,),
              Text("Why you need to do KYC?",style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Color(0xff5D5F5C),
              fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 32,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      children: [
                        Container(
                          width:85,
                          height: 80,
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 0,
                                  right:8,
                                  child: Image.asset('image/museback.png',height: 65,width: 55,)),
                              Positioned(
                                  left: 4,
                                  bottom:8,
                                  child: Image.asset('image/authgua.png',height: 65,width: 55,)),

                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text("Authenticity \nGuaranteed",style:Theme.of(context).textTheme.subtitle1,)

                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width:85,
                          height: 80,
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 0,
                                  right:8,
                                  child: Image.asset('image/museback.png',height: 65,width: 55,)),
                              Positioned(
                                  left: 4,
                                  bottom:8,
                                  child: Image.asset('image/bidaction.png',height: 65,width: 55,)),

                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text("Bid In \nAction",style:Theme.of(context).textTheme.subtitle1,)

                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width:85,
                          height: 80,
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 0,
                                  right:8,
                                  child: Image.asset('image/museback.png',height: 65,width: 55,)),
                              Positioned(
                                  left: 4,
                                  bottom:8,
                                  child: Image.asset('image/panindia.png',height: 65,width: 55,)),

                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text("Pan India \nShopping",style:Theme.of(context).textTheme.subtitle1,),


                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Image.asset('image/Line 4.png'),
             SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('image/roupexcla.png',height: 16),
                  SizedBox(width: 8,),
                  Text("Keep your Photo Id Proof Handy ",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Theme.of(context).colorScheme.primary),)
                ],
              ),
              SizedBox(height: 16,),
              Text("To get Bidding Access ",style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Color(0xff5D5F5C)),),
              SizedBox(height: 16,),
              InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => KYCPage()));
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*.75,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffB45156),Color(0xffE74B52),]
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text("COMPLETE YOUR KYC",
                      textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16,),
              InkWell(
                onTap: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DashboardUi(0)),(route) => false,);
                },
                child: Container(
                  height: 40,
                   width: 150,
                  decoration: BoxDecoration(
                      color: Color(0xffF3E8E9),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text("Skip For Now",
                      textAlign: TextAlign.center,
                      style:
                      Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32,),
            ],
          ),
        ),

      ),

    );
  }
}

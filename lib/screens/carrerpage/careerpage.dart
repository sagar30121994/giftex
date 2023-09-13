import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;
import 'package:giftex/screens/components/footer/footer.dart';
import 'package:giftex/screens/components/header.dart';
import 'package:giftex/viewmodel/service/serviceviewmodel.dart';

ServiceViewModel serviceViewModel = ServiceViewModel();

class CareerPage extends StatefulWidget {
  @override
  _CareerPageState createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  int _pageIndex = 0;
  String selectedFileName = '';

  Future<void> showInvalidFileDialog(BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid File'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    serviceViewModel.getCareeres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      // bottomNavigationBar: BottomNavigationBarUi(),
      body: SingleChildScrollView(
        child: Observer(builder: (context) {
          return serviceViewModel.isloading
              ? LinearProgressIndicator()
              : Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .90,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "${serviceViewModel.careersResponse!.pageContent!.title}",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${serviceViewModel.careersResponse!.pageContent!.bannerItem!.title}",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      Padding(
                        padding: EdgeInsets.all(16),
                        child: HtmlWidget(
                          "${serviceViewModel.careersResponse!.pageContent!.bannerItem!.desc}",
                          // textStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * .80,
                      //   child: Text(
                      //     "${serviceViewModel.careersResponse!.pageContent!.bannerItem!.desc}",
                      //     textAlign: TextAlign.center,
                      //     style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      //           color: Color(0XFF000000),
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //   ),
                      // ),
                      // const SizedBox(height: 16,),
                      Container(
                        height: 260,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 54,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: EdgeInsets.only(top: 30, bottom: 0),
                                child: Container(
                                  //replace this Container with your Card
                                  color: Color(0xff1F2A52),
                                  height: 160.0,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 54,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: EdgeInsets.only(top: 30, bottom: 0),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xff8C9FB1),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(265),
                                        bottomRight: Radius.circular(265),
                                      ),
                                    ),
                                    height: 140.0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                left: 0,
                                right: 0,
                                bottom: 54,
                                child: Image.network(
                                  "${serviceViewModel.careersResponse!.pageContent!.bannerItem!.image!.mobile}",
                                  // "",
                                  height: 220,
                                )),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        color: Color(0xffFFFFFF),
                        child: DefaultTabController(
                          length: 3,
                          child: SingleChildScrollView(
                            child: TabBar(
                              onTap: (index) {
                                setState(() {
                                  // if(index==0) { tabColor = Color(0xff6D905D);}
                                  // if(index==1) {tabColor =  Color(0xff6D905D);}
                                  // if(index==2) {tabColor =  Color(0xff6D905D);}
                                });
                                print(index);
                              },
                              // indicator: BoxDecoration(
                              //     color: tabColor
                              // ),
                              isScrollable: true,
                              padding: EdgeInsets.all(0),
                              unselectedLabelColor: Color(0xff2D2D2D).withOpacity(0.6),
                              labelColor: const Color(0xFF000000),
                              labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                              tabs: [
                                Tab(text: "Show All"),
                                Tab(text: "Full time opportunities "),
                                Tab(text: "internship opportunities"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: serviceViewModel.careersResponse!.pageContent!.vacancies!.array!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _buildPlayerModelList(index);
                          },
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width, child: Footer()),
                      Container(
                        color: Color(0xff1F2A52),
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  )),
                );
        }),
      ),
    );
  }

  Widget _buildPlayerModelList(int index) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 0,
      child: ExpansionTile(
        backgroundColor: Color(0xffF9F9F9),
        leading: Image.asset("image/Group.png", color: Color(0XffB45156)),
        title: Text(
          serviceViewModel.careersResponse!.pageContent!.vacancies!.array![index].title ?? "",
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Color(0XFF000000),
                fontWeight: FontWeight.w600,
              ),
        ),
        subtitle: Row(
          children: [
            Image.asset(
              "image/Vector (11).png",
              color: Color(0XffB45156),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Mumbai",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Color(0XFF000000),
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Job Description",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: HtmlWidget(
                    serviceViewModel.careersResponse!.pageContent!.vacancies!.array![index].desc ?? "",
                    // textStyle: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 410,
                  child: Stack(
                    children: [
                      Container(
                        height: 380,
                        width: 410,
                        color: Color(0xffF9F9F9).withOpacity(0.7),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lets Work Together",
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Color(0XFF000000),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Fill the form below and get in touch",
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0XFF000000),
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                                ],
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Name',
                                    hintText: 'Enter Your Name',
                                    prefixIcon: Icon(Icons.person_outline_sharp),
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true),

                                onChanged: (str) => serviceViewModel.setFullName(str),

                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email Id',
                                    hintText: 'Enter Your Email',
                                    prefixIcon: Icon(Icons.email_outlined),
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true),
                                onChanged: (str) => serviceViewModel.setEmail(str),

                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                maxLength: 10,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    counter: Container(),
                                    labelText: 'Mobile No',
                                    hintText: 'Enter Your No',
                                    prefixIcon: Icon(Icons.add_ic_call),
                                    filled: true,
                                    fillColor: Color(0xffFFFFFF),
                                    isDense: true),
                                onChanged: (str) => serviceViewModel.setMobile(str),

                              ),
                            ),
                            SizedBox(height: 8,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white
                              ),
                              onPressed: () async {
                                FilePickerResult? result = await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['pdf'],
                                );

                                if (result != null) {
                                  PlatformFile file = result.files.first;
                                  String fileName = file.name ?? ''; // Get the file name
                                  int fileSize = file.size ?? 0; // Get the file size in bytes

                                  if (fileName.endsWith('.pdf') && fileSize <= 2 * 1024 * 1024) {
                                    String baseURI = "";
                                    setState(() {
                                      File pdfFile = File(file.path!);
                                      List<int> bytes = pdfFile.readAsBytesSync();
                                      String file64 = base64Encode(bytes);
                                      print("data:application/pdf;base64,"+file64);
                                      selectedFileName = fileName;
                                      baseURI = "data:application/pdf;base64,"+file64;

                                });
                                serviceViewModel.setResume(baseURI);

                                } else {
                                    // Show a dialog indicating that the file does not meet the criteria
                                    String message = '';

                                    if (!fileName.endsWith('.pdf')) {
                                      message = 'Only PDF files are allowed.';
                                    }

                                    if (fileSize > 2 * 1024 * 1024) {
                                      message += '\nFile size should be less than 2MB.';
                                    }

                                    showInvalidFileDialog(context, message);
                                  }
                                } else {
                                  // User canceled the file picker or selected an invalid file
                                }
                              },
                              child: Text(
                                'Upload PDF Resume${selectedFileName.isNotEmpty ? ' - $selectedFileName' : ''}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(top: 15),
                            //   child: TextField(
                            //     decoration: InputDecoration(
                            //         border: OutlineInputBorder(),
                            //         labelText: 'Upload Resume',
                            //         hintText: '',
                            //         filled: true,
                            //         fillColor: Color(0xffFFFFFF),
                            //         isDense: true),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 340.0),
                        child: Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color(0XffB45156)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  // side: BorderSide(color: Colors.red)
                                ))),
                            onPressed: ()
                              {
                              serviceViewModel.insertCareerForm().then((value) => {
                              if (value.status == 200)
                              {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.message!),
                              backgroundColor: Colors.green,),)
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.message!),
                                  backgroundColor: Colors.green,),)
                              }
                              });
                              },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0, left: 8, top: 12, bottom: 12),
                              child: Text(
                                'Apply Now',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color(0XFFFFFFFF),
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemModel {
  bool expanded;
  String? headerItem;
  String? discription;
  Color? colorsItem;
  String? img;

  ItemModel({this.expanded: false, this.headerItem, this.discription, this.colorsItem, this.img});
}

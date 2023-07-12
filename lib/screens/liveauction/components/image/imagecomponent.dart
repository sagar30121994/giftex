import 'package:flutter/material.dart';

import '../../../../data/network/models/responce/lot/upcominglotsresponse.dart';

class ImageConponent extends StatefulWidget {
  ImageConponent(this.images);
  List<Images> images;
  @override
  State<ImageConponent> createState() => _ImageConponentState();
}

class _ImageConponentState extends State<ImageConponent> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.3),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .8,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return Image.network(widget.images[index].bigImage!);
                  },
                  itemCount: widget.images.length,
                  allowImplicitScrolling: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) => setState(() {
                    index = value;
                  }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.images
                    .map((e) => InkWell(
                          onTap: () {
                            setState(() {
                              index = widget.images.indexOf(e);
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: e.bigImage == widget.images[index].bigImage! ? Colors.red : Colors.white)),
                              child: Image.network(height: 60, e.bigImage!)),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

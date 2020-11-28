import 'package:flutter/services.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter/material.dart';

class Pickup extends StatefulWidget {
  @override
  _PickupState createState() => _PickupState();
}

class _PickupState extends State<Pickup> {
  List<Asset> images = List<Asset>();

  String error = '';

  Widget buildGridView() {
    print('gwa elgrod ${images.length}');
    return GridView.count(
      crossAxisCount: 5,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(asset: asset, width: 300, height: 300);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.only(right: 50, left: 50, top: 60),
          child: images.length == 0
              ? Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/back.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(height: 400, width: 400, child: buildGridView()),
        ),
        GestureDetector(
          onTap: getImage,
          child: Container(
              width: 140,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/img/gallery.png",
                        width: 42,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Gallery",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 8,
                      ),
                      Text("from Gallary",
                          style: TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                              fontWeight: FontWeight.w600)),
                    ]),
              )),
        ),
        Container(
          color: Colors.blueAccent,
          width: double.infinity,
          // color: Colors.blue[300],
          child: Column(
            children: [
              FlatButton(
                  color: Colors.blue,
                  //  color: Colors.blue[300],
                  onPressed: () {},
                  child: Text('Upload')),
              FlatButton(
                  color: Colors.blue[300],
                  onPressed: null,
                  child: Text('Next')),
            ],
          ),
        )
      ]),
    );
  }

  Future<void> getImage() async {
    String errormsg = '';
    List<Asset> resultImages = List<Asset>();
    // final picker = MultiImagePicker();
    try {
      resultImages = await MultiImagePicker.pickImages(
        maxImages: 20,
        enableCamera: false,
        selectedAssets: images,
        // cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
            //actionBarColor: "#abcdef",
            //actionBarTitle: "example",
            //allViewTitle: "all photos",
            // useDetailsView: false,
            // selectCircleStrokeColor: '#000000',
            ),
      );
    } on Exception catch (e) {
      error = e.toString();
      print('e $error');
    }
    if (!mounted) return;

    setState(() {
      images = resultImages;
      error = errormsg;
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Pickup(),
      //   ),
      // );
    });
  }
}

// class Gridvieww extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: images.,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

//             childAspectRatio: 3 / 2, crossAxisCount: 5),
//         itemBuilder: (ctx, i) => Image(image: image[i]));
//   }

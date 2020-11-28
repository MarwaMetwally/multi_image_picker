import 'package:flutter/services.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
// import 'package:Need/src/controllers/sharedprefrence.dart';
// import 'package:Need/src/elements/ShoppingCartButtonWidget.dart';
// import 'package:Need/src/models/market.dart';
// import 'package:Need/src/pages/CameraScreen.dart';
// import 'package:Need/src/pages/PickAddress.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import '../repository/settings_repository.dart' as settingsRepo;
// import 'package:google_fonts/google_fonts.dart';

// class CamerOrPickup extends StatefulWidget {
//   final GlobalKey<ScaffoldState> parentScaffoldKey;
//   String image;
//   Market market;
//   CamerOrPickup({ @required this.market,Key key, this.parentScaffoldKey, this.image}) : super(key: key);
//   @override
//   _CamerOrPickupState createState() => _CamerOrPickupState();
// }
// class _CamerOrPickupState extends State<CamerOrPickup> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           // leading: new IconButton(
//           //   icon: new Icon(Icons.sort, color: Theme
//           //       .of(context)
//           //       .hintColor),
//           //   onPressed: () => widget.parentScaffoldKey.currentState.openDrawer(),
//           // ),
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: ValueListenableBuilder(
//             valueListenable: settingsRepo.setting,
//             builder: (context, value, child) {
//               return Text(
//                 "pick ",
//                 style: Theme
//                     .of(context)
//                     .textTheme
//                     .headline
//                     .merge(TextStyle(letterSpacing: 1.3)),
//               );
//             },
//           ),
//           actions: <Widget>[
//             new ShoppingCartButtonWidget(
//                 iconColor: Theme
//                     .of(context)
//                     .hintColor,
//                 labelColor: Theme
//                     .of(context)
//                     .accentColor),
//           ],
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.only(
//                   left: MediaQuery
//                       .of(context)
//                       .size
//                       .width * 0.15,
//                   right: MediaQuery
//                       .of(context)
//                       .size
//                       .width * 0.15),
//               child:
//               widget.image != null ? Container(
//                   height: 300,
//                   width: MediaQuery
//                       .of(context)
//                       .size
//                       .width * 0.70,
//                   child: Image.file(File(widget.image), fit: BoxFit.cover)) :
//               Container(
//                 height: 300,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/img/back.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 makeDashboardItem("Camera", Icons.camera),
//                 makeDashboardItem2("Pick Image", Icons.image),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 FlatButton(
//                   onPressed: () async
//                   {
//                     if (widget.image != null)
//                     {
//                      // bool res=await shareddata.saveImage(widget.image);
//                      //  if(res)
//                      //  {

//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => PickAddress(image: widget.image,market:widget.market),
//                           ),
//                         );
//                     }else
//                       {

//                         Fluttertoast.showToast(
//                             msg: "please select perspective",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.CENTER,
//                             timeInSecForIosWeb: 1,
//                             backgroundColor: Colors.grey,
//                             textColor: Colors.white,
//                             fontSize: 16.0
//                         );
//                       }
//                   },
//                   padding: EdgeInsets.symmetric(vertical: 14),
//                   color: Theme
//                       .of(context)
//                       .accentColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(0),
//                     //side: BorderSide(color: Theme.of(context).primaryColor)
//                   ),
//                   child: Container(
//                     height: 30,
//                     width: double.infinity,
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Text(
//                       "Next",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         )

//     );
//   }

//   Widget makeDashboardItem(String title, IconData icon) {
//     return GestureDetector(
//       onTap: () {
//         getImage();
//       },
//       child: Container(
//         width: 140,
//         decoration: BoxDecoration(
//             color: Colors.black38, borderRadius: BorderRadius.circular(10)),
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Image.asset(
//                 "assets/img/gallery.png",
//                 width: 42,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Gallery",
//                 style: GoogleFonts.openSans(
//                     textStyle: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600)),
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 "from Gallary",
//                 style: GoogleFonts.openSans(
//                     textStyle: TextStyle(
//                         color: Colors.white38,
//                         fontSize: 10,
//                         fontWeight: FontWeight.w600)),
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget makeDashboardItem2(String title, IconData icon) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => CameraScreen(market:widget.market),
//           ),
//         );
//       },
//       child: Container(
//         width: 140,

//         decoration: BoxDecoration(
//             color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Image.asset(
//                 "assets/img/photo.png",
//                 width: 42,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Camera",
//                 style: GoogleFonts.openSans(
//                     textStyle: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600)),
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 "picture for perspective",
//                 style: GoogleFonts.openSans(
//                     textStyle: TextStyle(
//                         color: Colors.white38,
//                         fontSize: 10,
//                         fontWeight: FontWeight.w600)),
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future getImage() async {
//     File _image;
//     final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => CamerOrPickup(image: pickedFile.path,market:widget.market),
//           ),
//         );
//         print(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
// }

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
          width: double.infinity,
          // color: Colors.blue[300],
          child: Column(
            children: [
              FlatButton(
                  color: Colors.blue,
                  //  color: Colors.blue[300],
                  onPressed: (){},
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
      print('len ${images.length}')
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

import 'dart:io';

import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VideoPicker extends StatefulWidget {
  @override
  _VideoPickerState createState() => _VideoPickerState();
}

class _VideoPickerState extends State<VideoPicker> {
  List<Asset> images = List<Asset>();
  String error = '';
  File video;
  final picker = ImagePicker();
  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        if (video != null)
          _videoPlayerController.value.initialized
              ? Container(
                  height: 300,
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController),
                  ),
                )
              : Container(
                  child: Text('filed'),
                )
        else
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50, top: 60),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/back.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        GestureDetector(
          onTap: getVideo,
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
          child: Column(
            children: [
              FlatButton(onPressed: () {}, child: Text('Upload Video')),
              FlatButton(onPressed: null, child: Text('Done')),
            ],
          ),
        )
      ]),
    );
  }

  getVideo() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    video = File(pickedFile.path);
    _videoPlayerController = VideoPlayerController.file(video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });

    // setState(() {
    //   if (pickedFile != null) {
    //     video = File(pickedFile.path);
    //   } else {
    //     print('No image selected.');
    //   }
    // });
  }
}

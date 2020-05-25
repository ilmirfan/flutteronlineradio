import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_radio/flutter_radio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const streamUrl = "https://castcloud.pvtwebs.com:8091/stream";

  bool isPlaying;
   bool playVisibility = true;
   bool pauseVisibility = false;

  @override
  void initState() {
    super.initState();
    audioStart();
    playingStatus();
  }

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
    print('Audio Start OK');
  }

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          backgroundColor: Color(0xffCF3E2D),
          body: SafeArea(
            child: new Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 300,
                  // width: 300,
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: AssetImage('assets/images/hira-fm-logo.png'))),
                ),
                Text('24 மணிநேர இஸ்லாமிய தமிழ் வானொலி',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white)),
                SizedBox(height: 20),
                Text('ஐரோப்பாவிலிருந்து உலகம் முழுவதும் டிஜிடல் ஒலிபரப்பு',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white)),

               SizedBox(height: 40,),
                Visibility(child:  IconButton(
                    icon: Icon(Icons.play_circle_filled),
                    iconSize: 80,
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        playVisibility = false;
                        pauseVisibility = true;
                      });
                      FlutterRadio.playOrPause(url: streamUrl);
                      playingStatus();
                    }),visible: playVisibility,
),
Visibility(child:  IconButton(
                    icon: Icon(Icons.pause_circle_filled),
                    iconSize: 80,
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        
                        pauseVisibility = false;
                        playVisibility = true;
                      });
                      FlutterRadio.playOrPause(url: streamUrl);
                      playingStatus();
                    }),visible: pauseVisibility,
)
               
                
              ],
            )),
          ),
        ));
  }

  Future playingStatus() async {
    bool isP = await FlutterRadio.isPlaying();
    setState(() {
      isPlaying = isP;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:haptics_app/components/linkPainter.dart';
import 'package:haptics_app/components/pitchPainter.dart';
import 'package:haptics_app/components/player.dart';
import 'package:web_socket_channel/io.dart';

class PitchSide extends StatefulWidget {
  const PitchSide({Key? key}) : super(key: key);

  @override
  State<PitchSide> createState() => _PitchSideState();
}

class _PitchSideState extends State<PitchSide> {
  final channel = IOWebSocketChannel.connect(Uri.parse('ws://192.168.2.18:8080'));
  
  bool tapped = false;
  
  bool backVib = false;
  
  bool frontVib = false;
  
  bool rhsVib = false;
  
  bool lhsVib = false;
  
  double distance1 = 0.0;   //for storing distance
  
  String ReceivedData='';   //for esp32

  double distanceAnchor1=0.0;
  double distanceAnchor2=0.0;

  @override
  void initState() {
    super.initState();
    streamListener();
  }

  streamListener() {
    channel.stream.listen((message) {
      setState(() {
        checkAndExtractAnchorDistance(message);
      });
      
    });
  }
  void checkAndExtractAnchorDistance(String data){

    if (data.startsWith('ANCHOR')){

      //splitting message into anchor and distance
      final parts = data.split(":");

      if(parts.length==2){
        final anchor = parts[0];
        final distance= double.tryParse(parts[1]);

        if (anchor=="ANCHOR132" && distance !=null){

          distanceAnchor1=distance;
          
        }
        if (anchor=="ANCHOR6019" && distance !=null){

          distanceAnchor2=distance;
          
        }
        if(distance != null){
          distance1=distance;
          ReceivedData = 'Received: Anchor $anchor, Distance: $distance1';
          print(ReceivedData);
        }

      }
    }
  }

  void updateLeft() {
    if (tapped) {
      sendWebSocketMessage("PIN25_ON");
      sendWebSocketMessage("PIN21_OFF");
    } else {
      sendWebSocketMessage("PIN25_OFF");
    }
  }

  void updateRight() {
    if (tapped) {
      sendWebSocketMessage("PIN21_ON");
      sendWebSocketMessage("PIN25_OFF");
    } else {
      sendWebSocketMessage("PIN21_OFF");
    }
  }

  void updateTop() {
    if (tapped) {
      sendWebSocketMessage("PIN27_ON");
      sendWebSocketMessage("PIN23_OFF");
    } else {
      sendWebSocketMessage("PIN27_OFF");
    }
  }

  void updateBottom() {
    if (tapped) {
      sendWebSocketMessage("PIN23_ON");
      sendWebSocketMessage("PIN27_OFF");
    } 
    else {
      sendWebSocketMessage("PIN23_OFF");
    }
  }

   void updateTapped(bool startVibration) {

    tapped = startVibration;

    print(tapped);
}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Player gkA = Player(
      position: "GK",
      color: Colors.red,
      borderColor: Colors.redAccent,
      initLeft: (width * 0.5) - 25,
      initTop: 10,
      left: updateLeft,
      right: updateRight,
      top: updateTop,
      bottom: updateBottom,
      tapped: updateTapped,
    );

    Player cbA1 = Player(
        position: "CB",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: (width * 0.5) + 50,
        initTop: (height * 0.167),
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player cbA2 = Player(
        position: "CB",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: (width * 0.5) - 100,
        initTop: (height * 0.167),
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player lbA = Player(
        position: "LB",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: width - 100,
        initTop: height * 0.25,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player rbA = Player(
        position: "RB",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: 50,
        initTop: height * 0.25,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player cdmA = Player(
        position: "CDM",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: (width * 0.5) - 25,
        initTop: height / 3,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player cmA1 = Player(
        position: "CM",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: (width * 0.5) + 50,
        initTop: height * 0.5,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player cmA2 = Player(
        position: "CM",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: (width * 0.5) - 100,
        initTop: height * 0.5,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player rwA = Player(
        position: "RW",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: 50,
        initTop: height * 0.65,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player lwA = Player(
        position: "LW",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: width - 100,
        initTop: height * 0.65,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    Player cfA = Player(
        position: "CF",
        color: Colors.red,
        borderColor: Colors.redAccent,
        initLeft: (width * distanceAnchor1) - 25,
        initTop: height * distanceAnchor2,
        left: updateLeft,
        right: updateRight,
        top: updateTop,
        bottom: updateBottom,
        tapped: updateTapped);

    return SafeArea(
      child: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/pitch.jpg'))),
              height: height,
              width: width,
              child: CustomPaint(
                painter: PitchPainter(),
                foregroundPainter: LinkPainter(),
              ),
            ),
            gkA,
            cbA1,
            cbA2,
            lbA,
            rbA,
            cdmA,
            cmA1,
            cmA2,
            lwA,
            rwA,
            cfA,
          ],
        ),
      ),
    );
  }

  void sendWebSocketMessage(String message) {
    channel.sink.add(message);
  }
}

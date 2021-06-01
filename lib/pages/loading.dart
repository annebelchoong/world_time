import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instances = WorldTime(
        location: 'Kuala Lumpur', flag: 'malaysia.jpg', url: 'Asia/Kuala_Lumpur');
    await instances.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instances.location,
      'flag': instances.flag,
      'time': instances.time,
      'isDayTime': instances.isDayTime,
    });
  }

  @override
  //Run at the start when the widget is created
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 100.0,
        ),
      )
    );
  }
}

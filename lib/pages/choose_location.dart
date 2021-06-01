import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(
        url: 'Asia/Kuala_Lumpur',
        location: 'Kuala Lumpur',
        flag: 'malaysia.png'),
  ];

  void updateTime(index) async {
    WorldTime instances = locations[index];
    await instances.getTime();
    //  navigate to home screen
    // use pop because it was pushed which is on top of the home so need to pop it back
    // for pop no need to use arguments, just use the map
    Navigator.pop(context, {
      'location': instances.location,
      'flag': instances.flag,
      'time': instances.time,
      'isDayTime': instances.isDayTime,
    });
  }

  // void getData() async{
  //
  // //  simulate the network request for a username
  //   String username = await Future.delayed(
  //       Duration(seconds: 3),
  //       () {
  //         return 'yoshi';
  //       });
  //
  //   //simulate network request to get bio of the username
  //   String bio = await Future.delayed(
  //       Duration(seconds: 2),
  //           () {
  //         return 'vegan, musician & egg collection';
  //       });
  //
  // //Run at the start when the widget is created
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:http/http.dart';
import 'package:intl/intl.dart';

//To change the http json string to usable info
import 'dart:convert';

class WorldTime {
  WorldTime({required this.location, required this.flag, required this.url});
  String location; //location name for the UI
  String? time; // time in that location
  String flag; //url to an asset flag icon
  String url; // location url for api endpoint
  bool? isDayTime; // true or false if daytime or not

  Future<void> getTime() async {
    try {
      // make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      //Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      // Create a datetime object
      // will auto be change to utc time with the DateTime.parse
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property\
      //isDayTime will be true between 6am to 8pm
      isDayTime = now.hour > 6 && now.hour < 14 ? true : false;
      time = DateFormat.jm().format(now);
      // print(now);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}

// void getData() async{
//
//   //getting data from the endpoint and wait till it get all the info and then convert it to maps and print it
//   Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
//   //Decode the json string into a map
//   Map data = jsonDecode(response.body);
//   print(data);
//   print(data['title']);
// }

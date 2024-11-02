import 'package:flutter/material.dart';
// I ran the application in chrome to avoid problem of overflow.
void main() {
  runApp(
     MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("WeatherForecast"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WeatherForecast(day: "Sun",weathercondition:"assets/images/Weather/sun.png",maxterper: "15",mintermper: "3",),
                WeatherForecast(day: "Mon",weathercondition:"assets/images/Weather/sunrain.png",maxterper: "12",mintermper: "7",),
                WeatherForecast(day: "Tue",weathercondition:"assets/images/Weather/CloudyRain.png",maxterper: "9",mintermper: "7",),
                WeatherForecast(day: "Wed",weathercondition:"assets/images/Weather/CloudyRain.png",maxterper: "8",mintermper: "1",),
                WeatherForecast(day: "Thur",weathercondition:"assets/images/Weather/snowy.jpeg",maxterper: "5",mintermper: "2",),
                WeatherForecast(day: "Fri",weathercondition:"assets/images/Weather/cloudysun.png",maxterper: "4",mintermper: "4",),
                WeatherForecast(day: "Sat",weathercondition:"assets/images/Weather/sun.png",maxterper: "3",mintermper: "3",),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class WeatherForecast extends StatelessWidget {
  final String weathercondition;
  final String mintermper;
  final String maxterper;
  final String day;
  WeatherForecast({
    super.key,
    required this.day,
    required this.weathercondition,
    required this.mintermper,
    required this.maxterper
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(day,style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          Image.asset(weathercondition,width: 30,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("$maxterper°C",style: TextStyle(
                color: Colors.black
              ),),
              Text("- $mintermper°C",style: TextStyle(
                color: Colors.grey,
              ),)
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CurrentWeatherDashboard extends StatefulWidget {
  final temperatureC, temperatureF, currentTime, weatherCondition, iconImg;

  const CurrentWeatherDashboard({
    super.key,
    required this.temperatureC,
    required this.temperatureF,
    required this.currentTime,
    required this.weatherCondition,
    required this.iconImg,
  });

  @override
  State<CurrentWeatherDashboard> createState() =>
      _CurrentWeatherDashboardState();
}

class _CurrentWeatherDashboardState extends State<CurrentWeatherDashboard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 190,
      child: Card(
        elevation: 10,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // ${jsonDecode(snapshot.data.body)["current"]["temp_c"]?.toString()}
                    "${widget.temperatureC}°C",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    // ${jsonDecode(snapshot.data.body)["current"]["temp_f"]?.toString()}
                    "${widget.temperatureF}°F",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Image.network(widget.iconImg),
              Text(
                widget.weatherCondition,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Text(
                // ${jsonDecode(snapshot.data.body)["current"]["last_updated"]?.toString()}
                "${widget.currentTime}",
                style: TextStyle(fontSize: 18),
              )
            ]),
      ),
    );
  }
}

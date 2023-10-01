import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rangpur_weather/components/additional_info_ele.dart';
import 'package:rangpur_weather/components/current_weather_dashboard.dart';
import 'package:rangpur_weather/components/forecast_ele.dart';
import 'package:rangpur_weather/fetching_api_functions/get_weather_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rangpur Weather",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 1,
        // leading: IconButton(
        //   onPressed: () {
        //     setState(() {
        //
        //     });
        //   },
        //   icon: const Icon(Icons.wb_twilight_rounded),
        // ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                weatherData = getWeatherData();
              });
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: FutureBuilder(
        future: weatherData,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CurrentWeatherDashboard(
                        temperatureC: jsonDecode(snapshot.data.body)["current"]
                                ["temp_c"]
                            .toString(),
                        temperatureF: jsonDecode(snapshot.data.body)["current"]
                                ["temp_f"]
                            .toString(),
                        currentTime: jsonDecode(snapshot.data.body)["current"]
                                ["last_updated"]
                            .toString(),
                        weatherCondition:
                            jsonDecode(snapshot.data.body)["current"]
                                    ["condition"]["text"]
                                .toString(),
                        iconImg:
                            "http:${jsonDecode(snapshot.data.body)["current"]["condition"]["icon"].toString()}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: Text(
                          "Forecast Average",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 185,
                        width: double.infinity,
                        child: Center(
                          child: ListView.builder(
                            // reverse: true,
                            itemCount: min(
                                7,
                                jsonDecode(snapshot.data.body)["forecast"]
                                        ["forecastday"]
                                    .length),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ForecastEle(
                                temperature:
                                    "${jsonDecode(snapshot.data.body)["forecast"]["forecastday"][index]["day"]["avgtemp_c"].toString()}°C",
                                time:
                                    "${jsonDecode(snapshot.data.body)["forecast"]["forecastday"][index]["date"]}",
                                weatherContidion:
                                    jsonDecode(snapshot.data.body)["forecast"]
                                                ["forecastday"][index]["day"]
                                            ["condition"]["text"]
                                        .toString(),
                                weatherIcon:
                                    "https:${jsonDecode(snapshot.data.body)["forecast"]["forecastday"][index]["day"]["condition"]["icon"]}",
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: Text(
                          "Additional Information",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AdditionalInfoEle(
                                  icon: Icons.water_drop,
                                  title: "Humidity",
                                  value:
                                      jsonDecode(snapshot.data.body)["current"]
                                              ["humidity"]
                                          .toString()),
                              AdditionalInfoEle(
                                  icon: Icons.speed_rounded,
                                  title: "Wind Speed",
                                  value:
                                      "${jsonDecode(snapshot.data.body)["current"]["wind_kph"].toString()} kph"),
                              AdditionalInfoEle(
                                  icon: Icons.directions,
                                  title: "Wind Dir",
                                  value:
                                      jsonDecode(snapshot.data.body)["current"]
                                              ["wind_dir"]
                                          .toString()),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

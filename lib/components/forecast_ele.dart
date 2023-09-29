import 'package:flutter/material.dart';

class ForecastEle extends StatelessWidget {
  final temperature, weatherIcon, time, weatherContidion;

  const ForecastEle({
    super.key,
    required this.temperature,
    required this.weatherIcon,
    required this.time,
    required this.weatherContidion,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      width: 180,
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              temperature,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Image.network(
              weatherIcon,
            ),
            Text(
              weatherContidion,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis),
            ),
            Text(
              time,
              style: const TextStyle(
                  fontSize: 20, overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      ),
    );
  }
}

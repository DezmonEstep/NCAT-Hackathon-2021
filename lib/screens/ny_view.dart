import 'package:analytics/views/ny_gender_stats_view.dart';
import 'package:analytics/views/ny_race_stats_view.dart';
import 'package:analytics/views/ny_service_stats_view.dart';
import 'package:flutter/material.dart';

class NY_View extends StatelessWidget {
  
  const NY_View ({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.wc), text: "Gender Data"),
                Tab(icon: Icon(Icons.groups), text: "Race Data",),
                Tab(icon: Icon(Icons.health_and_safety), text: "Health Data",),
              ],
            ),
            title: const Text('New York'),
          ),
          body: const TabBarView(
            children: [
              NY_Gender_Stats_View(),
              NY_Race_Stats_View(),
              NY_Service_Stats_View()
            ],
          ),
        ),
      ),
    );
  }
  
}
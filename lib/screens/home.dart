import 'package:analytics/screens/tab_view.dart';
import 'package:analytics/store/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataSets>(
      builder: (BuildContext ctx, DataSets dataSets, _) {
        if (dataSets.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (dataSets.loading_complete) {
          return const MainTabView();
        } else {
          return TextButton(
            onPressed: () {
              dataSets.fetch();
            },
            child: const Text("Load Data")
          );
        }
      }
    );
  }
}

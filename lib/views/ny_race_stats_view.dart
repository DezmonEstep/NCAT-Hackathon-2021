/// Package import
import 'package:analytics/store/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

class NY_Race_Stats_View extends StatefulWidget {
  const NY_Race_Stats_View({Key? key}) : super(key: key);

  @override
  _NY_Race_Stats_ViewState createState() => _NY_Race_Stats_ViewState();
}

class _NY_Race_Stats_ViewState extends State<NY_Race_Stats_View> {

  @override
  Widget build(BuildContext context) {
    return Consumer<DataSets>(
      builder: (BuildContext context, DataSets dataSets, _) {
        return _buildDefaultDoughnutChart(dataSets);
      },
    );
  }

  SfCircularChart _buildDefaultDoughnutChart(DataSets dataSets) {
    return SfCircularChart(
      title: ChartTitle(text: 'New York Race Data'),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        textStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
      series: _getDefaultDoughnutSeries(dataSets),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<DoughnutSeries<_RaceData, String>> _getDefaultDoughnutSeries(DataSets dataSets) {
    final List<_RaceData> chartData = <_RaceData>[
      _RaceData(x: 'Black', y: dataSets.ny_race_stats.black_percentage, percentage: '${dataSets.ny_race_stats.black_percentage.toStringAsFixed(1)}%'),
      _RaceData(x: 'Hispanic', y: dataSets.ny_race_stats.hispanic_percentage, percentage: '${dataSets.ny_race_stats.hispanic_percentage.toStringAsFixed(1)}%'),
      _RaceData(x: 'White', y: dataSets.ny_race_stats.white_percentage, percentage: '${dataSets.ny_race_stats.white_percentage.toStringAsFixed(1)}%'),
      _RaceData(x: 'Other', y: dataSets.ny_race_stats.other_percentage, percentage: '${dataSets.ny_race_stats.other_percentage.toStringAsFixed(1)}%'),
      _RaceData(x: 'Unknown', y: dataSets.ny_race_stats.unknown_percentage, percentage: '${dataSets.ny_race_stats.unknown_percentage.toStringAsFixed(1)}%'),
    ];
    return <DoughnutSeries<_RaceData, String>>[
      DoughnutSeries<_RaceData, String>(
        radius: '80%',
        explode: true,
        explodeOffset: '10%',
        dataSource: chartData,
        xValueMapper: (_RaceData data, _) => data.x as String,
        yValueMapper: (_RaceData data, _) => data.y,
        dataLabelMapper: (_RaceData data, _) => data.percentage,
        dataLabelSettings: const DataLabelSettings(isVisible: true)
      )
    ];
  }

}

class _RaceData {
  final String x;
  final num y;
  final String percentage;
  _RaceData({
    required this.x,
    required this.y,
    required this.percentage
  });
}
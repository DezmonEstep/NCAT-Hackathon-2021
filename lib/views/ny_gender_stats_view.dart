/// Package import
import 'package:analytics/store/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

class NY_Gender_Stats_View extends StatefulWidget {
  const NY_Gender_Stats_View({Key? key}) : super(key: key);

  @override
  _NY_Gender_Stats_ViewState createState() => _NY_Gender_Stats_ViewState();
}

class _NY_Gender_Stats_ViewState extends State<NY_Gender_Stats_View> {

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
      title: ChartTitle(text: 'New York Gender Data'),
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

  List<DoughnutSeries<_GenderData, String>> _getDefaultDoughnutSeries(DataSets dataSets) {
    final List<_GenderData> chartData = <_GenderData>[
      _GenderData(x: 'Male', y: dataSets.ny_gender_stats.male_percentage, percentage: '${dataSets.ny_gender_stats.male_percentage.toStringAsFixed(1)}%'),
      _GenderData(x: 'Female', y: dataSets.ny_gender_stats.female_percentage, percentage: '${dataSets.ny_gender_stats.female_percentage.toStringAsFixed(1)}%'),
      _GenderData(x: 'Other', y: dataSets.ny_gender_stats.other_percentage, percentage: '${dataSets.ny_gender_stats.other_percentage.toStringAsFixed(1)}%'),
    ];
    return <DoughnutSeries<_GenderData, String>>[
      DoughnutSeries<_GenderData, String>(
        radius: '80%',
        explode: true,
        explodeOffset: '10%',
        dataSource: chartData,
        xValueMapper: (_GenderData data, _) => data.x as String,
        yValueMapper: (_GenderData data, _) => data.y,
        dataLabelMapper: (_GenderData data, _) => data.percentage,
        dataLabelSettings: const DataLabelSettings(isVisible: true)
      )
    ];
  }

}

class _GenderData {
  final String x;
  final num y;
  final String percentage;
  _GenderData({
    required this.x,
    required this.y,
    required this.percentage
  });
}
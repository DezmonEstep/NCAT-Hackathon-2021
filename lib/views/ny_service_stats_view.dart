/// Package import
import 'package:analytics/store/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

class NY_Service_Stats_View extends StatefulWidget {
  const NY_Service_Stats_View({Key? key}) : super(key: key);

  @override
  _NY_Service_Stats_ViewState createState() => _NY_Service_Stats_ViewState();
}

class _NY_Service_Stats_ViewState extends State<NY_Service_Stats_View> {

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
      title: ChartTitle(text: 'New York Health Data'),
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
    // https://r1kdtas447.execute-api.us-west-2.amazonaws.com/prod/
  }

  List<DoughnutSeries<_ServiceData, String>> _getDefaultDoughnutSeries(DataSets dataSets) {
    final List<_ServiceData> chartData = <_ServiceData>[
      _ServiceData(x: 'Infectious Disease', y: dataSets.ny_service_stats.infection_disease, percentage: '${dataSets.ny_service_stats.infection_disease.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Cancer', y: dataSets.ny_service_stats.cancer, percentage: '${dataSets.ny_service_stats.cancer.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Nutrition', y: dataSets.ny_service_stats.nutrition, percentage: '${dataSets.ny_service_stats.nutrition.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Hemorrhage', y: dataSets.ny_service_stats.hemorrhage, percentage: '${dataSets.ny_service_stats.hemorrhage.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Mental', y: dataSets.ny_service_stats.mental, percentage: '${dataSets.ny_service_stats.mental.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Convulsions', y: dataSets.ny_service_stats.convulsions, percentage: '${dataSets.ny_service_stats.convulsions.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Head, Ear and Nose', y: dataSets.ny_service_stats.head_ear_nose, percentage: '${dataSets.ny_service_stats.head_ear_nose.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Chest Complications', y: dataSets.ny_service_stats.chest_complications, percentage: '${dataSets.ny_service_stats.chest_complications.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Blood vessels', y: dataSets.ny_service_stats.veins_blood_vessels, percentage: '${dataSets.ny_service_stats.veins_blood_vessels.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Gastro-Intestinal', y: dataSets.ny_service_stats.gastro_intestinal_complications, percentage: '${dataSets.ny_service_stats.gastro_intestinal_complications.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Organ Failure', y: dataSets.ny_service_stats.organ, percentage: '${dataSets.ny_service_stats.organ.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Female Health', y: dataSets.ny_service_stats.female_health, percentage: '${dataSets.ny_service_stats.female_health.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Skin Complications', y: dataSets.ny_service_stats.skin_conditions, percentage: '${dataSets.ny_service_stats.skin_conditions.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Bone and Muscle', y: dataSets.ny_service_stats.bone_muscle_health, percentage: '${dataSets.ny_service_stats.bone_muscle_health.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Wounds', y: dataSets.ny_service_stats.wounds, percentage: '${dataSets.ny_service_stats.wounds.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Discomfort', y: dataSets.ny_service_stats.discomfort, percentage: '${dataSets.ny_service_stats.discomfort.toStringAsFixed(1)}%'),
      _ServiceData(x: 'Other/Unknown', y: dataSets.ny_service_stats.other, percentage: '${dataSets.ny_service_stats.other.toStringAsFixed(1)}%'),
    ];
    return <DoughnutSeries<_ServiceData, String>>[
      DoughnutSeries<_ServiceData, String>(
          radius: '80%',
          explode: true,
          explodeOffset: '10%',
          dataSource: chartData,
          xValueMapper: (_ServiceData data, _) => data.x as String,
          yValueMapper: (_ServiceData data, _) => data.y,
          dataLabelMapper: (_ServiceData data, _) => data.percentage,
          dataLabelSettings: const DataLabelSettings(isVisible: true)
      )
    ];
  }

}

class _ServiceData {
  final String x;
  final num y;
  final String percentage;
  _ServiceData({
    required this.x,
    required this.y,
    required this.percentage
  });
}
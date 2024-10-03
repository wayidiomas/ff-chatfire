// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class BarChart extends StatefulWidget {
  const BarChart({
    super.key,
    this.width,
    this.height,
    required this.chartaData,
  });

  final double? width;
  final double? height;
  final List<ChartDataStruct> chartaData;

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries<ChartDataStruct, String>>[
            BarSeries<ChartDataStruct, String>(
                dataSource: widget.chartaData,
                xValueMapper: (ChartDataStruct data, _) => data.dayName,
                yValueMapper: (ChartDataStruct data, _) => data.totalWebhooks,
                borderRadius: BorderRadius.all(Radius.circular(4)),
                name: 'Mensagens',
                color: Color.fromRGBO(8, 142, 255, 1))
          ]),
    );
  }
}

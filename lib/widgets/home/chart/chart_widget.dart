import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

final Map<double, double> _data1 = {1: 10, 2: 15, 3: 20, 4: 28, 5: 34, 6: 50};
final Map<double, double> _data2 = {1: 8, 2: 12, 3: 27, 4: 31, 5: 36, 6: 45};

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> spots1 =
        _data1.entries.map((e) => FlSpot(e.key, e.value)).toList();
    final List<FlSpot> spots2 =
        _data2.entries.map((e) => FlSpot(e.key, e.value)).toList();
    final lineChartData = LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: spots1,
          color: Colors.blue,
          barWidth: 8,
          isCurved: false,
          dotData: FlDotData(show: true),
        ),
        LineChartBarData(
          spots: spots2,
          color: Colors.red,
          barWidth: 4,
          isCurved: false,
          dotData: FlDotData(show: true),
        ),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(.8),
        ),
        touchCallback: (_, __) => {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          axisNameWidget: const Text("Дата"),
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (double value, _) =>
                Text(DateFormat.MMM().format(DateTime(2020, value.toInt()))),
          ),
        ),
        leftTitles: AxisTitles(
          axisNameWidget: const Text("Значения"),
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (double value, _) =>
                Text(value.toInt() % 5 == 0 ? "${value.toInt()}" : ""),
          ),
        ),
      ),
    );

    return SizedBox(
      width: double.infinity,
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LineChart(
          lineChartData,
          swapAnimationDuration: const Duration(milliseconds: 150), // Optional
          swapAnimationCurve: Curves.linear, // Optional
        ),
      ),
    );
  }
}

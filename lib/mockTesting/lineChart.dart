import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsTest extends StatefulWidget {
  const AnalyticsTest({super.key});

  @override
  State<AnalyticsTest> createState() => _AnalyticsTestState();
}

class _AnalyticsTestState extends State<AnalyticsTest> {
  @override
  Widget build(BuildContext context) {
    return 
       Center(
        child: SizedBox(
          height: 200,
          // width: 290,
          child: LineChart(
            LineChartData(
              titlesData: FlTitlesData(
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles: AxisTitles(
                    // axisNameWidget: Text("Expenditure"),
                    sideTitles: SideTitles(
                        getTitlesWidget: leftTitleWidgets,
                        reservedSize: 30,
                        interval: 1,
                        showTitles: true)),
                bottomTitles: AxisTitles(
                    // axisNameWidget: Text("Months"),
                    sideTitles: SideTitles(
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: bottomTitleWidgets,
                        showTitles: true)),
              ),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              // read about it in the LineChartData section
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                horizontalInterval: 1,
                verticalInterval: 1,
                getDrawingHorizontalLine: (value) {
                  return const FlLine(
                    color: Colors.grey,
                    strokeWidth: 0.2,
                  );
                },
                getDrawingVerticalLine: (value) {
                  return const FlLine(
                    color: Colors.grey,
                    strokeWidth: 0.2,
                  );
                },
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  left: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey)),
              ),
              minX: 0,
              maxX: 11,
              minY: 0,
              maxY: 6,
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 3),
                    FlSpot(2.6, 2),
                    FlSpot(4.9, 5),
                    FlSpot(6.8, 3.4),
                    FlSpot(8, 4),
                    FlSpot(9.5, 3),
                    FlSpot(11, 4),
                  ],
                  isCurved: true,
                  gradient: LinearGradient(
                    colors: [Colors.cyan, Colors.blue],
                  ),
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(
                    show: false,
                  ),
                  // belowBarData: BarAreaData(
                  //   show: true,
                  //   gradient: LinearGradient(
                  //     colors: [Colors.cyan, Colors.blue]
                  //         .map((color) => color.withOpacity(0.3))
                  //         .toList(),
                  //   ),
                  // ),
                ),
              ],
            ),
            duration: const Duration(milliseconds: 150), // Optional
            curve: Curves.linear, // Optional
          ),
        ),
      );
    
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      // fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      // fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}

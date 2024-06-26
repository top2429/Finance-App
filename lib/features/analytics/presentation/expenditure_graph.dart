import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpenditureGraph extends StatefulWidget {
  final List<FlSpot> expenseSpots;
  const ExpenditureGraph({super.key, required this.expenseSpots});

  @override
  State<ExpenditureGraph> createState() => _AnalyticsTestState();
}

class _AnalyticsTestState extends State<ExpenditureGraph> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                      getTitlesWidget: leftTitleWidgets,
                      reservedSize: 30,
                      interval: 1,
                      showTitles: true)),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: bottomTitleWidgets,
                      showTitles: true)),
            ),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              horizontalInterval: 1,
              verticalInterval: 1,
              getDrawingHorizontalLine: (value) {
                return const FlLine(
                  color: Color.fromARGB(255, 230, 230, 230),
                  strokeWidth: 0.2,
                );
              },
            ),
            borderData: FlBorderData(
              show: false,
              border: const Border(
                  left: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey)),
            ),
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 8,
            lineBarsData: [
              LineChartBarData(
                spots: widget.expenseSpots,
                isCurved: false,
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 220, 218),
                    Colors.red,
                  ],
                ),
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: const FlDotData(
                  show: false,
                ),
              ),
            ],
          ),
          duration: const Duration(milliseconds: 150),
          curve: Curves.linear,
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style =
        TextStyle(fontSize: 12, color: Color.fromARGB(255, 112, 112, 112));
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Jan', style: style);
        break;
      case 2:
        text = const Text('Mar', style: style);
        break;
      case 4:
        text = const Text('May', style: style);
        break;
      case 6:
        text = const Text('Jul', style: style);
        break;
      case 8:
        text = const Text('Sep', style: style);
        break;
      case 10:
        text = const Text('Nov', style: style);
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
    const style =
        TextStyle(fontSize: 12, color: Color.fromARGB(255, 112, 112, 112));
    String text;
    switch (value.toInt()) {
      case 1:
        text = '100K';
        break;
      case 3:
        text = '300k';
        break;
      case 5:
        text = '500k';
        break;
      case 7:
        text = '700k';
        break;

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}

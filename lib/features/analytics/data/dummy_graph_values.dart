import 'package:fl_chart/fl_chart.dart';

final ex = <double>[
  621123,
  283042,
  442989,
  181109,
  372719,
  237109,
  387294,
  467233,
  417219,
  366002,
  149059,
];

final inc = <double>[
  423438,
  666450,
  297015,
  208272,
  360225,
  415822,
  467362,
  416909,
  543021,
  137389,
  622016,
];

List<FlSpot> getExpenditures() {
  return [
    const FlSpot(0, 0),
    FlSpot(1, ex[0] > 800000 ? 8 : ex[0] / 100000),
    FlSpot(2, ex[1] > 800000 ? 8 : ex[1] / 100000),
    FlSpot(3, ex[2] > 800000 ? 8 : ex[2] / 100000),
    FlSpot(4, ex[3] > 800000 ? 8 : ex[3] / 100000),
    FlSpot(5, ex[4] > 800000 ? 8 : ex[4] / 100000),
    FlSpot(6, ex[5] > 800000 ? 8 : ex[5] / 100000),
    FlSpot(7, ex[6] > 800000 ? 8 : ex[6] / 100000),
    FlSpot(8, ex[7] > 800000 ? 8 : ex[7] / 100000),
    FlSpot(9, ex[8] > 800000 ? 8 : ex[8] / 100000),
    FlSpot(10, ex[9] > 800000 ? 8 : ex[9] / 100000),
    FlSpot(11, ex[10] > 800000 ? 8 : ex[10] / 100000),
  ];
}

List<FlSpot> getIncome() {
  return [
   const  FlSpot(0, 0),
    FlSpot(1, inc[0] > 800000 ? 8 : inc[0] / 100000),
    FlSpot(2, inc[1] > 800000 ? 8 : inc[1] / 100000),
    FlSpot(3, inc[2] > 800000 ? 8 : inc[2] / 100000),
    FlSpot(4, inc[3] > 800000 ? 8 : inc[3] / 100000),
    FlSpot(5, inc[4] > 800000 ? 8 : inc[4] / 100000),
    FlSpot(6, inc[5] > 800000 ? 8 : inc[5] / 100000),
    FlSpot(7, inc[6] > 800000 ? 8 : inc[6] / 100000),
    FlSpot(8, inc[7] > 800000 ? 8 : inc[7] / 100000),
    FlSpot(9, inc[8] > 800000 ? 8 : inc[8] / 100000),
    FlSpot(10, inc[9] > 800000 ? 8 : inc[9] / 100000),
    FlSpot(11, inc[10] > 800000 ? 8 : inc[10] / 100000),
  ];
}

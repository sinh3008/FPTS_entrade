
import 'package:fl_chart/fl_chart.dart';

class FakeData {
  List<FlSpot> getChart(int id) {
    if (id == 0) {
      return spots1w;
    } else if (id == 1) {
      return spots1m;
    } else if (id == 2) {
      return spots6m;
    } else if (id == 3) {
      return spots1y;
    } else {
      throw Exception('Failed to load else 2');
    }
  }

  List<FlSpot> spots1w = const [
    FlSpot(0, 6),
    FlSpot(1, 1),
    FlSpot(2, 2),
    FlSpot(3, 9),
    FlSpot(4, 3),
    FlSpot(5, 6),
    FlSpot(6, 9),
    FlSpot(7, 12),
    FlSpot(8, 4),
    FlSpot(9, 1),
    FlSpot(10, 7),
    FlSpot(11, 3),
    FlSpot(12, 7),
  ];

  List<FlSpot> spots1m = const [
    FlSpot(0, 2),
    FlSpot(1, 6),
    FlSpot(2, 2),
    FlSpot(3, 3),
    FlSpot(4, 7),
    FlSpot(5, 9),
    FlSpot(6, 12),
    FlSpot(7, 11),
    FlSpot(8, 3),
    FlSpot(9, 9),
    FlSpot(10, 12),
    FlSpot(11, 3),
    FlSpot(12, 7),
  ];

  List<FlSpot> spots6m = const [
    FlSpot(0, 8),
    FlSpot(1, 12),
    FlSpot(2, 10),
    FlSpot(3, 7),
    FlSpot(4, 9),
    FlSpot(5, 12),
    FlSpot(6, 7),
    FlSpot(7, 6),
    FlSpot(8, 8),
    FlSpot(9, 2),
    FlSpot(10, 12),
    FlSpot(11, 3),
    FlSpot(12, 7),
  ];

  List<FlSpot> spots1y = const [
    FlSpot(0, 6),
    FlSpot(1, 8),
    FlSpot(2, 12),
    FlSpot(3, 9),
    FlSpot(4, 3),
    FlSpot(5, 6),
    FlSpot(6, 5),
    FlSpot(7, 6),
    FlSpot(8, 3),
    FlSpot(9, 4),
    FlSpot(10, 2),
    FlSpot(11, 3),
    FlSpot(12, 7),
  ];

  FakeData();
}



import 'dart:developer';

List<GDPData> getChartData() {
  log("call");
  final List<GDPData> chartData = [
    GDPData(
      continent: "Task compleated",
      taskValue: 20,
    ),
    GDPData(
      continent: "review repeate ",
      taskValue: 10,
    ),
    GDPData(
      continent: "need impovement",
      taskValue: 15,
    ),
    GDPData(
      continent: " not attended",
      taskValue: 5,
    ),
    GDPData(continent: "task not compleated", taskValue: 3),
  ];
  return chartData;
}

class GDPData {
  final String continent;
  final int taskValue;

  GDPData({
    required this.continent,
    required this.taskValue,
  });
}

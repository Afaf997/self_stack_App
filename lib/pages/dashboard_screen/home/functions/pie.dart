import 'dart:developer';

List<GDPData> getChartData(Map<String, dynamic> apiData) {
  log("call");
  log(apiData.toString());

  final List<GDPData> chartData = [];

  apiData['reviewStatusCounts'].forEach((key, value) {
    chartData.add(
      GDPData(
        continent: key,
        taskValue: value,
      ),
    );
  });

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

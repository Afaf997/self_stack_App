

List<GDPData> getChartData(Map<String, dynamic> apiData) {
  final List<GDPData> chartData = [];
  
  // Convert keys to a list and sort them
  List<String> sortedKeys = apiData['reviewStatusCounts'].keys.toList()
    ..sort();

  sortedKeys.forEach((key) {
    String taskValue = apiData['reviewStatusCounts'][key].toString(); // Convert value to string
  

    chartData.add(
      GDPData(
        continent: key,
        taskValue: int.parse(taskValue), // Convert taskValue back to int
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

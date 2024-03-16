

List<GDPData> getChartData(Map<String, dynamic> apiData) {
  final List<GDPData> chartData = [];

if (apiData == null || apiData['reviewStatusCounts'] == null) {
    return chartData;
  }
  
  List<String> sortedKeys = apiData['reviewStatusCounts'].keys.toList()
    ..sort();

  sortedKeys.forEach((key) {
    String taskValue = apiData['reviewStatusCounts'][key].toString(); 
  

    chartData.add(
      GDPData(
        continent: key,
        taskValue: int.parse(taskValue),
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

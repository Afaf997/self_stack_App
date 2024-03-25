
import 'package:self_stack/advisor/services/feedback/get_feedback.dart';

class FeedbackFetcher {
  static Future<dynamic> fetchData() async {
    FeedBackService feedBackService = FeedBackService();
    try {
      dynamic data = await feedBackService.FeedBacktData();
      return data;
    } catch (error) {
      print('Error fetching feedback data: $error');
      throw error;
    }
  }
}

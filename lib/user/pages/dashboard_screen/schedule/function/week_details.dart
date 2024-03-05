
import 'package:self_stack/user/services/week_wise.dart';

final getweekservices getweekService = getweekservices();
    
    Future<Map<String, dynamic>> fetchweekDetails(String userId) async {
    try {
      Map<String, dynamic> userDetails = await getweekService.getweekDetails(userId);
      return userDetails;
    } catch (error) {
      print('Error fetching user details: $error');
      throw Exception("Error fetching user details: $error");
    }
  }
    import 'package:self_stack/services/dashboard_service.dart';

final getLoginservices getloginservices = getLoginservices();

    Future<Map<String, dynamic>> fetchUserDetails(String userId) async {
    try {
      Map<String, dynamic> userDetails =
          await getloginservices.getUserDetails(userId);
      return userDetails;
    } catch (error) {
      print('Error fetching user details: $error');
      throw Exception("Error fetching user details: $error");
    }
  }
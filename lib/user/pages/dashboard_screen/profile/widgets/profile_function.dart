import 'package:self_stack/user/response/dashboard_model.dart';
import 'package:self_stack/user/services/dashboard_service.dart';

final getLoginservices getloginservices = getLoginservices();

Future<Users> fetchprofileDetails(String? userId) async {
  try {
    Map<String, dynamic> userDetails =
        await getloginservices.getUserDetails(userId!);
    // Assuming you have a method to convert the Map to Users object
    return Users.fromJson(userDetails);
  } catch (error) {
    print('Error fetching user details: $error');
    throw Exception("Error fetching user details: $error");
  }
}

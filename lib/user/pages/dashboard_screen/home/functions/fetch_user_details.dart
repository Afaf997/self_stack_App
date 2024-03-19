import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/functions/function_edit.dart';
import 'package:self_stack/user/blocs/dashboard/bloc/dash_board_bloc.dart';

Future<Map<String, dynamic>> fetchUserDetails(String? userId) async {
  if (userId == null) {
    throw Exception("userId is null");
  }
  try {
    Map<String, dynamic> userDetails =
        await getloginservices.getUserDetails(userId);
    dashBoardbloc.add(InitialEvent());
    return userDetails;
  } catch (error) {
    print('Error fetching user details: $error');
    throw Exception("Error fetching user details: $error");
  }
}

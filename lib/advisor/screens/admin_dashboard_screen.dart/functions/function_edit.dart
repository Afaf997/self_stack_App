import 'package:self_stack/user/blocs/dashboard/bloc/dash_board_bloc.dart';
import 'package:self_stack/user/response/dashboard_model.dart';
import 'package:self_stack/user/services/dashboard_service.dart';

final getLoginservices getloginservices = getLoginservices();
DashBoardBloc dashBoardbloc = DashBoardBloc();

Future<User> fetcheditDetails(String? userId) async {
  try {
    Map<String, dynamic> userDetails =
        await getloginservices.getUserDetails(userId!);
    // Assuming you have a method to convert the Map to Users object
    Users users = Users.fromJson(userDetails['user']); // Assuming 'user' contains user details
    // Assuming there is only one User object in the Users list
    return users.user;
  } catch (error) {
    print('Error fetching user details: $error');
    throw Exception("Error fetching user details: $error");
  }
}


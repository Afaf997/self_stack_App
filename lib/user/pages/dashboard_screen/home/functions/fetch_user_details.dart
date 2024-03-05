
import 'package:self_stack/user/blocs/dashboard/bloc/dash_board_bloc.dart';
import 'package:self_stack/user/services/dashboard_service.dart';

final getLoginservices getloginservices = getLoginservices();
   DashBoardBloc dashBoardbloc =DashBoardBloc();
    Future<Map<String, dynamic>> fetchUserDetails(String userId) async {
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
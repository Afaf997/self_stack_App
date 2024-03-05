
import 'package:self_stack/user/response/about_us.dart';
import '../../../../services/about_us_service.dart';

final getAboutUsServices getaboutservices = getAboutUsServices();

Future<AboutUs> fetchAboutDetails() async {
  try {
    Map<String, dynamic> userDetails = await getaboutservices.getAboutUsDetails();
    AboutUs aboutUsDetails = AboutUs.fromJson(userDetails);
    return aboutUsDetails;
  } catch (error) {
    print('Error fetching user details: $error');
    throw Exception("Error fetching user details: $error");
  }
}
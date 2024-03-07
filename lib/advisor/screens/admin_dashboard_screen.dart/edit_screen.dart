import 'package:flutter/material.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/functions/delete_popup.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/fetch_user_details.dart';
import 'package:self_stack/utils/constans.dart';


class EditStudentPage extends StatefulWidget {
  final String userId;

  const EditStudentPage({Key? key, required this.userId}) : super(key: key);

  @override
  _EditStudentPageState createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  Map<String, dynamic>? userDetails;

  @override
  void initState() {
    super.initState();
    loadUserDetails();
  }

  Future<void> loadUserDetails() async {
    try {
      Map<String, dynamic> details = await fetchUserDetails(widget.userId);
      setState(() {
        userDetails = details;
      });
    } catch (error) {
      print('Error fetching user details: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: kselfstackGreen,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Edit Profile',
          style: TextStyle(color: kwhiteModel, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDeleteConfirmationDialog(context);
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: userDetails == null
              ? Center(
                  child: CircularProgressIndicator(
                    color: kselfstackGreen,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextField('Name', initialValue: userDetails!['user']['name']),
                    buildTextField('Age', keyboardType: TextInputType.number, initialValue: userDetails!['user']['age'].toString()),
                    buildTextField('Date of Birth', hintText: 'YYYY-MM-DD', initialValue: userDetails!['user']['dateOfBirth'].toString()),
                    buildTextField('Email', keyboardType: TextInputType.emailAddress, initialValue: userDetails!['user']['email']),
                    buildTextField('Batch', initialValue: userDetails!['user']['batch']),
                    buildTextField('Domain', initialValue: userDetails!['domain']),
                    buildTextField('Gender', initialValue: userDetails!['user']['gender']),
                    buildTextField('Place', initialValue: userDetails!['user']['place']),
                    buildTextField('Address', initialValue: userDetails!['user']['address']),
                    buildTextField('Guardian Name', initialValue: userDetails!['user']['guardian']),
                    buildTextField('Education Qualification', initialValue: userDetails!['user']['educationQualification']),
                    SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add logic to handle the submission
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kselfstackGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        ),
                        child: Text('Submit', style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText,
      {TextInputType? keyboardType, String? hintText, String? initialValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: TextStyle(fontSize: 15, color: Colors.white)),
        SizedBox(height: 5),
        TextFormField(
          style: TextStyle(color: Colors.white),
          keyboardType: keyboardType,
          initialValue: initialValue,
          decoration: InputDecoration(
            hintText: hintText ?? 'Enter $labelText',
            hintStyle: TextStyle(color: Colors.white54),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

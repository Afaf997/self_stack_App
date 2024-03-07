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
  String? selectedBatch;
  String? selectedDomain;

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
        // Set initial values for dropdowns if available
        selectedBatch = userDetails!['user']['batch'];
        selectedDomain = userDetails!['domain'];
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
                    buildDropdownField('Batch', initialValue: selectedBatch, onChanged: (value) => selectedBatch = value, options: ['Option 1', 'Option 2', 'Option 3']), // Replace with your batch options
                    buildDropdownField('Domain', initialValue: selectedDomain, onChanged: (value) => selectedDomain = value, options: ['Option A', 'Option B', 'Option C']), // Replace with your domain options
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

Widget buildDropdownField(String labelText,
    {String? initialValue, required void Function(String?) onChanged, required List<String> options}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelText, style: TextStyle(fontSize: 15, color: Colors.white)),
      SizedBox(height: 5),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.white), // Set border color for the main container
        ),
        child: DropdownButtonFormField<String>(
          value: initialValue,
          dropdownColor: kbackgroundmodel, // Set dropdown background color
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          style: TextStyle(color: Colors.white),
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  color: kbackgroundmodel,
                  child: Text(
                    option,
                    style: TextStyle(color:kselfstackGreen),
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none, // Remove internal borders
          ),
          elevation: 5, // Set the elevation to create a custom shadow
        ),
      ),
      SizedBox(height: 16),
    ],
  );

}

  }

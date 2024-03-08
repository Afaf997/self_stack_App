import 'package:flutter/material.dart';
import 'package:self_stack/advisor/response/batches_model.dart';
import 'package:self_stack/advisor/response/domain_model.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/functions/delete_popup.dart';
import 'package:self_stack/advisor/services/batch_services.dart/domain_service.dart';
import 'package:self_stack/advisor/services/batch_services.dart/get_batch.dart';
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
  late BatchService _batchService;
  late DomainService _domainService;
  late List<String> batchOptions;
  late List<String> domainOptions;

  @override
  void initState() {
    super.initState();
    _batchService = BatchService();
    _domainService = DomainService();
    batchOptions = [];
    domainOptions = [];
    loadUserDetails();
    loadBatchOptions();
    loadDomainOptions();
  }

  Future<void> loadUserDetails() async {
    try {
      Map<String, dynamic> details = await fetchUserDetails(widget.userId);
      setState(() {
        userDetails = details;
        selectedBatch = userDetails!['user']['batch'];
        selectedDomain = userDetails!['domain'];
      });
    } catch (error) {
      print('Error fetching user details: $error');
    }
  }

  Future<void> loadBatchOptions() async {
    try {
      Welcome batchResponse = await _batchService.fetchData();
      setState(() {
        batchOptions = batchResponse.batches.map((batch) => batch.batch.name).toList();
        selectedBatch = userDetails?['user']['batch'];
      });
    } catch (error) {
      print('Error fetching batch options: $error');
    }
  }

  Future<void> loadDomainOptions() async {
    try {
      List<Domainbatch> domainList = await _domainService.DomainfetchData();
      setState(() {
        domainOptions = domainList.map((domain) => domain.courseName).toList();
        selectedDomain = userDetails?['domain'];
      });
    } catch (error) {
      print('Error fetching domain options: $error');
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
                    buildDropdownField('Batch', initialValue: selectedBatch, options: batchOptions, onChanged: (value) {
                      setState(() {
                        selectedBatch = value;
                      });
                    }),
                    buildDropdownField('Domain', initialValue: selectedDomain, options: domainOptions, onChanged: (value) {
                      setState(() {
                        selectedDomain = value;
                      });
                    }),
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
                          // Handle submit button click
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
    {String? initialValue, required List<String> options, required void Function(String?) onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelText, style: TextStyle(fontSize: 15, color: kwhiteModel)),
      SizedBox(height: 5),
      Container(
        decoration: BoxDecoration(
          color: Colors.black, // Set the background color to black
          border: Border.all(color: kwhiteModel),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: kblackDark,
                  value: initialValue,
                  icon: Icon(Icons.arrow_drop_down, color: kwhiteModel),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: kwhiteModel),
                  onChanged: onChanged,
                  items: options.map((String option) {
                    return DropdownMenuItem<String>(    

                      value: option,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          option,
                          style: TextStyle(color: kwhiteModel),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 16),
    ],
  );
}

}

import 'dart:developer';

import 'package:flutter/material.dart';
 // Import BatchPutService
import 'package:self_stack/advisor/response/batches_model.dart';
import 'package:self_stack/advisor/response/domain_model.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/functions/delete_popup.dart';
 // Import BatchService
import 'package:self_stack/advisor/services/batch_services.dart/domain_service.dart';
import 'package:self_stack/advisor/services/batch_services.dart/get_batch.dart';
import 'package:self_stack/advisor/services/batch_services.dart/put_batch.dart';
import 'package:self_stack/user/pages/dashboard_screen/home/functions/fetch_user_details.dart';
import 'package:self_stack/utils/constans.dart';

class EditStudentPage extends StatefulWidget {
  final String userId;

  EditStudentPage({Key? key, required this.userId}) : super(key: key);

  @override
  _EditStudentPageState createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  late BatchPutService _batchPutService; // Declare BatchPutService instance
  late BatchService _batchService; // Declare BatchService instance
  late DomainService _domainService;
  Map<String, dynamic>? userDetails;
  String? selectedBatch;
  String? selectedDomain;
  late List<String> batchOptions;
  late List<String> domainOptions;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _placeController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _guardianNameController = TextEditingController();
  TextEditingController _educationQualificationController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _batchPutService = BatchPutService(); // Initialize BatchPutService
    _batchService = BatchService(); // Initialize BatchService
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

        _nameController.text = userDetails!['user']['name'];
        _idController.text = userDetails!['user']['_id'];
        _ageController.text = userDetails!['user']['age'].toString();
        _dateOfBirthController.text = userDetails!['user']['dateOfBirth'].toString();
        _emailController.text = userDetails!['user']['email'];
        _genderController.text = userDetails!['user']['gender'];
        _placeController.text = userDetails!['user']['place'];
        _addressController.text = userDetails!['user']['address'];
        _guardianNameController.text = userDetails!['user']['guardian'];
        _educationQualificationController.text = userDetails!['user']['educationQualification'];
        _phoneNumberController.text = userDetails!['user']['phone'].toString();
      });
    } catch (error) {
      print('Error fetching user details: $error');
    }
  }

  Future<void> loadBatchOptions() async {
    try {
      Welcome batchResponse = await _batchService.fetchData();
      setState(() {
        Set<String> batchNames = batchResponse.batches.map((batch) => batch.batch.name.toString()).toSet();
        batchOptions = batchNames.toList();
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
        domainOptions = domainList.map((domain) => domain.courseName).toSet().toList();
        selectedDomain = userDetails?['domain'];
       


      });
    } catch (error) {
      print('Error fetching domain options: $error');
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String id = _idController.text;
      String age = _ageController.text;
      String dateOfBirth = _dateOfBirthController.text;
      String email = _emailController.text;
      String gender = _genderController.text;
      String place = _placeController.text;
      String address = _addressController.text;
      String guardianName = _guardianNameController.text;
      String educationQualification = _educationQualificationController.text;
      String phoneNumber = _phoneNumberController.text;
      
      _batchPutService.PutBatchData(id,name,age,dateOfBirth,email,gender,place,address,guardianName,educationQualification,phoneNumber,selectedDomain,selectedBatch)
      .then((response) {
        Navigator.pop(context);
      }).catchError((error) {
        print('Error updating batch data: $error');
      });
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
              : Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextField('Name', controller: _nameController),
                      buildTextField('Age', keyboardType: TextInputType.number, controller: _ageController),
                      buildTextField('Date of Birth', hintText: 'YYYY-MM-DD', controller: _dateOfBirthController),
                      buildTextField('Email', keyboardType: TextInputType.emailAddress, controller: _emailController),
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
                      buildTextField('Gender', controller: _genderController),
                      buildTextField('Place', controller: _placeController),
                      buildTextField('Phone Number', controller: _phoneNumberController),
                      buildTextField('Address', controller: _addressController),
                      buildTextField('Guardian Name', controller: _guardianNameController),
                      buildTextField('Education Qualification', controller: _educationQualificationController),
                      SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleSubmit,
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
      ),
    );
  }

  Widget buildTextField(String labelText,
      {TextInputType? keyboardType, String? hintText, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: TextStyle(fontSize: 15, color: Colors.white)),
        SizedBox(height: 5),
        TextFormField(
          style: TextStyle(color: Colors.white),
          keyboardType: keyboardType,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $labelText';
            }
            return null;
          },
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
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        SizedBox(height: 8),
        if (_formKey.currentState?.validate() ?? false)
          Text(
            'Please enter a valid $labelText',
            style: TextStyle(color: Colors.red, fontSize: 12),
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
            color: Colors.black,
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
        SizedBox(height: 8),
        if (_formKey.currentState?.validate() ?? false)
          Text(
            'Please select a valid $labelText',
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
        SizedBox(height: 16),
      ],
    );
  }
}

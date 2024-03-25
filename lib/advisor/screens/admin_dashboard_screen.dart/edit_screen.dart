import 'package:flutter/material.dart';
import 'package:self_stack/advisor/response/domain.dart';
import 'package:self_stack/advisor/response/domain_model.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/functions/delete_popup.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/functions/validation.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/list_of_students.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/widget/build_textfield.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/widget/dropdown_textfield.dart';
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
  late BatchPutService _batchPutService;
  late BatchService _batchService;
  late DomainService _domainService;
  Map<String, dynamic>? userDetails;
  String? selectedBatch;
  String? selectedDomain;
  late List<String> batchOptions;
  late List<String> batchIDs;
  late List<String> domainOptions;
  late List<String> domainIDs;
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
    _batchPutService = BatchPutService();
    _batchService = BatchService();
    _domainService = DomainService();
    batchOptions = [];
    domainOptions = [];
    loadUserDetails();
    loadBatchOptions();
    loadDomainOptions();
    _ageController.text = '';
  _dateOfBirthController.text = 'YYYY-MM-DD'; 
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
        batchIDs = batchResponse.batches.map((batch) => batch.batch.id.toString()).toSet().toList();
        batchOptions = batchNames.toList();
        selectedBatch = userDetails?['user']['batch'];
      });
    } catch (error) {
      print('Error fetching batch options: $error');
    }
  }

  Future<void> loadDomainOptions() async {
    try {
      List<Domain> domainList = await _domainService.DomainfetchData();
      setState(() {
        domainOptions = domainList.map((domain) => domain.courseName.toString()).toSet().toList();
        domainIDs = domainList.map((domain) => domain.id.toString()).toSet().toList();
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
      String selectedDomainID = domainIDs[domainOptions.indexOf(selectedDomain.toString())];
      String selectedBatchID = batchIDs[batchOptions.indexOf(selectedBatch.toString())];
      _batchPutService
          .PutBatchData(
              id, name, age, dateOfBirth, email, gender, place, address, guardianName, educationQualification, phoneNumber, selectedDomainID, selectedBatchID)
          .then((response) {
        return Navigator.push(context, MaterialPageRoute(builder: (context) => StudentsBatchScreen(index: 0,batchId: selectedBatchID,)));
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
                      buildTextField('Name', controller: _nameController,  validator: FormValidator.nameValidator,formKey: _formKey, ),
                      buildTextField('Age',keyboardType: TextInputType.number,controller: _ageController,validator: FormValidator.ageValidator,formKey: _formKey,),
                      buildTextField('Date of Birth',hintText: 'YYYY-MM-DD',controller: _dateOfBirthController,validator: FormValidator.dateOfBirthValidator,formKey: _formKey,),
                      buildTextField('Email', keyboardType: TextInputType.emailAddress, controller: _emailController, validator: FormValidator.emailValidator,formKey: _formKey, ),
                      buildDropdownField('Batch', initialValue: selectedBatch,formKey: _formKey,options: batchOptions, onChanged: (value) {
                        setState(() {
                          selectedBatch = value;
                        });},),
                      buildDropdownField('Domain', initialValue: selectedDomain, options: domainOptions,formKey: _formKey, onChanged: (value) {
                        setState(() {
                          selectedDomain = value;
                        });
                      }),
                      buildTextField('Gender', controller: _genderController,validator:FormValidator.GenderValidator,formKey: _formKey, ),
                      buildTextField('Place', controller: _placeController,validator: FormValidator.PlaceValidator,formKey: _formKey, ),
                      buildTextField('Phone Number', controller: _phoneNumberController,keyboardType:TextInputType.number, validator:FormValidator.PhoneValidator,formKey: _formKey, ),
                      buildTextField('Address', controller: _addressController, validator:FormValidator.AddressValidator,formKey: _formKey, ),
                      buildTextField('Guardian Name', controller: _guardianNameController,validator:FormValidator.GuardianValidator,formKey: _formKey, ),
                      buildTextField('Education Qualification', controller: _educationQualificationController,validator:FormValidator.EducationValidator,formKey: _formKey, ),
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
}

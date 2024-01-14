import 'package:flutter/material.dart';
import 'package:self_stack/dioservises.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
    TextEditingController _textFieldController = TextEditingController();

      void _handleSubmit() async{
     ApiCall apiCall = ApiCall();
    List<dynamic> apiResponse = await apiCall.fetchAPI();
   

    print("API Response: $apiResponse[0]['sucsess']");
  }

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(labelText: 'Enter Text'),
            ),
            SizedBox(height: 16.0), // Add some spacing
            
            // Submit button
          ElevatedButton(
              onPressed: _handleSubmit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
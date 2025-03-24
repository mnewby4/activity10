import 'package:flutter/material.dart';
import 'second.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text("First"),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              } else if (value.contains(RegExp("[0-9]"))) {
                return 'Please only include letters in your name';
              }
              return null;
            },
          ),
          Text("Last"),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              } else if (value.contains(RegExp("[0-9]"))) {
                return 'Please only include letters in your name';
              }
              return null;
            },
          ),
          Text("Email"),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              } else if (!value.contains("@") || !value.contains(".")) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          Text("Date of Birth"),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {              
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              } else if (!value.contains(RegExp("^[0-9]")) || !value.contains('/')) {
                //if DOES NOT contain only letters + /
                return 'Please enter a valid date';
              }
              return null;
            },
          ),
          Text("Password"),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              } else if (!(value.length >= 6)) {
                return 'Please make your password at least 6 characters long';
              } else if (!value.contains(RegExp("[0-9]")) || !value.contains(RegExp("[A-Za-z]"))) {
                return 'Please include at least 1 number and 1 letter';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () async {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  // Display after the "processing" is completed
                  await Future.delayed(const Duration(seconds: 5));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

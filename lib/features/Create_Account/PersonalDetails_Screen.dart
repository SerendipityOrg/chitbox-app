import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

/*
Imports:
- package:flutter/material.dart: Core Flutter package for building UI.
- package:intl/intl.dart: Used for formatting dates.
- package:flutter/cupertino.dart: Provides Cupertino (iOS-style) widgets.
*/

class PersonalDetailsScreen extends StatefulWidget {
  @override
  _PersonalDetailsScreenState createState() => _PersonalDetailsScreenState();
}

/*
State class for PersonalDetailsScreen
*/
class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  // Controller for the DOB text field to manage the input and display
  TextEditingController dobController = TextEditingController();
  // Variable to store the selected date
  DateTime selectedDate = DateTime.now();

  // Function to show the date picker in a bottom sheet
  Future<void> _selectDate(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).size.height / 3, // Set the height of the bottom sheet
          child: Column(
            children: [
              // Row for the header of the bottom sheet
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Date Picker', style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: Text(
                        DateFormat('MMM dd, yyyy').format(selectedDate), // Display the selected date
                        style: const TextStyle(color: Color(0xFF8551ED), fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 1), // Divider line
              // Expanded widget to hold the CupertinoDatePicker
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: selectedDate, // Set the initial date
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      selectedDate = newDate;
                      dobController.text = DateFormat('dd MMMM, yyyy').format(selectedDate); // Update the controller text
                    });
                  },
                  maximumDate: DateTime.now(), // Set the maximum selectable date to today
                  mode: CupertinoDatePickerMode.date, // Set the mode to date
                ),
              ),
              // Button to close the bottom sheet
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Done'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8551ED), // Button color
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Build method to construct the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        elevation: 0,
      ),
      // SingleChildScrollView to make the form scrollable
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row with an icon and title
            Row(
              children: [
                Image.asset(
                  'assets/logos/account_icon.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Personal ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8551ED),
                        ),
                      ),
                      TextSpan(
                        text: 'Details',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Please provide your personal details to continue.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            // Name input field
            TextFormField(
              key: const Key('nameField'),
              decoration: InputDecoration(
                labelText: 'Name as per Aadhar card',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              ),
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            // DOB input field
            TextFormField(
              key: const Key('dobField'),
              controller: dobController,
              readOnly: true,
              onTap: () => _selectDate(context), // Open the date picker when tapped
              decoration: InputDecoration(
                labelText: 'DOB',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                suffixIcon: const Icon(Icons.calendar_today),
                contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              ),
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            // Email ID input field
            TextFormField(
              key: const Key('emailField'),
              decoration: InputDecoration(
                labelText: 'Email ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                suffixIcon: const Icon(Icons.send, color: Color(0xFF8551ED)),
                contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              ),
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            // OTP input field
            TextFormField(
              key: const Key('otpField'),
              decoration: InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                suffixIcon: const Icon(Icons.check_circle, color: Colors.green),
                contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              ),
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            // Address input field
            TextFormField(
              key: const Key('addressField'),
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Address for communication',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              ),
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),
            // Proceed button
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 200, // Adjust the width as needed
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8551ED), Color(0xFF8E2DE2)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: const Text(
                    'Proceed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



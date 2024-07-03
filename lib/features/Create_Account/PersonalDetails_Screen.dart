import 'package:chitbox_app/features/Create_Account/eKYCVerificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class PersonalDetailsScreen extends StatefulWidget {
  @override
  _PersonalDetailsScreenState createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: const Text('Date Picker', style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        DateFormat('MMM dd, yyyy').format(selectedDate),
                        style: const TextStyle(color: Color(0xFF8551ED), fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 1),
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: selectedDate,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      selectedDate = newDate;
                      dobController.text = DateFormat('dd MMMM, yyyy').format(selectedDate);
                    });
                  },
                  maximumDate: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Done'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8551ED),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/logos/account_icon.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                RichText(
                  text: TextSpan(
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
            _buildTextFormField(nameController, 'Name as per Aadhar card', Icons.person),
             const SizedBox(height: 24),
            _buildTextFormField(dobController, 'DOB', Icons.calendar_today, readOnly: true, onTap: () => _selectDate(context)),
             const SizedBox(height: 24),
            _buildTextFormField(emailController, 'Email ID', Icons.email),
             const SizedBox(height: 24),
            _buildTextFormField(otpController, 'Enter OTP', Icons.lock),
             const SizedBox(height: 24),
            _buildTextFormField(addressController, 'Address for communication', Icons.location_city, maxLines: 3),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Color(0xFF8551ED), Color(0xFF8E2DE2)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => eKYCVerificationScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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

  Widget _buildTextFormField(TextEditingController controller, String label, IconData icon, {int maxLines = 1, bool readOnly = false, VoidCallback? onTap}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: Icon(icon),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      ),
      readOnly: readOnly,
      onTap: onTap,
      maxLines: maxLines,
      style: TextStyle(fontSize: 16, height: 1.5),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:chitbox_app/routes/app_routes.dart';
import 'package:chitbox_app/utils/strings.dart';

import '../widgets/CodeBox.dart';
import '../widgets/CustomButton.dart';
import '../widgets/DescriptionWidget.dart';
import '../widgets/TitleWidget.dart';

class InvitationScreen extends StatefulWidget {
  const InvitationScreen({super.key});

  @override
  _InvitationScreenState createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen> {
  final TextEditingController _codeController1 = TextEditingController();
  final TextEditingController _codeController2 = TextEditingController();
  final TextEditingController _codeController3 = TextEditingController();
  final TextEditingController _codeController4 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  void _nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              TitleWidget(text: AppStrings.welcomeToChitbox),
              const SizedBox(height: 10),
              DescriptionWidget(text: AppStrings.chitboxDescr),
              const SizedBox(height: 30),
              Card(
                color: const Color.fromRGBO(156, 39, 176, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 10,
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      IntlPhoneField(
                        decoration: InputDecoration(
                          labelText: AppStrings.phoneNumberLabel,
                          labelStyle: const TextStyle(color: Colors.white),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        initialCountryCode: 'IN',
                        style: const TextStyle(color: Colors.white),
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                      const SizedBox(height: 25),
                      const DescriptionWidget(
                        text: AppStrings.stepIntoChitbox,
                      ),
                      const SizedBox(height: 20),
                      TitleWidget(
                        text: AppStrings.invitationCode,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CodeBox(
                            controller: _codeController1,
                            currentFocus: _focusNode1,
                            nextFocus: _focusNode2,
                            onChanged: (value) {
                              _nextField(value, _focusNode2);
                            },
                          ),
                          const SizedBox(width: 10),
                          CodeBox(
                            controller: _codeController2,
                            currentFocus: _focusNode2,
                            nextFocus: _focusNode3,
                            onChanged: (value) {
                              _nextField(value, _focusNode3);
                            },
                          ),
                          const SizedBox(width: 10),
                          CodeBox(
                            controller: _codeController3,
                            currentFocus: _focusNode3,
                            nextFocus: _focusNode4,
                            onChanged: (value) {
                              _nextField(value, _focusNode4);
                            },
                          ),
                          const SizedBox(width: 10),
                          CodeBox(
                            controller: _codeController4,
                            currentFocus: _focusNode4,
                            nextFocus: FocusNode(),
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      DescriptionWidget(text: AppStrings.enterInvitationCode),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Center(
                child: SizedBox(
                  width: 200,
                  child: CustomButton(
                    text: AppStrings.continueText,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.personalDetails);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:chitbox_app/features/Create_Account/view/pages/eKYCVerificationScreen.dart';
import 'package:flutter_test/flutter_test.dart';

import 'auth/login_page_test.dart' as login_page_test;
import 'create_account/account_created_screen_test.dart' as account_created_screen_test;
import 'create_account/personal_details_screen_test.dart' as personal_details_screen_test;
import 'widgets/custom_button_test.dart' as custom_button_test;
import 'widgets/title_widget_test.dart' as title_widget_test;
import 'widgets/description_widget_test.dart' as description_widget_test;

void main() {
  group('Auth Tests', () {
    login_page_test.main();
    print('testing ci');
  });

  group('Create Account Tests', () {
    account_created_screen_test.main();
    personal_details_screen_test.main();
      
  });

  group('Widget Tests', () {
    custom_button_test.main();
    title_widget_test.main();
    description_widget_test.main();
  });

  
}

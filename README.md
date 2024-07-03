# ChitBox

## Overview
ChitBox is a digital platform designed to modernize the traditional chit fund process. Our goal is to provide users with a secure, transparent, and user-friendly experience for joining, managing, and participating in chit funds. This project focuses on creating an intuitive app that simplifies the complexities of chit funds, making them accessible and manageable for everyone.

## Vision
ChitBox aims to revolutionize the traditional chit fund industry by leveraging technology to offer a transparent, secure, and efficient platform for users. By focusing on user experience and security, we aspire to build trust and provide a reliable service for all chit fund participants.

For any inquiries, feedback, or support, please reach out to our team at support@chitbox.in.

## Features in Phase One
The initial phase of the ChitBox app includes the following key features:

### User Registration and Authentication
- **Sign Up and Sign In**: Users can create an account or log in using their email or mobile number.
- **OTP Verification**: Two-factor authentication (2FA) via OTP for enhanced security.

### KYC Verification
- **Personal Details**: Users complete KYC by providing personal details and uploading identification documents.
- **Digilocker Integration**: Seamless verification using Digilocker.

### Bank Information
- **Add Bank Details**: Users add and verify their bank details to facilitate transactions.
- **Verification**: Ensure account ownership through verification.

### Chit Fund Management
- **View Chit Funds**: Users can view available chit funds and detailed information about each one.
- **Join Chit Fund**: Option to join a chit fund based on user preference.

### Bidding System
- **Live Auctions**: Users participate in live auctions for chit funds.
- **Automatic Bidding**: Setup for automatic bids during auctions.

### Notifications
- **Real-time Alerts**: Users receive notifications about their bids, payments, and chit fund status.
- **Manage Settings**: Users can manage their notification preferences.

### User Profile Management
- **Edit Profile**: Users can manage and update their personal details and bank information.
- **Notification Settings**: Customize notification settings for a personalized experience.

## Security and Privacy
ChitBox prioritizes the security and privacy of user data through the following measures:
- **Data Encryption**: Encryption of all sensitive data using industry-standard techniques.
- **Secure Authentication**: Implementation of two-factor authentication and secure password protocols.
- **Data Masking**: Masking personal data displayed in the app to prevent unauthorized access.
- **Regular Audits**: Conducting periodic security audits and compliance checks.
- **User Consent**: Ensuring user consent for data collection and usage in compliance with privacy regulations.

## Screenshots
- [Splash Screen](https://github.com/SerendipityOrg/chitbox-app/blob/main/Screenshots/Screen1/Splash_Screen/Splash_Screen_app.jpg?raw=true)

## Recent Progress

### Implemented eKYC Verification Screen
#### UI Design:
- Created a clean and user-friendly interface for the eKYC Verification screen.
- Added fields for PAN and Aadhaar input with real-time validation.
- Implemented green tick icons for valid PAN and Aadhaar inputs.
- Designed a 'Verify & Continue' button that enables only when both PAN and Aadhaar are valid.

#### Validation Logic:
- Added regex validation for PAN (alphanumeric, 10 characters).
- Added regex validation for Aadhaar (numeric, 12 digits).

#### Navigation:
- Implemented navigation to `AccountCreatedScreen` upon successful eKYC verification.

### Account Created Screen
#### UI Design:
- Created a dialog box to display a success message upon account creation and KYC verification.
- Added an image to visually indicate success.
- Included text to confirm account creation and KYC verification.

#### Automatic Redirection:
- Implemented a timer to navigate to the Dashboard screen after a delay.

### Testing
#### Unit Tests:
- Verified AppBar implementation, input fields, and button presence.
- Ensured proper validation logic for PAN and Aadhaar.
- Tested navigation from eKYC Verification Screen to Account Created Screen.

## Future Work
### Integrate with Sethu API:
- Plan to integrate the eKYC process with Sethu API for real-time KYC verification.

For more detailed documentation on the eKYC verification screen development, please visit our [Notion page](https://www.notion.so/eKYC-Verification-Screen-Development-Documentation-b92bda916af54d069ace8537191349d8?pvs=4).

## Getting Started

### Prerequisites
- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/SerendipityOrg/chitbox-app.git
   ```
2. Navigate to the project directory:
   ```sh
   cd chitbox-app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```

### Running the App

1. Run the app on an emulator or connected device:
   ```sh
   flutter run
   ```

### Running Tests

1. Run the unit tests:
   ```sh
   flutter test
   ```

## Contribution
We welcome contributions to enhance the ChitBox project. Please follow the standard GitHub process for contributions:
- Fork the repository
- Create a new branch (`git checkout -b feature/YourFeature`)
- Commit your changes (`git commit -m 'Add some feature'`)
- Push to the branch (`git push origin feature/YourFeature`)
- Create a Pull Request

For any questions or help, please contact support@chitbox.in.

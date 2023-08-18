import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Terms of Service"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 2.0,
          bottom: 4,
          left: 8,
          right: 8,
        ),
        child: ListView(
          children: const [
            Text(
                "Welcome to Kazi Connect! We're excited to have you join our platform. "
                "Before you start using our services, please take a moment to read "
                "through our Terms of Service. These terms outline the rules and guidelines "
                "for using our Android application (\"the App\") and the services provided by "
                "Kazi Connect (\"we,\" \"us,\" or \"our\"). By using our App, you agree to "
                "comply with these terms."),
            SizedBox(height: 8),
            ListTile(
              title: Text("1. Acceptance of Terms"),
              subtitle: Text(
                  "By using Kazi Connect, you agree to abide by these Terms of Service "
                  "and our Privacy Policy. If you do not agree with any part of these "
                  "terms, please refrain from using our App."),
            ),
            ListTile(
              title: Text("2. Description of Service"),
              subtitle: Text(
                  "Kazi Connect is a platform that aims to link users in Kenya with both "
                  "long-term and short-term job opportunities. Our goal is to provide "
                  "a convenient and efficient way for users to discover job openings "
                  "and connect with potential employers. We strive to create a safe "
                  "and user-friendly environment for all users."),
            ),
            ListTile(
              title: Text("3. User Conduct"),
              subtitle: Text(
                  "We expect all users of Kazi Connect to engage in respectful and "
                  "responsible behavior. You agree not to use the App for any illegal, "
                  "unethical, or harmful activities. You also agree not to share false "
                  "or misleading information in your profile or job listings."),
            ),
            ListTile(
              title: Text("4. Data Privacy and Security"),
              subtitle: Text(
                  "We are committed to safeguarding your data and privacy. While using "
                  "the App, you may share personal and sensitive information. Please "
                  "be cautious and responsible when sharing such information. We "
                  "encourage you to review our Privacy Policy to understand how "
                  "we collect, use, and protect your data."),
            ),
            ListTile(
              title: Text("5. Intellectual Property"),
              subtitle: Text(
                  "All content and materials available on Kazi Connect, including but "
                  "not limited to text, graphics, logos, images, and software, "
                  "are the property of Kazi Connect or its licensors. You may "
                  "not use, modify, reproduce, or distribute any of our intellectual "
                  "property without our explicit permission."),
            ),
            ListTile(
              title: Text("6. Appropriate Use"),
              subtitle: Text(
                  "You agree to use the App only for its intended purpose – connecting "
                  "users with job opportunities. You will not engage in any activities "
                  "that could disrupt or harm the functionality of the App or its users."),
            ),
            ListTile(
              title: Text("7. Changes to the App and Terms"),
              subtitle: Text(
                  "We may update the App and these Terms of Service from time to time to "
                  "improve our services and stay compliant with regulations. We will "
                  "notify you of any significant changes, and it is your responsibility "
                  "to review and understand the updated terms."),
            ),
            ListTile(
              title: Text("8. Disclaimer of Warranties"),
              subtitle: Text(
                  "Kazi Connect is provided on an \"as is\" and \"as available\" basis. "
                  "While we strive to offer a reliable service, we do not make any "
                  "warranties or guarantees regarding the accuracy, reliability, "
                  "availability, or suitability of the App for your specific needs."),
            ),
            ListTile(
              title: Text("9. Limitation of Liability"),
              subtitle: Text(
                  "To the extent permitted by law, Kazi Connect shall not be liable for any direct, "
                  "indirect, incidental, special, or consequential damages arising out of or in "
                  "any way connected with your use of the App."),
            ),
            ListTile(
              title: Text("10. Governing Law"),
              subtitle: Text(
                  "These Terms of Service are governed by and construed in accordance with the "
                  "laws of Kenya. Any legal disputes shall be settled in the appropriate courts of Kenya."),
            ),
            SizedBox(height: 8),
            Text("Thank you for using Kazi Connect! We look forward to helping "
                "you discover exciting job opportunities in Kenya.")
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class TermsAndConditionsBodyWidget extends StatelessWidget {
  const TermsAndConditionsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header Section
          Text(
            "All Term and Condition",
            style: TTextTheme.h1StyleBlack(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Please read these terms carefully before using our website and services.",
            style: TTextTheme.bodyRegular16black(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          // 1. Website Usage Disclaimer
          _buildPolicyCard(
            context,
            title: "1. Website Usage Disclaimer",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "This website is intended for information and display purposes only."),
                _buildBulletPoint(context, "Users cannot book or reserve vehicles directly through the website."),
                _buildBulletPoint(context, "All bookings must be made through official communication channels such as phone, WhatsApp, or in person."),
                _buildBulletPoint(context, "Vehicle availability, pricing, and details shown on the website are subject to confirmation."),
                _buildBulletPoint(context, "Listings on the website do not constitute a confirmed offer or contract."),
              ],
            ),
          ),

          // 2. Eligibility
          _buildPolicyCard(
            context,
            title: "2. Eligibility",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Renters must meet the minimum age requirement (e.g., 21 years or above)."),
                _buildBulletPoint(context, "A valid driving license and identification (CNIC/Passport) are required."),
                _buildBulletPoint(context, "The company reserves the right to refuse service if requirements are not met."),
              ],
            ),
          ),

          // 3. Booking & Confirmation
          _buildPolicyCard(
            context,
            title: "3. Booking & Confirmation",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Bookings are only confirmed after direct communication and approval by the company."),
                _buildBulletPoint(context, "Availability of vehicles is not guaranteed until confirmation is provided."),
                _buildBulletPoint(context, "The company reserves the right to accept or reject any booking request."),
              ],
            ),
          ),

          // 4. Payments
          _buildPolicyCard(
            context,
            title: "4. Payments",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Payment details will be shared after booking confirmation."),
                _buildBulletPoint(context, "Payments must be completed within the specified time to secure the booking."),
                _buildBulletPoint(context, "Failure to complete payment may result in cancellation of the request."),
              ],
            ),
          ),

          // 5. Security Deposit
          _buildPolicyCard(
            context,
            title: "5. Security Deposit",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "A refundable security deposit may be required before vehicle handover."),
                _buildBulletPoint(context, "The deposit will be returned after inspection of the vehicle."),
                _buildBulletPoint(context, "Deductions may apply for damages, late returns, or violations."),
              ],
            ),
          ),

          // 6. Vehicle Usage
          _buildPolicyCard(
            context,
            title: "6. Vehicle Usage",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Vehicles must only be driven by the authorized person."),
                _buildBulletPoint(context, "Sub-renting or unauthorized use is strictly prohibited."),
                _buildBulletPoint(context, "Vehicles must not be used for illegal activities, racing, or unsafe driving."),
              ],
            ),
          ),

          // 7. Rental Duration & Return
          _buildPolicyCard(
            context,
            title: "7. Rental Duration & Return",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Vehicles must be returned on the agreed date and time."),
                _buildBulletPoint(context, "Late returns may result in additional charges."),
                _buildBulletPoint(context, "Extensions must be requested in advance and are subject to availability."),
              ],
            ),
          ),

          // 8. Fuel Policy
          _buildPolicyCard(
            context,
            title: "8. Fuel Policy",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Vehicles must be returned with the same fuel level as provided."),
                _buildBulletPoint(context, "Additional charges may apply if the fuel level is lower upon return."),
              ],
            ),
          ),

          // 9. Insurance & Liability
          _buildPolicyCard(
            context,
            title: "9. Insurance & Liability",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Basic insurance may be included where applicable."),
                _buildBulletPoint(context, "The renter is responsible for damages not covered by insurance."),
                _buildBulletPoint(context, "The company is not responsible for personal belongings left in the vehicle."),
              ],
            ),
          ),

          // 10. Traffic Fines & Violations
          _buildPolicyCard(
            context,
            title: "10. Traffic Fines & Violations",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "The renter is responsible for all traffic fines and violations during the rental period."),
                _buildBulletPoint(context, "Any fines reported after the rental may still be charged to the renter."),
              ],
            ),
          ),

          // 11. Vehicle Condition
          _buildPolicyCard(
            context,
            title: "11. Vehicle Condition",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "The vehicle must be returned in the same condition as received."),
                _buildBulletPoint(context, "Charges may apply for damages, excessive dirt, or missing items."),
              ],
            ),
          ),

          // 12. Cancellation Policy
          _buildPolicyCard(
            context,
            title: "12. Cancellation Policy",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Cancellation terms will be communicated during the booking process."),
                _buildBulletPoint(context, "No refunds may be issued for no-shows or unused rental time unless stated otherwise."),
              ],
            ),
          ),

          // 13. Limitation of Liability
          _buildPolicyCard(
            context,
            title: "13. Limitation of Liability",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "The company shall not be liable for any indirect or consequential damages."),
                _buildBulletPoint(context, "Use of the vehicle is at the renter's own risk, within legal limits."),
              ],
            ),
          ),

          // 14. Privacy
          _buildPolicyCard(
            context,
            title: "14. Privacy",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Customer information will be handled securely and used only for service purposes."),
                _buildBulletPoint(context, "Information will not be shared with third parties without consent, except where required by law."),
              ],
            ),
          ),

          // 15. Company Rights
          _buildPolicyCard(
            context,
            title: "15. Company Rights",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("We reserve the right to:", style: _bodyStyle(context)),
                const SizedBox(height: 8),
                _buildBulletPoint(context, "Refuse or cancel any booking request"),
                _buildBulletPoint(context, "Update pricing, policies, or terms at any time"),
                _buildBulletPoint(context, "Take action in case of misuse or violation of terms"),
              ],
            ),
          ),

          // 16. Contact Information
          _buildPolicyCard(
            context,
            title: "16. Contact Information",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("For any questions or booking inquiries:", style: _bodyStyle(context)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.phone, color: AppColors.primaryColor, size: 18),
                    const SizedBox(width: 8),
                    _buildRedTitleText(context, "Phone: "),
                    Text(" +16423452134", style: _bodyStyle(context)),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.email, color: AppColors.primaryColor, size: 18),
                    const SizedBox(width: 8),
                    _buildRedTitleText(context, "Email: "),
                    Text(" (softsnip@gmail.com)", style: _bodyStyle(context)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// --------- Extra Components Helper Widgets ------- ///

  // Policy Card Wrapper
  Widget _buildPolicyCard(BuildContext context, {required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TTextTheme.h5Style(context),
          ),
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }

  // Red Circular Bullet Point Item
  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, right: 10),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: _bodyStyle(context),
            ),
          ),
        ],
      ),
    );
  }

  // Red Inline Highlight Labels
  Widget _buildRedTitleText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: TTextTheme.h2PrimaryStyle(context),
      ),
    );
  }

  // Consistent Typography Body Font
  TextStyle _bodyStyle(BuildContext context) {
    return TTextTheme.tableRegular18(context);
  }
}
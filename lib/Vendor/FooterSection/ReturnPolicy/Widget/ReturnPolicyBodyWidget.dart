import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class ReturnPolicyBodyWidget extends StatelessWidget {
  const ReturnPolicyBodyWidget({super.key});

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
          Text(
            "Rental Rules & Guidelines",
            style: TTextTheme.h1StyleBlack(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Clear guidelines on booking, vehicle usage, returns, and additional charges to ensure a smooth rental experience.",
            style: TTextTheme.bodyRegular16black(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          // 1. Booking Cancellation
          _buildPolicyCard(
            context,
            title: "1. Booking Cancellation",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("You may cancel your booking at any time before the scheduled pickup.", style: _bodyStyle(context)),
                const SizedBox(height: 12),
                _buildRedTitleText(context, "1. Free Cancellation:"),
                _buildBulletPoint(context, "Cancellations made 24 hours before pickup are eligible for a full refund."),
                const SizedBox(height: 8),
                _buildRedTitleText(context, "2. Late Cancellation:"),
                _buildBulletPoint(context, "Cancellations made within 24 hours of pickup may incur a cancellation fee."),
                const SizedBox(height: 8),
                _buildRedTitleText(context, "3. No-Show Policy:"),
                _buildBulletPoint(context, "If you fail to pick up the vehicle without prior notice, the booking will be treated as a no-show and no refund will be issued."),
              ],
            ),
          ),

          // 2. Refund Policy
          _buildPolicyCard(
            context,
            title: "2. Refund Policy",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Refunds are processed within 5 to 7 business days."),
                _buildBulletPoint(context, "The amount will be returned using the original payment method."),
                _buildBulletPoint(context, "Any applicable service charges or taxes may be deducted."),
              ],
            ),
          ),

          // 3. Vehicle Pickup
          _buildPolicyCard(
            context,
            title: "3. Vehicle Pickup",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Customers must arrive on time with valid documents."),
                _buildBulletPoint(context, "Failure to meet requirements may result in cancellation without refund."),
              ],
            ),
          ),

          // 4. Vehicle Return Policy
          _buildPolicyCard(
            context,
            title: "4. Vehicle Return Policy",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Vehicles must be returned on the agreed date and time."),
                _buildBulletPoint(context, "A grace period of 1 hour may be allowed (optional—your choice)."),
                const SizedBox(height: 10),
                _buildRedTitleText(context, "Late Returns:"),
                Text("Additional charges will apply for late returns, calculated on an hourly or daily basis.", style: _bodyStyle(context)),
              ],
            ),
          ),

          // 5. Early Returns
          _buildPolicyCard(
            context,
            title: "5. Early Returns",
            child: _buildBulletPoint(context, "If you return the vehicle earlier than scheduled, no refund will be provided for unused rental time."),
          ),

          // 6. Fuel Policy
          _buildPolicyCard(
            context,
            title: "6. Fuel Policy",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRedTitleText(context, "Choose one:"),
                _buildBulletPoint(context, "Same-to-Same: Vehicle must be returned with the same fuel level as at pickup."),
                _buildBulletPoint(context, "Fuel charges will apply if the level is lower upon return."),
              ],
            ),
          ),

          // 7. Vehicle Condition
          _buildPolicyCard(
            context,
            title: "7. Vehicle Condition",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "The vehicle must be returned in the same condition as received."),
                _buildBulletPoint(context, "Any damages, excessive dirt, or missing items will result in additional charges."),
              ],
            ),
          ),

          // 8. Extensions
          _buildPolicyCard(
            context,
            title: "8. Extensions",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Rental extensions are subject to availability."),
                _buildBulletPoint(context, "You must request an extension before your rental period ends."),
              ],
            ),
          ),

          // 9. Driver Requirements
          _buildPolicyCard(
            context,
            title: "9. Driver Requirements",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Minimum age: 21 years (adjust if needed)."),
                _buildBulletPoint(context, "You must hold a valid driving license required to request an extension before your rental period ends."),
                _buildBulletPoint(context, "Valid ID (CNIC/Passport for international renters)."),
              ],
            ),
          ),

          // 10. Security Deposit
          _buildPolicyCard(
            context,
            title: "10. Security Deposit",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "A refundable security deposit is required at pickup; must be returned on the agreed date and time."),
                _buildBulletPoint(context, "Refunded after inspection (usually within 3–7 days)."),
                const SizedBox(height: 10),
                _buildRedTitleText(context, "Deductions may apply for:"),
                _buildNumberedPoint(context, "1", "Damages"),
                _buildNumberedPoint(context, "2", "Late returns"),
                _buildNumberedPoint(context, "3", "Traffic fines"),
              ],
            ),
          ),

          // 11. Pricing & Payment Terms
          _buildPolicyCard(
            context,
            title: "11. Pricing & Payment Terms",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Payment required in advance or at pickup."),
                _buildBulletPoint(context, "Accepted methods: Cash / Card / Online."),
                _buildBulletPoint(context, "Prices may vary based on duration and vehicle type."),
              ],
            ),
          ),

          // 12. Mileage / Usage Policy
          _buildPolicyCard(
            context,
            title: "12. Mileage / Usage Policy",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Daily mileage limit (e.g., 100–200 km/day) OR unlimited."),
                _buildBulletPoint(context, "Extra km will be charged accordingly."),
              ],
            ),
          ),

          // 13. Insurance Coverage
          _buildPolicyCard(
            context,
            title: "13. Insurance Coverage",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Basic insurance is included."),
                const SizedBox(height: 10),
                _buildRedTitleText(context, "Does not cover:"),
                _buildNumberedPoint(context, "1", "Negligence"),
                _buildNumberedPoint(context, "2", "Reckless driving"),
                _buildNumberedPoint(context, "3", "Unauthorized use"),
              ],
            ),
          ),

          // 14. Vehicle Usage Rules
          _buildPolicyCard(
            context,
            title: "14. Vehicle Usage Rules",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "No illegal activities."),
                _buildBulletPoint(context, "No sub-renting."),
                _buildBulletPoint(context, "Out-of-city travel may require approval."),
              ],
            ),
          ),

          // 15. Traffic Fines & Violations
          _buildPolicyCard(
            context,
            title: "15. Traffic Fines & Violations",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Renter is responsible for all fines."),
                _buildBulletPoint(context, "Charges may be deducted later if reported after rental."),
              ],
            ),
          ),

          // 16. Breakdown & Emergency Support
          _buildPolicyCard(
            context,
            title: "16. Breakdown & Emergency Support",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Contact support in case of breakdown."),
                _buildBulletPoint(context, "Assistance will be provided based on situation."),
              ],
            ),
          ),

          // 17. Cleaning Policy
          _buildPolicyCard(
            context,
            title: "17. Cleaning Policy",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, "Return vehicle in clean condition."),
                _buildBulletPoint(context, "Extra cleaning charges may apply if excessively dirty."),
              ],
            ),
          ),

          // 18. Emergency & Support
          _buildPolicyCard(
            context,
            title: "18. Emergency & Support",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("If you experience delays or issues, contact our support team immediately:", style: _bodyStyle(context)),
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

          // 19. Company Rights
          _buildPolicyCard(
            context,
            title: "19. Company Rights",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("We reserve the right to:", style: _bodyStyle(context)),
                const SizedBox(height: 8),
                _buildBulletPoint(context, "Cancel bookings due to unforeseen circumstances."),
                _buildBulletPoint(context, "Modify this policy at any time without prior notice."),
              ],
            ),
          ),
        ],
      ),
    );
  }

   /// --------- Extra Widget ------- ///

  // policy Card
  Widget _buildPolicyCard(BuildContext context, {required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TTextTheme.h5Style(context)
          ),
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }

   // Bullet Point
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

   // Numbered Point
  Widget _buildNumberedPoint(BuildContext context, String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
      child: Text(
        "$number: $text",
        style: _bodyStyle(context).copyWith(color: Colors.grey[700]),
      ),
    );
  }

  Widget _buildRedTitleText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: TTextTheme.h2PrimaryStyle(context)
      ),
    );
  }

  TextStyle _bodyStyle(BuildContext context) {
    return TTextTheme.tableRegular18(context);
  }
}
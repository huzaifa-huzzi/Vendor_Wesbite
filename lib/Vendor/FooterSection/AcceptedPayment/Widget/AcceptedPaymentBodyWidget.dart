import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class AcceptedPaymentBodyWidget extends StatelessWidget {
  const AcceptedPaymentBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobileOrTablet = screenWidth < 900;
    final double cardWidth = isMobileOrTablet ? double.infinity : (screenWidth - AppSizes.horizontalPadding(context) * 2 - 20) / 2;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Accepted Payment Methods",
            style: TTextTheme.h1StyleBlack(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Choose a convenient and secure way to complete your payment.",
            style: TTextTheme.bodyRegular16black(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          _buildMainSectionHeader(context, "Payment by Bank Account", "Below are the instruction how to pay"),
          const SizedBox(height: 15),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _buildInstructionCard(
                context,
                width: cardWidth,
                title: "Payment Instruction for bank",
                subtitle: "Below are payment instruction details",
                points: [
                  "1. Open your banking app and select PayID Transfer.",
                  "2. Enter the PayID email provided by the rental company.",
                  "3. Confirm the account name.",
                  "4. Enter the payment amount.",
                  "5. Send the payment.",
                ],
              ),
              // Bank Account Receipt Card
              _buildInstructionCard(
                context,
                width: cardWidth,
                title: "How to Upload your Payment receipt",
                subtitle: "Below are details for how to upload payment receipt",
                points: [
                  "1. Make the payment using the bank details above.",
                  "2. Upload the payment receipt or transaction screenshot.",
                  "3. Ensure the transaction ID and amount are clearly visible.",
                  "4. Your payment will be verified by the admin.",
                ],
              ),
            ],
          ),

          const SizedBox(height: 40),
          _buildMainSectionHeader(context, "Payment by Pay Id", "Below are the instruction how to pay"),
          const SizedBox(height: 15),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              // Pay ID Instruction Card
              _buildInstructionCard(
                context,
                width: cardWidth,
                title: "Payment Instruction for Pay Id",
                subtitle: "Below are payment instruction details",
                points: [
                  "1. Open your banking app and select PayID Transfer.",
                  "2. Enter the PayID email provided by the rental company.",
                  "3. Confirm the account name.",
                  "4. Enter the payment amount.",
                  "5. Send the payment.",
                ],
              ),
              // Pay ID Receipt Card
              _buildInstructionCard(
                context,
                width: cardWidth,
                title: "How to Upload your Payment receipt",
                subtitle: "Below are details for how to upload payment receipt",
                points: [
                  "1. Make the payment using the bank details above.",
                  "2. Upload the payment receipt or transaction screenshot.",
                  "3. Ensure the transaction ID and amount are clearly visible.",
                  "4. Your payment will be verified by the admin.",
                ],
              ),
            ],
          ),

          const SizedBox(height: 60),
          Text(
            "Payment Notes & Guidelines",
            style: TTextTheme.h1StyleBlack(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Important information to ensure a smooth and secure payment process.",
            style: TTextTheme.bodyRegular16black(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          // Main Notes Container Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Follow these steps to complete your payment securely and ensure quick verification.",
                  style: TTextTheme.h5Style(context),
                ),
                const SizedBox(height: 15),
                _buildBulletPoint(context, "Complete your payment within the given time to avoid automatic cancellation of your booking."),
                _buildBulletPoint(context, "Always use your Booking ID or Payment Reference when making a payment so we can easily track and verify your transaction."),
                _buildBulletPoint(context, "Ensure that you transfer the exact amount mentioned in your booking details to prevent delays or issues in confirmation."),
                _buildBulletPoint(context, "After completing the payment, keep a screenshot or receipt as proof for your records and possible verification."),
                _buildBulletPoint(context, "If required, upload your payment proof or provide the transaction ID through the system for faster processing."),
                _buildBulletPoint(context, "Double-check all payment details before confirming the transaction to avoid sending funds to an incorrect account."),
                _buildBulletPoint(context, "Do not share your payment confirmation or sensitive information with unauthorized individuals to maintain security."),
                _buildBulletPoint(context, "In case of any delay, error, or confusion during payment, contact our support team immediately for assistance."),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// --------- Extra Helper Widgets ------- ///

  // Main Section Container Header
  Widget _buildMainSectionHeader(BuildContext context, String title, String subtitle) {
    return Container(
      width: double.infinity,
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
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  // Side-by-Side Sub Instruction Card
  Widget _buildInstructionCard(
      BuildContext context, {
        required double width,
        required String title,
        required String subtitle,
        required List<String> points,
      }) {
    return Container(
      width: width,
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
            style: TTextTheme.h2PrimaryStyle(context),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TTextTheme.tableRegular18(context).copyWith(fontSize: 13, color: Colors.grey[500]),
          ),
          const SizedBox(height: 20),
          ...points.map((point) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              point,
              style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, height: 1.4),
            ),
          )),
        ],
      ),
    );
  }

  // Bullet Point
  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
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
              style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
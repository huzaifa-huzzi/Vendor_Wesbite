import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';


class FAQSection3 extends StatelessWidget {
  const FAQSection3({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 900;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: width > 1200 ? 100 : 20),
      color: AppColors.backgroundOfScreenColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isMobile) ...[
            _buildFAQCategory(context, TextString.driverSafety, driverSafetyFaqs),
            const SizedBox(height: 40),
            _buildFAQCategory(context, TextString.rentalPolicy, rentalPolicyFaqs),
          ] else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildFAQCategory(context, TextString.driverSafety, driverSafetyFaqs)),
                const SizedBox(width: 60),
                Expanded(child: _buildFAQCategory(context, TextString.rentalPolicy, rentalPolicyFaqs)),
              ],
            ),
        ],
      ),
    );
  }

   /// -------Extra Widget ------ ///
  // Faq Category
  Widget _buildFAQCategory(BuildContext context, String title, List<Map<String, String>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TTextTheme.h1StyleBlack(context),
        ),
        const SizedBox(height: 30),
        Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: data
                .asMap()
                .entries
                .map((entry) {
              int index = entry.key;
              Map<String, String> faq = entry.value;
              bool isLast = index == data.length - 1;

              return FAQTile(
                faq: faq,
                showDivider: !isLast,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}



class FAQTile extends StatefulWidget {
  final Map<String, String> faq;
  final bool showDivider;

  const FAQTile({
    super.key,
    required this.faq,
    this.showDivider = true,
  });

  @override
  State<FAQTile> createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: widget.showDivider
            ? Border(bottom: BorderSide(color: AppColors.quadrantalTextColor.withOpacity(0.7)))
            : null,
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (value) {
            setState(() {
              _isExpanded = value;
            });
          },
          title: Text(
            widget.faq['question']!,
            style: TTextTheme.h5Style(context),
          ),
          trailing: Icon(
            _isExpanded ? Icons.remove : Icons.add,
            color: AppColors.primaryColor,
            size: 26,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: Text(
                widget.faq['answer']!,
                style: TTextTheme.bodyRegular16Table(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


final List<Map<String, String>> driverSafetyFaqs = [
  {
    "question": "Do you provide drivers with cars?",
    "answer": "Yes, we provide cars with professional drivers on request. Our drivers are experienced, verified, and familiar with local routes to ensure a safe and comfortable journey. You can choose a self-drive option or hire a driver depending on your preference and requirements."
  },
  {"question": "What happens in case of an accident?", "answer": "In case of an accident, please inform our support team immediately. We will guide you through the insurance and repair process."},
  {"question": "Are your vehicles insured?", "answer": "Yes, all our vehicles are fully insured to ensure safety for both the car and the client."},
  {"question": "Are your drivers verified and experienced?", "answer": "Absolutely. All our drivers go through a strict background check and have years of professional driving experience."},
];

final List<Map<String, String>> rentalPolicyFaqs = [
  {"question": "What is your fuel policy?", "answer": "We provide cars with a full tank, and we expect them to be returned with a full tank. Otherwise, fuel charges will apply."},
  {"question": "What happens if I return the car late?", "answer": "A late return fee may be charged if the car is returned after the agreed time without prior notice."},
  {"question": "Is there a mileage limit?", "answer": "Depending on the package you choose, there may be a daily mileage limit or an unlimited mileage option."},
  {
    "question": "Can I take the car outside the city?",
    "answer": "Yes, you can take the car outside the city; however, it depends on the rental terms and vehicle availability. You must inform us in advance before taking the car out of city limits so we can confirm permission and provide the necessary approval. Additional charges or conditions may apply for long-distance travel."
  },
];
import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';


class FAQSection4 extends StatelessWidget {
  const FAQSection4({super.key});

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
            _buildFAQCategory(context, TextString.carService, carServiceFaqs),
            const SizedBox(height: 40),
            _buildFAQCategory(context, TextString.supportandContact, supportContactFaqs),
          ] else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildFAQCategory(context, TextString.carService, carServiceFaqs)),
                const SizedBox(width: 60),
                Expanded(child: _buildFAQCategory(context, TextString.supportandContact, supportContactFaqs)),
              ],
            ),
        ],
      ),
    );
  }

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
            children: data.asMap().entries.map((entry) {
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
final List<Map<String, String>> carServiceFaqs = [
  {
    "question": "Do you provide drivers with cars?",
    "answer": "Yes, we provide cars with professional drivers on request. Our drivers are experienced, verified, and familiar with local routes to ensure a safe and comfortable journey. You can choose a self-drive option or hire a driver depending on your preference and requirements."
  },
  {"question": "What happens in case of an accident?", "answer": "In case of an accident, please contact our support team immediately. We provide assistance and handle insurance procedures according to our policy."},
  {"question": "Are your vehicles insured?", "answer": "Yes, all our vehicles are fully insured to protect our clients and the fleet in case of any unforeseen incidents."},
  {"question": "Are your drivers verified and experienced?", "answer": "Yes, all our drivers undergo thorough background checks and have significant professional experience in driving."},
];
final List<Map<String, String>> supportContactFaqs = [
  {"question": "How can i contact you?", "answer": "You can contact us via our helpline number, email, or by visiting our office directly."},
  {"question": "Can i call before visiting?", "answer": "Yes, we encourage you to call our representative to check vehicle availability and booking details before your visit."},
  {
    "question": "Do you provide emergency support?",
    "answer": "Yes, we provide emergency support to assist you during your rental period. If you face any issue such as a breakdown or technical problem, you can contact us immediately, and our team will guide you or arrange the necessary assistance as quickly as possible."
  },
];
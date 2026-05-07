import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

import '../../../Resources/TextString.dart' show TextString;

class FAQSection1 extends StatelessWidget {
  const FAQSection1({super.key});

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
            _buildFAQCategory(context,TextString.aboutOurService, serviceFaqs),
            const SizedBox(height: 40),
            _buildFAQCategory(context,TextString.bookingProcess, bookingFaqs),
          ] else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildFAQCategory(context,TextString.aboutOurService, serviceFaqs)),
                const SizedBox(width: 60),
                Expanded(child: _buildFAQCategory(context,TextString.bookingProcess, bookingFaqs)),
              ],
            ),
        ],
      ),
    );
  }

   /// -------- Extra Widget --------- ///
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

 // Faq tile Class
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

final List<Map<String, String>> serviceFaqs = [
  {"question": "What services do you offer?", "answer": "We offer reliable car rental and vehicle services to make your travel easy and convenient. Customers can visit our office to choose from a variety of well-maintained vehicles."},
  {"question": "Do you provide online booking?", "answer": "Yes, we provide a seamless online booking experience through our web portal."},
  {"question": "Where is your office located?", "answer": "Our main office is located in the central business district for easy access."},
  {"question": "What are your working hours?", "answer": "We are open 24/7 to assist you with your rental needs."},
];

final List<Map<String, String>> bookingFaqs = [
  {"question": "How can I rent a car?", "answer": "Select your car, provide details, and confirm your booking online or in person."},
  {"question": "Do I need to visit your office?", "answer": "Not necessarily, you can complete the entire process online."},
  {"question": "Can I reserve a car in advance?", "answer": "Yes, we recommend booking at least 24 hours in advance."},
  {"question": "How long does the booking process take?", "answer": "It usually takes less than 5 minutes to complete your booking."},
];
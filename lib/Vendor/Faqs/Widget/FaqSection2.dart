import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';


class FAQSection2 extends StatelessWidget {
  const FAQSection2({super.key});

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
            _buildFAQCategory(context, TextString.carRequirment, requirementFaqs),
            const SizedBox(height: 40),
            _buildFAQCategory(context,TextString.pricingAndPayment, pricingFaqs),
          ] else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildFAQCategory(context, TextString.carRequirment, requirementFaqs)),
                const SizedBox(width: 60),
                Expanded(child: _buildFAQCategory(context, TextString.pricingAndPayment, pricingFaqs)),
              ],
            ),
        ],
      ),
    );
  }

  /// ---------Extra Widgets -------- ///

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

final List<Map<String, String>> requirementFaqs = [
  {
    "question": "What documents are required to rent a car?",
    "answer": "To rent a car, you need to provide some basic verification documents: \n• A valid CNIC / National ID card (original)\n• A valid driving license\n• A copy of your CNIC for record\n• Sometimes a security deposit may also be required."
  },
  {"question": "Do I need a driving license?", "answer": "Yes, a valid driving license is mandatory if you are driving the car yourself."},
  {"question": "What types of cars are available?", "answer": "We have a variety of well-maintained vehicles including economy, luxury, and family cars."},
  {"question": "Can I choose a specific car?", "answer": "Yes, you can choose from our available fleet during the booking process."},
];

final List<Map<String, String>> pricingFaqs = [
  {"question": "What are your rental rates?", "answer": "Our rates vary depending on the car model and duration of the rental."},
  {"question": "Do I need to pay a security deposit?", "answer": "Yes, a refundable security deposit is required for most vehicle categories."},
  {"question": "What payment methods do you accept?", "answer": "We accept cash, bank transfers, and major credit/debit cards."},
  {
    "question": "Are there any hidden charges?",
    "answer": "No, there are no hidden charges. We believe in transparent pricing. All costs are explained at the time of booking."
  },
];
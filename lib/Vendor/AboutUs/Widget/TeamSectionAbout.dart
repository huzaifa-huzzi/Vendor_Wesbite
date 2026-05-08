import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class TeamSection extends StatelessWidget {
  const TeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    double horizontalPadding = width > 1200 ? 100 : 20;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: horizontalPadding),
      color: AppColors.backgroundOfScreenColor,
      child: Column(
        children: [
           Text(
           TextString.Teamtitle,
            style: TTextTheme.h1StyleBlack(context),
          ),
          const SizedBox(height: 15),
           SizedBox(
            width: 600,
            child: Text(
              TextString.TeamSubtitle,
              textAlign: TextAlign.center,
              style: TTextTheme.h2Style(context),
            ),
          ),
          const SizedBox(height: 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width > 1200 ? 4 : (width > 800 ? 2 : 1),
              crossAxisSpacing: 20,
              mainAxisSpacing: 25,
              mainAxisExtent: width > 1200 ? 390 : (width > 800 ? 410 : 370 ),
            ),
            itemCount: teamMembers.length,
            itemBuilder: (context, index) {
              return _buildTeamCard(context,teamMembers[index], width);
            },
          ),
        ],
      ),
    );
  }

  /// ----------- Extra Widget --------- ///

   // Build Team Card
  Widget _buildTeamCard(BuildContext context,Map<String, String> member, double screenWidth) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.quadrantalTextColor.withOpacity(0.7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: double.infinity,
              height: screenWidth > 1200 ? 200 : 220,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  member['image']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member['name']!,
                  style: TTextTheme.cardsName(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  member['role']!,
                  style: TTextTheme.medium16Primary(context),
                ),
                const SizedBox(height: 12),
                Text(
                  member['desc']!,
                  style: TTextTheme.bodyRegular16Table(context),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
final List<Map<String, String>> teamMembers = [
  {
    "name": "Amélie Laurent",
    "role": "Customer Service Representative",
    "desc": "Greets and assists every customer with a smile.",
    "image": ImageString.amelia
  },
  {
    "name": "Jack Wilson",
    "role": "Rental Agent",
    "desc": "Handles bookings and ensures a smooth rental process.",
    "image": ImageString.jack
  },
  {
    "name": "Emily Johnson",
    "role": "Fleet Manager",
    "desc": "Manages our vehicles and keeps them in top condition.",
    "image": ImageString.emily
  },
  {
    "name": "Liam Taylor",
    "role": "Vehicle Maintenance Technician",
    "desc": "Ensures every car is safe and ready for the road.",
    "image": ImageString.liam
  },
  {
    "name": "Chloe Martin",
    "role": "Operations Manager",
    "desc": "Coordinates day-to-day operations and logistics.",
    "image": ImageString.chloe
  },
  {
    "name": "Ethan White",
    "role": "Marketing & Sales Executive",
    "desc": "Promotes our services and keeps customers informed.",
    "image": ImageString.ethan
  },
  {
    "name": "Sophie Harris",
    "role": "Finance Officer",
    "desc": "Manages payments and keeps everything transparent.",
    "image": ImageString.sophie
  },
  {
    "name": "Lucas Scott",
    "role": "General Manager",
    "desc": "Oversees the entire company and ensures top-notch service.",
    "image": ImageString.lucas
  },
];
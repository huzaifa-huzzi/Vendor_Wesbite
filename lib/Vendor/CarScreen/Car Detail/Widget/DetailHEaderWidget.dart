import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class DetailHeaderWidget extends StatelessWidget {
  const DetailHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 700;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: isMobile ? 250 : 400,
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage(ImageString.DetailsPicture),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(color: Colors.black.withOpacity(0.5)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Car Details",
                  style: TTextTheme.h6Style(context),
                ),
                const SizedBox(height: 10),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _buildBreadcrumbItem(context, "Home", false),
                    _buildBreadcrumbItem(context, " / ", false),
                    _buildBreadcrumbItem(context, "Cars", false),
                    _buildBreadcrumbItem(context, " / ", false),
                    _buildBreadcrumbItem(context, "Car Detail", true),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

   /// -- Extra Widget --- //
  Widget _buildBreadcrumbItem(BuildContext context, String label, bool isCurrent) {
    return Text(
      label,
      style: TTextTheme.bodyRegular16white(context),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class MainFooterWidget extends StatelessWidget {
  const MainFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth <= 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth > 1200 ? 120 : 30,
        vertical: 60,
      ),
      color: AppColors.textColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.start,
            children: [
              SizedBox(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          IconString.logo,
                          colorFilter: const ColorFilter.mode(
                              AppColors.primaryColor, BlendMode.srcIn),
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          TextString.footerTitle,
                          style: TTextTheme.h2Stylewhite(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Text(
                      TextString.footerSubtitle,
                      style: TTextTheme.bodyRegular16white(context),
                    ),
                  ],
                ),
              ),
              _buildFooterColumn(context, TextString.footerTitle1,
                  ["Home", "Cars", "Service", "About Us", "Faqs"]),
              _buildFooterColumn(context, TextString.footerTitle2,
                  ["Help Center", "Cancellation & Return policy"]),
              _buildFooterColumn(context, TextString.footerTitle3,
                  ["Accepted Payments"]),
              _buildFooterColumn(context, TextString.footerTitle4, [
                "Terms & Conditions",
                "Privacy Polices",
                "Licenses",
                "Contact"
              ]),
            ],
          ),
          const SizedBox(height: 60),
          Divider(color: AppColors.backgroundOfScreenColor),
          const SizedBox(height: 30),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCopyrightText(context),
              if (isMobile) const SizedBox(height: 20),
              _buildSocialIcons(),
            ],
          ),
        ],
      ),
    );
  }

     /// ---- Extra Widget
  Widget _buildFooterColumn(BuildContext context, String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TTextTheme.footertitle(context),
        ),
        const SizedBox(height: 25),
        ...links.map((link) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            link,
            style: TTextTheme.bodySemiBold14White(context),
          ),
        )),
      ],
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _socialIcon(IconString.twitter),
        const SizedBox(width: 20),
        _socialIcon(IconString.linkedin),
        const SizedBox(width: 20),
        _socialIcon(IconString.facebook),
        const SizedBox(width: 20),
        _socialIcon(IconString.github),
        const SizedBox(width: 20),
        _socialIcon(IconString.second),
        const SizedBox(width: 20),
        _socialIcon(IconString.dribble),
      ],
    );
  }

  Widget _socialIcon(String svgPath) {
    return SvgPicture.asset(
      svgPath,
      colorFilter: const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),
      width: 20,
      height: 20,
      placeholderBuilder: (context) => const SizedBox(width: 20, height: 20),
    );
  }

  Widget _buildCopyrightText(BuildContext context) {
    return Text(
        TextString.copyRightText,
        style: TTextTheme.bodyRegular16white(context)
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Routes/AppRoutes.dart';
import 'package:vendor_website/Vendor/AboutUs/AboutUs.dart';
import 'package:vendor_website/Vendor/CarScreen/CarScreen.dart';
import 'package:vendor_website/Vendor/ContactUs/ContactUsScreen.dart';
import 'package:vendor_website/Vendor/Faqs/Faqs.dart';
import 'package:vendor_website/Vendor/HomeScreen/HomeScreen.dart';
import 'package:vendor_website/Vendor/Services/Services.dart';

class MainFooterWidetServices extends StatelessWidget {
  const MainFooterWidetServices({super.key});

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
              _buildFooterColumn(context, TextString.footerTitle1, [
                _FooterLink(title: "Home", onTap: () => AppNavigation.router.go('/')),
                _FooterLink(title: "Cars", onTap: () => context.go('/cars')),
                _FooterLink(title: "Service", onTap: () => context.go('/services')),
                _FooterLink(title: "About Us", onTap: () => context.go('/About')),
                _FooterLink(title: "Faqs", onTap: () => context.go('/FAQs')),
              ]),
              _buildFooterColumn(context, TextString.footerTitle2, [
                _FooterLink(title: "Help Center", onTap: () => context.go('/help')),
                _FooterLink(title: "Cancellation & Return policy", onTap: () => context.go('/policy')),
              ]),
              _buildFooterColumn(context, TextString.footerTitle3, [
                _FooterLink(title: "Accepted Payments", onTap: () => context.go('/payments')),
              ]),
              _buildFooterColumn(context, TextString.footerTitle4, [
                _FooterLink(title: "Terms & Conditions", onTap: () => context.go('/terms')),
                _FooterLink(title: "Privacy Polices", onTap: () => context.go('/privacy')),
                _FooterLink(title: "Licenses", onTap: () => context.go('/licenses')),
                _FooterLink(title: "Contact", onTap: () => context.go('/contactUs')),
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
              _buildSocialIcons(context),
            ],
          ),
        ],
      ),
    );
  }

  /// ---- Extra Widget
  Widget _buildFooterColumn(BuildContext context, String title, List<_FooterLink> links) {
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
          child: InkWell(
            onTap: link.onTap,
            mouseCursor: SystemMouseCursors.click,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Text(
              link.title,
              style: TTextTheme.bodySemiBold14White(context),
            ),
          ),
        )),
      ],
    );
  }

  Widget _buildSocialIcons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _socialIcon(IconString.twitter, () => context.go('/twitter')),
        const SizedBox(width: 20),
        _socialIcon(IconString.linkedin, () => context.go('/linkedin')),
        const SizedBox(width: 20),
        _socialIcon(IconString.facebook, () => context.go('/facebook')),
        const SizedBox(width: 20),
        _socialIcon(IconString.github, () => context.go('/github')),
        const SizedBox(width: 20),
        _socialIcon(IconString.second, () => context.go('/second')),
        const SizedBox(width: 20),
        _socialIcon(IconString.dribble, () => context.go('/dribble')),
      ],
    );
  }

  Widget _socialIcon(String svgPath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      mouseCursor: SystemMouseCursors.click,
      child: SvgPicture.asset(
        svgPath,
        colorFilter: const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),
        width: 20,
        height: 20,
        placeholderBuilder: (context) => const SizedBox(width: 20, height: 20),
      ),
    );
  }

  Widget _buildCopyrightText(BuildContext context) {
    return Text(
        TextString.copyRightText,
        style: TTextTheme.bodyRegular16white(context)
    );
  }
}

class _FooterLink {
  final String title;
  final VoidCallback onTap;

  _FooterLink({required this.title, required this.onTap});
}
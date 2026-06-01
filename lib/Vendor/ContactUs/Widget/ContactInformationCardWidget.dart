import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/ContactUs/Reusable%20Widget/PrimaryBtnOfContact.dart';

class ContactInformationCard extends StatelessWidget {
  const ContactInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 950;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 50,
            vertical: 40,
          ),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
          ),
          child: isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageSide(isMobile: true),
              const SizedBox(height: 40),
              _buildInfoSide(context),
            ],
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: _buildImageSide(isMobile: false),
              ),
              const SizedBox(width: 50),
              Expanded(
                flex: 5,
                child: _buildInfoSide(context),
              ),
            ],
          ),
        );
      },
    );
  }

  /// --------- Extra Widget --------- ///

  // Image Side
  Widget _buildImageSide({required bool isMobile}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        ImageString.contactInfoside,
        height: isMobile ? null : 450,
        width: double.infinity,
        fit: isMobile ? BoxFit.fitWidth : BoxFit.cover,
      ),
    );
  }

  // Info Text Side
  Widget _buildInfoSide(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextString.contactTitle2,
          style: TTextTheme.h1StyleBlack(context),
        ),
        const SizedBox(height: 12),
        Text(
          TextString.contactSubtitle2,
          style: TTextTheme.medium16black(context),
        ),
        const SizedBox(height: 35),
        _buildInfoRow(
          context,
          icon: IconString.contact,
          title: TextString.contactTitlettile1,
          value: TextString.contactTitleValue1,
          subtitle: TextString.contactTitleSubtitle1,
        ),
        const SizedBox(height: 24),
        _buildInfoRow(
            context,
            icon: IconString.emailContact,
            title: TextString.contactTitlettile2,
            value:TextString.contactTitleValue2 ,
            subtitle: TextString.contactTitleSubtitle2
        ),
        const SizedBox(height: 24),
        _buildInfoRow(
          context,
          icon: IconString.hours,
          title: TextString.contactTitlettile2,
          value:TextString.contactTitleValue2 ,
          subtitle: TextString.contactTitleSubtitle2 ,
        ),
        const SizedBox(height: 35),
        SizedBox(
          width: 160,
          height: 48,
          child: PrimaryBtnOfContact(text: "Call Us Now", onTap: () {}),
        ),
      ],
    );
  }

  // Reusable Info Row
  Widget _buildInfoRow(
      BuildContext context, {
        required String icon,
        required String title,
        required String value,
        required String subtitle,
      }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            icon,
            height: 20,
            width: 20,
            colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TTextTheme.medium16paragraph(context),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TTextTheme.h2StyleOtherModule(context),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TTextTheme.bodyRegular14tertiary(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
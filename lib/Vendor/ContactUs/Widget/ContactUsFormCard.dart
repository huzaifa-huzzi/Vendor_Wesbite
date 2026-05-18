import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/ContactUs/ContactUsController.dart' show ContactUsController;
import 'package:vendor_website/Vendor/ContactUs/Reusable%20Widget/PrimaryBtnOfContact.dart';

class ContactUsFormCard extends StatelessWidget {
  const ContactUsFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContactUsController());

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 950;

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1250),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 15 : 40,
                  vertical: 40
              ),
              decoration: BoxDecoration(
                color: AppColors.backgroundOfScreenColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: isMobile
                  ? Column(
                children: [
                  _buildFormSide(context, controller),
                  const SizedBox(height: 50),
                  _buildImageSide(context, isMobile: true),
                ],
              )
                  : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: _buildFormSide(context, controller),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: _buildImageSide(context, isMobile: false),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

   /// -------- Extra Widget ----- ///

  //  Form Side
  Widget _buildFormSide(BuildContext context, ContactUsController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TextString.contactFormTitle, style: TTextTheme.hContactService(context)),
        const SizedBox(height: 12),
        Text(
            TextString.contactFormSubtitle,
            style: TTextTheme.hContactServicesSubtitle(context)
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            Expanded(child: _buildField(context, TextString.firstName, TextString.firstName, controller.firstName)),
            const SizedBox(width: 20),
            Expanded(child: _buildField(context, TextString.lastName,TextString.lastName, controller.lastName)),
          ],
        ),
        const SizedBox(height: 24),

        _buildField(context, TextString.email, "you@company.com", controller.email),
        const SizedBox(height: 24),

        _buildField(context, TextString.phoneNumber, "+1 (555) 000-0000", controller.phone, prefix: "US ▼"),
        const SizedBox(height: 24),

        _buildField(context, TextString.message, "Leave us a message...", controller.message, maxLines: 5),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => SizedBox(
              width: 24, height: 24,
              child: Checkbox(
                value: controller.agreeToPrivacy.value,
                onChanged: (v) => controller.agreeToPrivacy.value = v!,
                activeColor: AppColors.primaryColor,
                side: BorderSide(color: AppColors.quadrantalTextColor.withOpacity(0.5)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
            )),
            const SizedBox(width: 12),
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: "You agree to our friendly ",
                  style: TTextTheme.hContactServicesSubtitle(context),
                  children: [
                    TextSpan(
                      text: "privacy policy",
                      style: TTextTheme.hContactServicesSubtitle(context).copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const TextSpan(text: "."),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          height: 54,
          child: PrimaryBtnOfContact(text: "Send Message", onTap: () {})
        ),
      ],
    );
  }

  //  Image Side
  Widget _buildImageSide(BuildContext context, {required bool isMobile}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        ImageString.contactPic1,
        height: 680,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  //  Reusable Field
  Widget _buildField(BuildContext context, String label, String hint, TextEditingController ctrl, {int maxLines = 1, String? prefix}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TTextTheme.medium14black(context)),
        const SizedBox(height: 10),
        TextFormField(
          cursorColor: AppColors.blackColor,
          controller: ctrl,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TTextTheme.bodyRegular16(context).copyWith(color: AppColors.quadrantalTextColor.withOpacity(0.6)),
            prefixIcon: prefix != null ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Text(prefix, style: TTextTheme.bodyRegular16(context)),
            ) : null,
            filled: true,
            fillColor: AppColors.whiteColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.quadrantalTextColor.withOpacity(0.4)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.quadrantalTextColor.withOpacity(0.4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:  BorderSide(color: AppColors.quadrantalTextColor.withOpacity(0.4), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
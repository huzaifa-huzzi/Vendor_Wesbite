import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/ContactUs/ContactUsController.dart' show ContactUsController, Country;
import 'package:vendor_website/Vendor/ContactUs/Reusable%20Widget/PrimaryBtnOfContact.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
        _buildPhoneField(context, TextString.phoneNumber, "+1 (555) 000-0000", controller),
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

  // ----Phone Field ------ //
  Widget _buildPhoneField(BuildContext context, String label, String hint, ContactUsController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TTextTheme.medium14black(context)),
        const SizedBox(height: 10),
        Obx(() {
          if (controller.isLoadingCountries.value || controller.countryList.isEmpty) {
            return SizedBox(
              height: 54,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                ),
              ),
            );
          }

          final List<Country> countryList = controller.countryList;

          return TextFormField(
            cursorColor: AppColors.blackColor,
            controller: controller.phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TTextTheme.bodyRegular16(context).copyWith(color: AppColors.quadrantalTextColor.withOpacity(0.6)),
              filled: true,
              fillColor: AppColors.whiteColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 12, right: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<Country>(
                        isExpanded: false,
                        value: countryList.firstWhere(
                              (c) => c.name == controller.selectedCountryName.value,
                          orElse: () => countryList.first,
                        ),
                        selectedItemBuilder: (context) {
                          return countryList.map((Country country) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildCircleFlag(country.countryCode),
                                const SizedBox(width: 6),
                                Text(
                                  country.countryCode.toUpperCase(),
                                  style: TTextTheme.bodyRegular16(context).copyWith(color: AppColors.blackColor),
                                ),
                              ],
                            );
                          }).toList();
                        },
                        items: countryList.map((Country country) {
                          return DropdownMenuItem<Country>(
                            value: country,
                            child: Row(
                              children: [
                                _buildCircleFlag(country.countryCode),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    country.name,
                                    style: const TextStyle(fontSize: 13),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "+${country.phoneCode}",
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (Country? value) {
                          if (value != null) {
                            controller.selectedCountryName.value = value.name;
                            controller.selectedCode.value = "+${value.phoneCode}";
                          }
                        },
                        buttonStyleData: const ButtonStyleData(
                          height: 48,
                          padding: EdgeInsets.zero,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(Icons.arrow_drop_down, size: 22, color: Colors.black87),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 300,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          offset: const Offset(0, -5),
                        ),
                        dropdownSearchData: DropdownSearchData(
                          searchController: controller.searchController,
                          searchInnerWidgetHeight: 50,
                          searchInnerWidget: _buildSearchField(context, controller.searchController),
                          searchMatchFn: (item, searchValue) {
                            return item.value!.name.toLowerCase().contains(searchValue.toLowerCase()) ||
                                item.value!.phoneCode.contains(searchValue);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 22,
                      width: 1,
                      color: AppColors.quadrantalTextColor.withOpacity(0.3),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
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
                borderSide: BorderSide(color: AppColors.quadrantalTextColor.withOpacity(0.4), width: 1.5),
              ),
            ),
          );
        }),
      ],
    );
  }

  // Country Search Field inside dropdown
  Widget _buildSearchField(BuildContext context, TextEditingController searchController) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        cursorColor: AppColors.blackColor,
        controller: searchController,
        style: TTextTheme.bodyRegular16(context),
        decoration: InputDecoration(
          isDense: true,
          fillColor: AppColors.backgroundOfScreenColor,
          filled: true,
          hintText: 'Search Country',
          hintStyle: TTextTheme.bodyRegular16(context).copyWith(color: AppColors.quadrantalTextColor.withOpacity(0.5)),
          prefixIcon: const Icon(Icons.search, size: 18, color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  // Web-safe Emoji Flag renderer
  Widget _buildCircleFlag(String countryIsoCode) {
    String flagEmoji = countryIsoCode.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
          (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
    );

    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      child: Text(
        flagEmoji,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
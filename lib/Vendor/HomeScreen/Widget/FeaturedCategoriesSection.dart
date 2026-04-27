import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class FeaturedCategoriesSection extends StatelessWidget {
  const FeaturedCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 40,
      ),
      child: Column(
        children: [
          _buildCategoryHeader(
            context,
            TextString.rentsByBrand,
            onViewAll: () => context.push('/cars'),
          ),
          const SizedBox(height: 20),
          _buildCategoryGrid(context, [
            {'name': 'Toyota', 'icon': IconString.toyota},
            {'name': 'Honda', 'icon': IconString.honda},
            {'name': 'KIA', 'icon': IconString.kia},
            {'name': 'Tesla', 'icon': IconString.tesla},
            {'name': 'Hyundai', 'icon': IconString.Hyundai},
            {'name': 'Suzuki', 'icon': IconString.newSuzuki},
          ]),

          const SizedBox(height: 50),
          _buildCategoryHeader(
            context,
            TextString.rentsByBodyType,
            showViewAll: false,
          ),
          const SizedBox(height: 20),
          _buildCategoryGrid(context, [
            {'name': 'SUV', 'icon': IconString.suv},
            {'name': 'Crossover', 'icon': IconString.crossover},
            {'name': 'Hatchback', 'icon': IconString.wagon},
            {'name': 'Sedan', 'icon': IconString.sedan},
            {'name': 'Coup', 'icon': IconString.coup},
            {'name': 'Compact', 'icon': IconString.compact},
          ]),
        ],
      ),
    );
  }
  /// ---------- Extra Widget -------- ///

  //  Category Header
  Widget _buildCategoryHeader(BuildContext context, String title, {VoidCallback? onViewAll, bool showViewAll = true}) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 10,
        children: [
          Text(
            title,
            style: TTextTheme.h4Style(context),
          ),
          if (showViewAll)
            InkWell(
              onTap: onViewAll,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      TextString.viewAll,
                      style: TTextTheme.bodyRegular16Primary(context),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.arrow_forward, color: AppColors.primaryColor, size: 18),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  //  Responsive Category Grid
  Widget _buildCategoryGrid(BuildContext context, List<Map<String, dynamic>> items) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;
    if (screenWidth > 1100) {
      crossAxisCount = 6;
    } else if (screenWidth > 600) {
      crossAxisCount = 3;
    } else if (screenWidth < 400) {
      crossAxisCount = 1;
    } else {
      crossAxisCount = 2;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: screenWidth > 1100 ? 1.3 : 1.5,
      ),
      itemBuilder: (context, index) {
        final iconPath = items[index]['icon'] as String;

        return Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.fieldsBackground.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconPath.endsWith('.svg')
                  ? SvgPicture.asset(iconPath, height: 40, width: 40, fit: BoxFit.contain)
                  : Image.asset(iconPath, height: 60, width: 60, fit: BoxFit.contain),
              const SizedBox(height: 10),
              Text(
                items[index]['name'],
                style: TTextTheme.medium16black(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
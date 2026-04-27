import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/HomeScreen/ReusbaleWidget/PrimaryBtnOfHome.dart';

class BestOffersSection extends StatelessWidget {
  const BestOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> carOffers = [
      {"name": "Toyota Corolla", "year": "2024", "price": "254", "img": ImageString.grid1, "gear": "Auto", "fuel": "Petrol", "liters": "2.5L"},
      {"name": "Ford Mustang", "year": "2023", "price": "450", "img": ImageString.grid2, "gear": "Manual", "fuel": "Petrol", "liters": "5.0L"},
      {"name": "Tesla Model 3", "year": "2024", "price": "380", "img": ImageString.grid3, "gear": "Auto", "fuel": "Electric", "liters": "N/A"},
      {"name": "BMW M4", "year": "2024", "price": "600", "img": ImageString.grid4, "gear": "Auto", "fuel": "Petrol", "liters": "3.0L"},
      {"name": "Honda Civic", "year": "2023", "price": "220", "img": ImageString.grid5, "gear": "Auto", "fuel": "Hybrid", "liters": "1.8L"},
      {"name": "Audi A6", "year": "2024", "price": "520", "img": ImageString.grid6, "gear": "Auto", "fuel": "Diesel", "liters": "2.0L"},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 60,
      ),
      child: Column(
        children: [
          _buildCategoryHeader(
            context,
            TextString.bestPriceTitle,
            onViewAll: () => context.push('/cars'),
          ),
          const SizedBox(height: 30),

          LayoutBuilder(builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 1100 ? 3 : (constraints.maxWidth > 700 ? 2 : 1);

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: carOffers.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
                mainAxisExtent: 440,
              ),
              itemBuilder: (context, index) {
                final car = carOffers[index];
                return _buildVehicleCard(
                  context,
                  name: car['name']!,
                  year: car['year']!,
                  price: car['price']!,
                  image: car['img']!,
                  gear: car['gear']!,
                  fuel: car['fuel']!,
                  liters: car['liters']!,
                );
              },
            );
          }),
        ],
      ),
    );
  }

   /// ---------- Extra Widget -------- ///

  //  Vehicle Card UI
  Widget _buildVehicleCard(
      BuildContext context, {
        required String name,
        required String year,
        required String price,
        required String image,
        required String gear,
        required String fuel,
        required String liters,
      }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.fieldsBackground.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: TTextTheme.h5Style(context)),
                        Text(year, style: TTextTheme.bodyRegular16(context)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("\$$price", style: TTextTheme.h5StylePrimary(context)),
                        Text("per week", style: TTextTheme.bodyRegular14(context)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMiniSpec(context, IconString.auto, gear),
                    _buildMiniSpec(context, IconString.electric, fuel),
                    _buildMiniSpec(context, IconString.litres, liters),
                  ],
                ),
                const SizedBox(height: 25),
                PrimaryBtnOfHome(
                  text: "View Details",
                  onTap: () => context.push('/CarDetail'),
                  height: 48,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //  Mini Specification
  Widget _buildMiniSpec(BuildContext context, String svgPath, String text) {
    return Row(
      children: [
        SvgPicture.asset(
          svgPath,
          width: 16,
          height: 16,
          colorFilter: const ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn),
        ),
        const SizedBox(width: 6),
        Text(text, style: TTextTheme.bodyRegular16(context)),
      ],
    );
  }
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

}
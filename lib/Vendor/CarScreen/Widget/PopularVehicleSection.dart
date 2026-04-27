import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/PrimaryBtnOfCar.dart';

class PopularVehiclesSection extends StatelessWidget {
  const PopularVehiclesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppSizes.isMobile(context);

    final List<Map<String, String>> popularCars = [
      {"name": "Toyota Corolla", "year": "2024", "price": "254", "img": ImageString.grid1, "gear": "Auto", "fuel": "Petrol", "liters": "2.5liters"},
      {"name": "Honda Civic", "year": "2023", "price": "254", "img": ImageString.grid2, "gear": "Auto", "fuel": "Petrol", "liters": "2.5liters"},
      {"name": "Suzuki Swift", "year": "2022", "price": "254", "img": ImageString.grid3, "gear": "Auto", "fuel": "Petrol", "liters": "2.5liters"},
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextString.PopularSection,
            style: TTextTheme.h1StyleBlack(context),
          ),
          const SizedBox(height: 40),
          isMobile
              ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: popularCars.map((car) => Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: _buildVehicleCard2(
                    context,
                    name: car['name']!,
                    year: car['year']!,
                    price: car['price']!,
                    image: car['img']!,
                    gear: car['gear']!,
                    fuel: car['fuel']!,
                    liters: car['liters']!,
                  ),
                ),
              )).toList(),
            ),
          )
              : Row(
            children: popularCars.map((car) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _buildVehicleCard2(
                  context,
                  name: car['name']!,
                  year: car['year']!,
                  price: car['price']!,
                  image: car['img']!,
                  gear: car['gear']!,
                  fuel: car['fuel']!,
                  liters: car['liters']!,
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

    /// ----------- Extra Widget -------- ///
  //  Card Widget
  Widget _buildVehicleCard2(
      BuildContext context, {
        required String name,
        required String year,
        required String price,
        required String image,
        required String gear,
        required String fuel,
        required String liters,
      }) {
    final bool isDesktop = !AppSizes.isMobile(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
              color: AppColors.fieldsBackground.withOpacity(0.02),
              blurRadius: 15,
              offset: const Offset(0, 8)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 180,
            padding: const EdgeInsets.all(6),
            child: Center(
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: TTextTheme.h5Style(context), maxLines: 1, overflow: TextOverflow.ellipsis),
                          Text(year, style: TTextTheme.bodyRegular14(context)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("\$$price", style: TTextTheme.h5StylePrimary(context)),
                        Text("per week", style: TTextTheme.bodyRegular12(context)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                isDesktop
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildMiniSpec2(context, IconString.auto, gear)),
                    Expanded(child: _buildMiniSpec2(context, IconString.electric, fuel)),
                    Expanded(child: _buildMiniSpec2(context, IconString.litres, liters)),
                  ],
                )
                    : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      _buildMiniSpec2(context, IconString.auto, gear),
                      const SizedBox(width: 25),
                      _buildMiniSpec2(context, IconString.electric, fuel),
                      const SizedBox(width: 25),
                      _buildMiniSpec2(context, IconString.litres, liters),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                PrimaryBtnOfCar(
                  text: "View Details",
                  onTap: () {
                    context.push('/CarDetail');
                  },
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

  //  Mini Spec Icon
  Widget _buildMiniSpec2(BuildContext context, String svgPath, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          width: 14,
          height: 14,
          colorFilter: const ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn),
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            style: TTextTheme.bodyRegular14(context).copyWith(color: AppColors.blackColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
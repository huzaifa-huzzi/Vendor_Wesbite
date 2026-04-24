import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/TextTheme.dart' show TTextTheme;

class CarSpecificationsWidget extends StatelessWidget {
  const CarSpecificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> specs = [
      {'icon': IconString.makeIcon, 'label': 'Make', 'value': 'Honda'},
      {'icon': IconString.condition, 'label': 'Condition', 'value': 'New'},
      {'icon': IconString.registration, 'label': 'Registration', 'value': '1234567890'},
      {'icon': IconString.bodyType, 'label': 'Body Type', 'value': 'Sedan'},
      {'icon': IconString.carColor, 'label': 'Color', 'value': 'White'},
      {'icon': IconString.carTransmision, 'label': 'Transmission', 'value': 'Automatic'},
      {'icon': IconString.capacity, 'label': 'Capacity', 'value': '4 Seats'},
      {'icon': IconString.engineSize, 'label': 'Engine Size', 'value': '2.5 (L)'},
      {'icon': IconString.carValue, 'label': 'Car Value', 'value': '\$35000'},
      {'icon': IconString.milageIcon, 'label': 'Mileage', 'value': '43,000(km)'},
      {'icon': IconString.CarFuel, 'label': 'Fuel', 'value': 'Petrol'},
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          Text("Car Specifications", style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Explore all the features this vehicle offers, designed to enhance comfort, safety, and overall driving experience.",
              textAlign: TextAlign.center,
              style: TTextTheme.medium16black(context),
            ),
          ),

          const SizedBox(height: 50),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.08,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 4;
                if (constraints.maxWidth < 1100) crossAxisCount = 3;
                if (constraints.maxWidth < 800) crossAxisCount = 2;
                if (constraints.maxWidth < 450) crossAxisCount = 1;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: specs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 25,
                    mainAxisExtent: 100,
                  ),
                  itemBuilder: (context, index) {
                    return _buildSpecCard(
                      context,
                      specs[index]['icon'],
                      specs[index]['label'],
                      specs[index]['value'],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// -- Extra Widget ------//

  //  Internal Card Widget
  Widget _buildSpecCard(BuildContext context, String iconPath, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.signaturePadColor),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TTextTheme.bodyRegular14Quadrantal(context),
                ),
                const SizedBox(height: 4),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    value,
                    style: TTextTheme.medium16black(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
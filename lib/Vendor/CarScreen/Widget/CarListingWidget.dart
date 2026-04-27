import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart' show TTextTheme;
import 'package:vendor_website/Vendor/CarScreen/CarController.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/PAginationBarOfCar.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/PrimaryBtnOfCar.dart';

class CarListingWidget extends StatelessWidget {
  const CarListingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.of(context).size.width > 800;
    final isMobile = AppSizes.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildSectionHeader(context),
          const SizedBox(height: 50),
          if (isWeb)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: _buildFilterSidebar(context),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: Column(
                    children: [
                      _buildResponsiveCarGrid(context),
                      const SizedBox(height: 40),
                      PaginationBarOfCar(
                        isMobile: isMobile,
                        tablePadding: 0,
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                _buildFilterSidebar(context),
                const SizedBox(height: 30),
                _buildResponsiveCarGrid(context),
                const SizedBox(height: 20),
                PaginationBarOfCar(
                  isMobile: isMobile,
                  tablePadding: 0,
                ),
              ],
            ),
        ],
      ),
    );
  }
     /// ----------- Extra Widget ------ ///
  // Responsive Car Grid
  Widget _buildResponsiveCarGrid(BuildContext context) {
    final List<Map<String, String>> carOffers = [
      {"name": "Toyota Yaris Cross", "year": "2022", "price": "254", "img": ImageString.grid1, "gear": "Auto", "fuel": "Petrol", "liters": "2.5L"},
      {"name": "Honda HR-V", "year": "2022", "price": "254", "img": ImageString.grid2, "gear": "Auto", "fuel": "Petrol", "liters": "2.5L"},
      {"name": "Nissan Rogue", "year": "2021", "price": "254", "img": ImageString.grid3, "gear": "Auto", "fuel": "Electric", "liters": "2.5L"},
      {"name": "Kia Ev6", "year": "2018", "price": "254", "img": ImageString.grid4, "gear": "Auto", "fuel": "Petrol", "liters": "2.5L"},
      {"name": "BYD Atto3..", "year": "2016", "price": "254", "img": ImageString.grid5, "gear": "Auto", "fuel": "Petrol", "liters": "2.5L"},
      {"name": "MG HS1.5 Turbo..", "year": "2022", "price": "254", "img": ImageString.grid6, "gear": "Auto", "fuel": "Petrol", "liters": "2.5L"},
    ];

    return LayoutBuilder(builder: (context, constraints) {
      int crossAxisCount = constraints.maxWidth > 700 ? 2 : 1;

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: carOffers.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
          mainAxisExtent: 430,
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
    });
  }

  //  Individual Card
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
              offset: const Offset(0, 8)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 210,
            padding: const EdgeInsets.all(6),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TTextTheme.h5Style(context),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(year, style: TTextTheme.bodyRegular16(context)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
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
                    const SizedBox(width: 12),
                    _buildMiniSpec(context, IconString.electric, fuel),
                    const SizedBox(width: 12),
                    _buildMiniSpec(context, IconString.litres, liters),
                  ],
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

   // Mini Specs
  Widget _buildMiniSpec(BuildContext context,String svgPath, String text) {
    return Row(
      children: [
        SvgPicture.asset(
          svgPath,
          width: 16,
          height: 16,
          colorFilter: ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TTextTheme.bodyRegular16(context),
        ),
      ],
    );
  }
  Widget _buildFilterSidebar(BuildContext context) {
    final controller = Get.find<CarController>();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.fieldsBackground.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(TextString.CarFilterTitle, style: TTextTheme.h2Styleblack(context)),
              const Icon(Icons.tune, color: AppColors.primaryColor, size: 20),
            ],
          ),
          const Divider(height: 30),
          Text(TextString.priceRangeWeekly, style: TTextTheme.bodySemiBold16black(context)),
          const SizedBox(height: 10),
          Obx(() => Column(
            children: [
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: AppColors.primaryColor,
                  inactiveTrackColor: AppColors.primaryColor,
                  thumbColor: AppColors.whiteColor,
                  trackHeight: 4,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 10,
                    elevation: 5,
                  ),
                  overlayColor: AppColors.primaryColor,
                ),
                child: Slider(
                  value: controller.currentPrice.value,
                  min: 200,
                  max: 1200,
                  onChanged: (v) {
                    controller.currentPrice.value = v;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$${controller.currentPrice.value.round()}",
                      style: TTextTheme.medium16black(context)),
                  Text("\$1200",
                      style: TTextTheme.medium16black(context)),
                ],
              ),
            ],
          )),

          const SizedBox(height: 10),
          _buildSidebarSearchDropdown(context,TextString.carTitle1 , controller.selectMake, id: "Make"),
          _buildSidebarSearchDropdown(context,TextString.carTitle2 , controller.selectedModel, id: "Model"),
          _buildSidebarSearchDropdown(context,TextString.carTitle3 , controller.selectedEngine, id: "engine"),
          _buildSidebarSearchDropdown(context,TextString.carTitle4 , controller.selectedSeats, id: "seats"),
          _buildSidebarSearchDropdown(context,TextString.carTitle5 , controller.selectedYear, id: "year"),
          _buildSidebarSearchDropdown(context,TextString.carTitle6 , controller.selectedBody, id: "body"),
          _buildSidebarSearchDropdown(context,TextString.carTitle7 , controller.selectedFuel, id: "fuel"),
          _buildSidebarSearchDropdown(context,TextString.carTitle8 , controller.selectedTrans, id: "trans"),
        ],
      ),
    );
  }
  Widget _buildSidebarSearchDropdown(BuildContext context, String label, RxString selected, {required String id}) {
    final controller = Get.find<CarController>();

    return Obx(() {
      bool isOpen = controller.openedDropdown3.value == id;
      List<String> items = controller.getFilteredItems(id,selected);

      return LayoutBuilder(builder: (context, constraints) {
        return PopupMenuButton<String>(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            maxWidth: constraints.maxWidth,
            maxHeight: 400,
          ),
          offset: const Offset(0, 45),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.white,
          onOpened: () => controller.openedDropdown3.value = id,
          onCanceled: () {
            controller.openedDropdown3.value = "";
            controller.searchCarText.value = "";
          },
          onSelected: (val) {
            if (val != "SEARCH_FIELD") {
              selected.value = val;
              controller.openedDropdown3.value = "";
              controller.searchCarText.value = "";
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.quadrantalTextColor.withOpacity(0.2))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    selected.value.isEmpty ? label : selected.value,
                    style: TTextTheme.bodyRegular16black(context)
                ),
                Icon(
                    isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    size: 20,
                    color: AppColors.textColor
                ),
              ],
            ),
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem<String>(
                enabled: false,
                value: "SEARCH_FIELD",
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: TextField(
                      cursorColor: AppColors.blackColor,
                      onChanged: (val) => controller.searchCarText.value = val,
                      style: TTextTheme.bodyRegular16(context),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.backgroundOfScreenColor,
                        hintText: "Search $label",
                        hintStyle: TTextTheme.bodyRegular16(context),
                        prefixIcon: const Icon(Icons.search, color: AppColors.primaryColor, size: 18),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ...items.map((item) {
                bool isSelected = selected.value == item;
                return PopupMenuItem<String>(
                  value: item,
                  child: Row(
                    children: [
                      Container(
                        width: 20, height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primaryColor),
                          color: isSelected ? AppColors.primaryColor : Colors.transparent,
                        ),
                        child: isSelected ? const Icon(Icons.done, color: AppColors.whiteColor, size: 12) : null,
                      ),
                      const SizedBox(width: 12),
                      Text(item),
                    ],
                  ),
                );
              }),
            ];
          },
        );
      });
    });
  }
  Widget _buildSectionHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          TextString.CarTitle,
          textAlign: TextAlign.center,
          style: TTextTheme.h1StyleBlack(context),
        ),
        const SizedBox(height: 10),
        Text(
          TextString.CarSubtitle,
          textAlign: TextAlign.center,
          style: TTextTheme.bodyRegular16black(context),
        ),
      ],
    );
  }
}
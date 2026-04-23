import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/CarScreen/CarController.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/PAginationBarOfCar.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/PrimaryBtnOfCar.dart';
import 'package:vendor_website/Vendor/HomeScreen/ReusbaleWidget/PrimaryBtnOfHome.dart';


class CarScreenWidget extends StatefulWidget {
  const CarScreenWidget({super.key});

  @override
  State<CarScreenWidget> createState() => _CarScreenWidgetState();
}

class _CarScreenWidgetState extends State<CarScreenWidget> {
  @override
  Widget build(BuildContext context) {
    Get.put(CarController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
            children: [
            WebAppBar(scaffoldKey: scaffoldKey),
        _buildCarBanner(context),
         _buildCarListingContent(context),
              SizedBox(height: 20,),
              _buildPopularVehiclesSection(context),
              SizedBox(height: 20,),
              _buildRentCarCTA(context),
              SizedBox(height: 20,),
              _buildNewsletterSection(context),
              _buildMainFooter(context),


        ],
      ),
      ),
    );
  }
   /// ---------- Extra Widgets -----
  // banner
  Widget _buildCarBanner(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = screenWidth < 600 ? 190 : 230;

    return Container(
      width: double.infinity,
      height: bannerHeight,
      margin: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cars",
                    style: TTextTheme.h1Style(context)
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Home / Cars",
                    style: TTextTheme.bodyRegular16white(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

   // Car Listings
  Widget _buildCarListingContent(BuildContext context) {
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
                    child: _buildFilterSidebar(context)
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
              offset: const Offset(0, 8)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
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
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    children: [
                      _buildMiniSpec(context, IconString.auto, gear),
                      const SizedBox(width: 12),
                      _buildMiniSpec(context, IconString.electric, fuel),
                      const SizedBox(width: 12),
                      _buildMiniSpec(context, IconString.litres, liters),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                PrimaryBtnOfCar(
                  text: "View Details",
                  onTap: () {},
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
              Text("Filter", style: TTextTheme.h2Styleblack(context)),
              const Icon(Icons.tune, color: AppColors.primaryColor, size: 20),
            ],
          ),
          const Divider(height: 30),
           Text("Price Range (Weekly)", style: TTextTheme.bodySemiBold16black(context)),
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
          _buildSidebarSearchDropdown(context, "Make", controller.selectMake, id: "Make"),
          _buildSidebarSearchDropdown(context, "Model", controller.selectedModel, id: "Model"),
          _buildSidebarSearchDropdown(context, "Engine Size", controller.selectedEngine, id: "engine"),
          _buildSidebarSearchDropdown(context, "Seats", controller.selectedSeats, id: "seats"),
          _buildSidebarSearchDropdown(context, "Year", controller.selectedYear, id: "year"),
          _buildSidebarSearchDropdown(context, "Body Type", controller.selectedBody, id: "body"),
          _buildSidebarSearchDropdown(context, "Fuel Type", controller.selectedFuel, id: "fuel"),
          _buildSidebarSearchDropdown(context, "Transmission", controller.selectedTrans, id: "trans"),
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
              border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2))),
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
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                  child: TextField(
                    cursorColor: AppColors.blackColor,
                    onChanged: (val) => controller.searchCarText.value = val,
                    style: TTextTheme.textFieldWrittenText(context),
                    decoration: InputDecoration(
                      hintText: "Search $label",
                      hintStyle: TTextTheme.insidetextfieldWrittenText(context),
                      prefixIcon: const Icon(Icons.search, size: 18),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
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
          "Select Your Desire Vehicle",
          textAlign: TextAlign.center,
          style: TTextTheme.h1StyleBlack(context),
        ),
        const SizedBox(height: 10),
        Text(
          "Choose a vehicle category that fits your needs, from compact cars to\nspacious SUVs and luxury options.",
          textAlign: TextAlign.center,
          style: TTextTheme.bodyRegular16black(context),
        ),
      ],
    );
  }

   // Popular Vehicle Section
  Widget _buildPopularVehiclesSection(BuildContext context) {
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
            "Some Popular Vehicle",
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
                  child: _buildVehicleCard(
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
                child: _buildVehicleCard(
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

   // Banner
  Widget _buildRentCarCTA(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool useVerticalLayout = screenWidth < 1000;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 60,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.fieldsBackground.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildBackgroundStripes(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: useVerticalLayout ? 40 : 30,
                horizontal: useVerticalLayout ? 15 : 30,
              ),
              child: useVerticalLayout
                  ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildLeftContentBox(context, true),
                  const SizedBox(height: 20),
                  _buildCenterImages(true),
                  const SizedBox(height: 20),
                  _buildRightContentBox(context, true),
                ],
              )
                  : Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _buildLeftContentBox(context, false),
                  ),
                  Expanded(
                    flex: 4,
                    child: _buildCenterImages(false),
                  ),
                  Expanded(
                    flex: 3,
                    child: _buildRightContentBox(context, false),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildLeftContentBox(BuildContext context, bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(screenWidth < 300 ? 12 : 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "You are looking to\nrent a car?",
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: TTextTheme.h6StylePrimary(context)
          ),
          const SizedBox(height: 15),
          FittedBox(
            child: PrimaryBtnOfCar(
              text: "VISIT NOW",
              onTap: () {},
              width: 120,
              height: 38,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCenterImages(bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Image.asset(
        ImageString.bannerPics,
        fit: BoxFit.contain,
        height: isMobile ? 180 : null,
      ),
    );
  }
  Widget _buildRightContentBox(BuildContext context, bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(screenWidth < 300 ? 12 : 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Text(
        "Discover the Joy of the\nOpen Road.",
        textAlign: isMobile ? TextAlign.center : TextAlign.left,
        style: TTextTheme.bannerBlack(context)
      ),
    );
  }
  Widget _buildBackgroundStripes() {
    return Positioned.fill(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(2, (index) => Transform.rotate(
          angle: 0.5,
          child: Container(
            width: 60,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
          ),
        )),
      ),
    );
  }


  // NewsLetter
  Widget _buildNewsletterSection(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 60,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: isDesktop
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNewsletterText(context),
          _buildNewsletterInput(context),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNewsletterText(context),
          const SizedBox(height: 30),
          _buildNewsletterInput(context),
        ],
      ),
    );
  }
  Widget _buildNewsletterInput(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 600;

    return Wrap(
      spacing: 15,
      runSpacing: 15,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
          width: isDesktop ? 350 : 300,
          height: 50,
          child: TextField(
            cursorColor: AppColors.blackColor,
            style: TTextTheme.textFieldWrittenText(context),
            decoration: InputDecoration(
              hintText: "Enter your email",
              hintStyle: TTextTheme.bodyRegular16secondary(context),
              filled: true,
              fillColor: AppColors.whiteColor,

              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.quadrantalTextColor.withOpacity(0.7)),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.quadrantalTextColor.withOpacity(0.7))),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColors.quadrantalTextColor.withOpacity(0.7), width: 1),
              ),
            ),
          ),
        ),

        // Subscribe Button
        PrimaryBtnOfHome(
          text: "Subscribe",
          onTap: () {},
          height: 50,
          width: 120,
          borderRadius: BorderRadius.circular(8),
        ),
      ],
    );
  }
  Widget _buildNewsletterText(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            TextString.newsLetterTitle,
            style: TTextTheme.hNews(context)
        ),
        SizedBox(height: 10),
        Text(
          TextString.newsLetterSubtitle,
          style: TTextTheme.medium16black(context),
        ),
      ],
    );
  }

  // Footer
  Widget _buildMainFooter(BuildContext context) {
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
                              AppColors.primaryColor,
                              BlendMode.srcIn
                          ),
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 10),
                        Text(TextString.footerTitle,
                            style: TTextTheme.h2Stylewhite(context)),
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
              _buildFooterColumn(context,TextString.footerTitle1, ["Home", "Cars", "Service", "About Us", "Faqs"]),
              _buildFooterColumn(context,TextString.footerTitle2, ["Help Center", "Cancellation & Return policy"]),
              _buildFooterColumn(context,TextString.footerTitle3, ["Accepted Payments"]),
              _buildFooterColumn(context,TextString.footerTitle4, ["Terms & Conditions", "Privacy Polices", "Licenses", "Contact"]),
            ],
          ),

          const SizedBox(height: 60),
          Divider(color: AppColors.backgroundOfScreenColor),
          SizedBox(height: 30),
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
  Widget _buildFooterColumn(BuildContext context,String title, List<String> links) {
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
    return  Text(
        TextString.copyRightText,
        style: TTextTheme.bodyRegular16white(context)
    );
  }

}

import 'package:carousel_slider/carousel_slider.dart';
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
import 'package:vendor_website/Vendor/HomeScreen/HomeController.dart';
import 'package:vendor_website/Vendor/HomeScreen/ReusbaleWidget/PrimaryBtnOfHome.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            _buildResponsiveHeroSection(context),
            _buildFeaturedCars(context),
            _buildHowItWorksSection(context),
            _buildBestOffersSection(context),
            _buildWhyChooseUs(context),
            _buildTestimonialsSection(context),
            _buildFAQsSection(context),
            SizedBox(height: 30,),
            _buildNewsletterSection(context),
            _buildMainFooter(context),
          ],
        ),
      ),
    );
  }

  /// --------- Extra Widgets ------ ///

  // Hero Section
  Widget _buildResponsiveHeroSection(BuildContext context) {
    final bool isDesktop = AppSizes.isWeb(context);

    return Container(
      margin: EdgeInsets.all(AppSizes.horizontalPadding(context)),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                ImageString.background,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: isDesktop ? 60 : 20,
                right: isDesktop ? 60 : 20,
                top: 60,
                bottom: 0,
              ),
              child: isDesktop
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 3,
                      child: _heroTextSection(context)
                  ),

                  const SizedBox(width: 20),
                  Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: 450,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: _carImageSection(context),
                        ),
                      )
                  ),

                  const SizedBox(width: 20),
                  Expanded(
                      flex: 3,
                      child: _searchBoxSection(context)
                  ),
                ],
              )
                  : Column(
                children: [
                  _heroTextSection(context),
                  const SizedBox(height: 40),
                  _carImageSection(context),
                  const SizedBox(height: 40),
                  _searchBoxSection(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _heroTextSection(BuildContext context) {
    final bool isDesktop = AppSizes.isWeb(context);
    return Column(
      crossAxisAlignment:
      isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          TextString.homeTitle,
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          style: TTextTheme.h1Style(context),
        ),
        const SizedBox(height: 20),
        Text(
          TextString.homeSubtitle,
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          style: TTextTheme.bodyRegular16white(context),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: AppColors.primaryColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text(
            "View all cars",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      ],
    );
  }
  Widget _carImageSection(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        ImageString.carImage,
        fit: BoxFit.contain,
        alignment: Alignment.bottomCenter,
        width: AppSizes.isWeb(context) ? 600 : MediaQuery.of(context).size.width * 0.6,
      ),
    );
  }
  Widget _searchBoxSection(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Container(
      width: 380,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(TextString.searchCarRental, style: TTextTheme.h3Style(context)),
          const SizedBox(height: 12),

          _buildSearchCarDropdown(
              context, TextString.brand , controller.selectedBrand, id: 'brand'),
          const SizedBox(height: 8),

          _buildSearchCarDropdown(
              context,TextString.bodyType , controller.selectedBodyType,
              id: 'body_type'),
          const SizedBox(height: 8),

          _buildSearchCarDropdown(
              context,TextString.fuelType , controller.selectedFuelType,
              id: 'fuel_type'),
          const SizedBox(height: 8),

          _buildSearchCarDropdown(
              context,TextString.transmission , controller.selectedTransmission,
              id: 'transmission'),
          const SizedBox(height: 8),

          _buildInputField(TextString.price, context),

          const SizedBox(height: 12),

          PrimaryBtnOfHome(
            height: 42,
            width: double.infinity,
            text: "Search Rental Cars",
            onTap: () {},
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
  Widget _buildSearchCarDropdown(BuildContext context, String label, RxString selected, {required String id}) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      bool isOpen = controller.openedDropdown3.value == id;
      List<String> items = controller.getFilteredItems(id);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          LayoutBuilder(builder: (context, constraints) {
            return PopupMenuButton<String>(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  maxWidth: constraints.maxWidth
              ),
              offset: const Offset(0, 48),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Colors.white,
              elevation: 4,
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
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.signaturePadColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.toolBackground),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        selected.value.isEmpty ? "$label" : selected.value,
                        style: TTextTheme.bodyRegular16black(context),
                      ),
                    ),
                    // Dropdown Icon
                    Icon(
                      isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: AppColors.quadrantalTextColor,
                      size: 20,
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
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: TextField(
                        cursorColor: Colors.black,
                        onChanged: (val) => controller.searchCarText.value = val,
                        style: TTextTheme.bodyRegular16black(context),
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TTextTheme.bodyRegular16black(context),
                          prefixIcon: const Icon(Icons.search, color: AppColors.primaryColor, size: 18),
                          filled: true,
                          fillColor: AppColors.backgroundOfScreenColor,
                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: AppColors.toolBackground),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:  BorderSide(color: AppColors.toolBackground),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:  BorderSide(color: AppColors.toolBackground),
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
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected ? AppColors.primaryColor : Colors.transparent,
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: 2,
                              ),
                            ),
                            child: isSelected
                                ? const Center(
                              child: Icon(
                                Icons.done,
                                color: AppColors.whiteColor,
                                size: 14,
                              ),
                            )
                                : null,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            item,
                            style: TTextTheme.medium16black(context)
                          ),
                        ],
                      ),
                    );
                  }),
                ];
              },
            );
          }),
        ],
      );
    });
  }
  Widget _buildInputField(String label, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.backgroundOfScreenColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            keyboardType: TextInputType.number,
            cursorColor: AppColors.blackColor,
            style: TTextTheme.bodyRegular16black(context),
            decoration: InputDecoration(
              hintText: "Enter Price",
              hintStyle: TTextTheme.bodyRegular16black(context),
              border: InputBorder.none,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ],
    );
  }

   // Featured Cars
  Widget _buildFeaturedCars(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding(context), vertical: 40),
      child: Column(
        children: [
          _buildCategoryHeader(context, TextString.rentsByBrand, onViewAll: () {}),
          const SizedBox(height: 20),
          _buildCategoryGrid(context, [
            {'name': 'Toyota', 'icon': IconString.toyota},
            {'name': 'Honda', 'icon': IconString.honda},
            {'name': 'KIA', 'icon': IconString.kia},
            {'name': 'Tesla', 'icon': IconString.tesla},
            {'name': 'Hyundai', 'icon': IconString.Hyundai},
            {'name': 'Suzuki', 'icon': IconString.suzukiPNG},
          ]),

          const SizedBox(height: 50),

          _buildCategoryHeader(context, TextString.rentsByBodyType, showViewAll: false),
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
  Widget _buildCategoryHeader(BuildContext context, String title, {VoidCallback? onViewAll, bool showViewAll = true}) {
    return Container(
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
                    const Icon(Icons.arrow_forward, color: Colors.red, size: 18),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
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
        return Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: AppColors.fieldsBackground.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 5)),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              items[index]['icon'].endsWith('.svg')
                  ? SvgPicture.asset(items[index]['icon'], height: 40, width: 40, fit: BoxFit.contain)
                  : Image.asset(items[index]['icon'], height: 60, width: 60, fit: BoxFit.contain),

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

    // working Section
  Widget _buildHowItWorksSection(BuildContext context) {
    final bool isDesktop = AppSizes.isWeb(context);

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color:AppColors.backgroundOfScreenColor,
            child: Opacity(
              opacity: 0.5,
              child: SvgPicture.asset(
                ImageString.background,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.horizontalPadding(context),
            vertical: 80,
          ),
          child: Column(
            children: [
               Text(
                TextString.rentACarTitle,
                style: TTextTheme.h4Style(context)
              ),
              const SizedBox(height: 15),
               Text(
                TextString.rentACarSubtitle,
                textAlign: TextAlign.center,
                style: TTextTheme.medium16black(context),
              ),
              const SizedBox(height: 60),
              isDesktop
                  ? Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: _howItWorksSteps(context),
                    ),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    flex: 1,
                    child: Image.asset(ImageString.rentImage, fit: BoxFit.contain)
                  ),
                ],
              )
                  : Column(
                children: [
                  ..._howItWorksSteps(context),
                  const SizedBox(height: 40),
                  Image.asset(ImageString.rentImage, fit: BoxFit.contain)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  List<Widget> _howItWorksSteps(BuildContext context) {
    return [
      _buildStepCard(
        context,
        svgPath: IconString.rentSearch,
        title: TextString.rentACarTitle1,
        description:TextString.rentACarSubtitle1,
      ),
      const SizedBox(height: 20),
      _buildStepCard(
        context,
        svgPath: IconString.rentCalendar,
        title: TextString.rentACarTitle2,
        description: TextString.rentACarSubtitle2,
      ),
      const SizedBox(height: 20),
      _buildStepCard(
        context,
        svgPath: IconString.rideIcon,
        title:TextString.rentACarTitle3 ,
        description: TextString.rentACarSubtitle3,
      ),
    ];
  }
  Widget _buildStepCard(BuildContext context,{required String svgPath, required String title, required String description}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: AppColors.fieldsBackground.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 5)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.backgroundOfScreenColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SvgPicture.asset(
              svgPath,
              colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TTextTheme.h5Style(context),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TTextTheme.bodyRegular16black(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

   // Grids Section
  Widget _buildBestOffersSection(BuildContext context) {
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
          _buildCategoryHeader(context, TextString.bestPriceTitle, onViewAll: () {}),
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
          BoxShadow(color: AppColors.fieldsBackground.withOpacity(0.02), blurRadius: 15, offset: const Offset(0, 8)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Image.asset(
                image, 
                fit: BoxFit.contain,
              ),
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
                    _buildMiniSpec(context,IconString.auto, gear),
                    _buildMiniSpec(context,IconString.electric, fuel),
                    _buildMiniSpec(context,IconString.litres, liters),
                  ],
                ),

                const SizedBox(height: 25),

                PrimaryBtnOfHome(
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
  }

   // choose Us
  Widget _buildWhyChooseUs(BuildContext context) {
    final bool isDesktop = AppSizes.isWeb(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 80,
      ),
      child: Column(
        children: [
           Text(
            TextString.chooseUsTitle,
            style: TTextTheme.h4Style(context),
          ),
          const SizedBox(height: 15),
           Text(
           TextString.chooseUsSubtitle,
            textAlign: TextAlign.center,
            style: TTextTheme.medium16black(context),
          ),
          const SizedBox(height: 60),
          LayoutBuilder(builder: (context, constraints) {
            if (isDesktop) {
              return Wrap(
                spacing: 30,
                runSpacing: 30,
                children: _featureCardsList(context).map((card) => SizedBox(
                  width: (constraints.maxWidth - 30) / 2,
                  child: card,
                )).toList(),
              );
            } else {
              return Column(
                children: _featureCardsList(context).map((card) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: card,
                )).toList(),
              );
            }
          }),
        ],
      ),
    );
  }
  List<Widget> _featureCardsList(BuildContext context) {
    return [
      _buildFeatureCard(
        context,
        svgPath: IconString.quality,
        title: TextString.chooseUsTitle1,
        desc: TextString.chooseUsSubtitle1,
      ),
      _buildFeatureCard(
        context,
        svgPath: IconString.rates,
        title: TextString.chooseUsTitle2,
        desc: TextString.chooseUsSubtitle2,
      ),
      _buildFeatureCard(
        context,
        svgPath: IconString.booking,
        title:TextString.chooseUsTitle3 ,
        desc:TextString.chooseUsSubtitle3 ,
      ),
      _buildFeatureCard(
        context,
        svgPath: IconString.customer,
        title: TextString.chooseUsTitle4,
        desc: TextString.chooseUsSubtitle4,
      ),
    ];
  }
  Widget _buildFeatureCard(BuildContext context,{required String svgPath, required String title, required String desc}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: AppColors.fieldsBackground.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 5)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.backgroundOfScreenColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              svgPath,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn
              ),
              width: 24,
              height: 24,
              placeholderBuilder: (context) => Icon(
                  Icons.image_not_supported,
                  color: AppColors.primaryColor,
                  size: 24
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TTextTheme.h5Style(context),
                ),
                const SizedBox(height: 8),
                Text(
                  desc,
                  style: TTextTheme.bodyRegular16black(context),
                  softWrap: true, 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

   // Testimonial
  Widget _buildTestimonialsSection(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final bool isDesktop = AppSizes.isWeb(context);

    final List<Widget> testimonialItems = [
      _buildTestimonialCard(context,TextString.name1, TextString.customerText, ImageString.pic1),
      _buildTestimonialCard(context,TextString.name2, TextString.customerText, ImageString.pic2),
      _buildTestimonialCard(context,TextString.name3, TextString.customerText, ImageString.pic3),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      color: AppColors.backgroundOfScreenColor,
      child: Column(
        children: [
           Text(
            TextString.customerTitle,
            style: TTextTheme.h4Style(context),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
             TextString.customerSubtitle,
              textAlign: TextAlign.center,
              style: TTextTheme.medium16black(context),
            ),
          ),
          const SizedBox(height: 50),
          CarouselSlider(
            items: testimonialItems,
            carouselController: controller.carouselController,
            options: CarouselOptions(
              height: 350,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: isDesktop ? 0.33 : 0.85,
              onPageChanged: (index, reason) {
                controller.currentTestimonialIndex.value = index;
              },
            ),
          ),

          const SizedBox(height: 30),
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: testimonialItems.asMap().entries.map((entry) {
              bool isActive = controller.currentTestimonialIndex.value == entry.key;
              return GestureDetector(
                onTap: () => controller.carouselController.animateToPage(entry.key),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isActive ? 12.0 : 10.0,
                  height: isActive ? 12.0 : 10.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? AppColors.primaryColor : AppColors.tertiaryTextColor,
                  ),
                ),
              );
            }).toList(),
          )),
        ],
      ),
    );
  }
Widget _buildTestimonialCard(BuildContext context, String name, String role, String imagePath) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        margin: const EdgeInsets.only(top: 35),
        padding: const EdgeInsets.fromLTRB(25, 45, 25, 20),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: AppColors.fieldsBackground.withOpacity(0.03),
                blurRadius: 15,
                offset: const Offset(0, 10)
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(5, (index) => const Icon(Icons.star, color: AppColors.primaryColor, size: 18)),
            ),

            const SizedBox(height: 10),
            Flexible(
              child: SingleChildScrollView(
                child: Text(
                 TextString.cardText,
                  style: TTextTheme.bodyRegular16black(context),
                ),
              ),
            ),

            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TTextTheme.titleOne(context).copyWith(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  role,
                  style: TTextTheme.titleTwo(context).copyWith(fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        top: 0,
        left: 25,
        child: CircleAvatar(
          radius: 35,
          backgroundColor: AppColors.whiteColor,
          child: CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
      ),
    ],
  );
}

   // Faqs
  Widget _buildFAQsSection(BuildContext context) {
    final bool isDesktop = AppSizes.isWeb(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 80,
      ),
      color: AppColors.backgroundOfScreenColor,
      child: isDesktop
          ? Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: _buildFAQHeader(context)),
          const SizedBox(width: 50),
          Expanded(flex: 1, child: _buildFAQList(context)),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFAQHeader(context),
          const SizedBox(height: 40),
          _buildFAQList(context),
        ],
      ),
    );
  }
  Widget _buildFAQHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          TextString.faqTitle,
          style: TTextTheme.h1StyleBlack(context)),
        const SizedBox(height: 20),
         Text(
         TextString.faqSubtitle,
          style: TTextTheme.medium16black(context),
        ),
      ],
    );
  }
  Widget _buildFAQList(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.signaturePadColor),
      ),
      child: Column(
        children: [
          _buildFAQItem(
            context,
            TextString.faqTitle1,
            TextString.faqSubtitle1,
            isFirst: true,
          ),
          _buildFAQItem(
            context,
            TextString.faqTitle2,
           TextString.faqSubtitle2,
          ),
          _buildFAQItem(
            context,
            TextString.faqTitle3,
            TextString.faqSubtitle3,
          ),
          _buildFAQItem(
            context,
            TextString.faqTitle4,
            TextString.faqSubtitle4,
            isLast: true,
          ),
        ],
      ),
    );
  }
  Widget _buildFAQItem(BuildContext context,String question, String answer, {bool isFirst = false, bool isLast = false}) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: Column(
        children: [
          ExpansionTile(
            title: Text(
              question,
              style: TTextTheme.h5Style(context),
            ),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            iconColor: AppColors.primaryColor,
            collapsedIconColor: AppColors.primaryColor,
            trailing: const Icon(Icons.add),
            children: [
              Text(
                answer,
                style: TTextTheme.bodyRegular16(context),
              ),
            ],
          ),
          if (!isLast)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(color: AppColors.blackColor, height: 1),
            ),
        ],
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
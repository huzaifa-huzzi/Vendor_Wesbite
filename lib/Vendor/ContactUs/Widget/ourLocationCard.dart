import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as ll;
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class OurLocationCard extends StatefulWidget {
  const OurLocationCard({super.key});

  @override
  State<OurLocationCard> createState() => _OurLocationCardState();
}

class _OurLocationCardState extends State<OurLocationCard> {
  static const ll.LatLng _initialCenter = ll.LatLng(-37.8136, 144.9631);

  final List<Marker> _mapMarkers = [
    Marker(
      point: const ll.LatLng(-37.8014, 144.9797),
      width: 40,
      height: 40,
      child: const Icon(
        Icons.location_on,
        color: AppColors.primaryColor,
        size: 35,
      ),
    ),
    Marker(
      point: const ll.LatLng(-37.8140, 144.9660),
      width: 40,
      height: 40,
      child: const Icon(
        Icons.location_on,
        color: AppColors.primaryColor,
        size: 35,
      ),
    ),
    Marker(
      point: const ll.LatLng(-37.8073, 144.9912),
      width: 40,
      height: 40,
      child: const Icon(
        Icons.location_on,
        color: AppColors.primaryColor,
        size: 35,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 750;
        bool isUltraSmall = width < 320;

        return Container(
          width: double.infinity,
          color: AppColors.backgroundOfScreenColor,
          padding: EdgeInsets.symmetric(vertical: isUltraSmall ? 25 : 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Text(
                      TextString.locationTitle,
                      style: TTextTheme.h1StyleBlack(context),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: isUltraSmall ? 6 : 12),
                    Text(
                     TextString.locationSubtitle,
                      style: TTextTheme.medium16black(context),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              SizedBox(
                height: isUltraSmall ? 250 : 400,
                width: double.infinity,
                child: FlutterMap(
                  options: const MapOptions(
                    initialCenter: _initialCenter,
                    initialZoom: 12.5,
                    interactionOptions: InteractionOptions(
                      flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                    ),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: _mapMarkers,
                    ),
                  ],
                ),
              ),

              SizedBox(height: isUltraSmall ? 30 : 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 60),
                child: isMobile
                    ? Column(
                  children: [
                    _buildLocationDetail(context, IconString.location, TextString.location1Title, TextString.location1Subtitle, "150 Brunswick Street\nFitzroy VIC 3065 AU", isUltraSmall),
                    SizedBox(height: isUltraSmall ? 25 : 40),
                    _buildLocationDetail(context, IconString.location, TextString.location2Title, TextString.location2Subtitle, "50 Flinders Street\nMelbourne VIC 3000 AU", isUltraSmall),
                    SizedBox(height: isUltraSmall ? 25 : 40),
                    _buildLocationDetail(context, IconString.location, TextString.location3Title, TextString.location3Subtitle, "100 Smith Street\nCollingwood VIC 3066 AU", isUltraSmall),
                  ],
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildLocationDetail(context, IconString.location, TextString.location1Title, TextString.location1Subtitle, "150 Brunswick Street\nFitzroy VIC 3065 AU", isUltraSmall)),
                    const SizedBox(width: 15),
                    Expanded(child: _buildLocationDetail(context, IconString.location, TextString.location2Title, TextString.location2Subtitle, "50 Flinders Street\nMelbourne VIC 3000 AU", isUltraSmall)),
                    const SizedBox(width: 15),
                    Expanded(child: _buildLocationDetail(context, IconString.location, TextString.location3Title, TextString.location3Subtitle, "100 Smith Street\nCollingwood VIC 3066 AU", isUltraSmall)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// --------- Extra Info Card Renderer -------- ///

  Widget _buildLocationDetail(
      BuildContext context,
      String svgIconPath,
      String title,
      String timing,
      String address,
      bool isUltraSmall,
      ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgIconPath,
            height: isUltraSmall ? 16 : 20,
            width: isUltraSmall ? 16 : 20,
            colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
          ),
          SizedBox(height: isUltraSmall ? 10 : 16),
          Text(
            title,
            style: TTextTheme.h2StyleOtherModule(context),
            textAlign: TextAlign.center,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.visible,
          ),
          const SizedBox(height: 4),
          Text(
            timing,
            style: TTextTheme.bodyRegular16SecondarColor(context),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          SizedBox(height: isUltraSmall ? 6 : 10),
          Text(
            address,
            style: TTextTheme.bodySemiBold16(context),
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class ServiceStatsSection extends StatelessWidget {
  const ServiceStatsSection({super.key});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 750;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: 80,
          horizontal: isMobile ? 20 : 80
      ),
      color: AppColors.backgroundOfScreenColor,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 50,
        spacing: 20,
        children: [
          _buildStatItem(
            context:context,
            target: 20,
            suffix: "k+",
            label: TextString.statItem1,
          ),
          _buildStatItem(
            context: context,
              target: 540,
              suffix: "+",
              label: TextString.StatItem2
          ),
          _buildStatItem(
            context: context,
              target: 25,
              suffix: "+",
              label: TextString.StatItem3
          ),
        ],
      ),
    );
  }

  /// ----------- Extra Widget -------- ///

  //  REUSABLE ITEM BUILDER
  Widget _buildStatItem({
    required BuildContext context,
    required int target,
    required String suffix,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: target.toDouble()),
          duration: const Duration(seconds: 10),
          curve: Curves.easeOutExpo,
          builder: (context, value, child) {
            return Text(
              "${value.toInt()}$suffix",
              style: TTextTheme.hCounter(context),
            );
          },
        ),
        const SizedBox(height: 12),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TTextTheme.h2StyleOtherModule(context),
        ),
      ],
    );
  }
}
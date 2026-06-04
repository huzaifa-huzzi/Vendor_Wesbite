import 'package:get/get.dart';
import 'package:vendor_website/Resources/ImageString.dart';

enum GettingStartedView { mainDashboard, firstRentalGuide, requiredDocuments, bookingTips }

class HelpCenterController extends GetxController {
  var currentView = GettingStartedView.mainDashboard.obs;
  var activeDocumentTab = "Local".obs;

  void switchView(GettingStartedView newView) {
    currentView.value = newView;
  }

  void switchDocumentTab(String tabName) {
    activeDocumentTab.value = tabName;
  }

  void resetToDashboard() {
    currentView.value = GettingStartedView.mainDashboard;
  }
  String get dynamicTitle {
    switch (currentView.value) {
      case GettingStartedView.firstRentalGuide:
        return "Your First Rental Complete Guide";
      case GettingStartedView.requiredDocuments:
        return "What Documents do you need ?";
      case GettingStartedView.bookingTips:
        return "Tips for Smooth Booking";
      case GettingStartedView.mainDashboard:
      default:
        return "Help Center";
    }
  }
  String get dynamicBackgroundImage {
    switch (currentView.value) {
      case GettingStartedView.firstRentalGuide:
        return ImageString.HelpCenter1;
      case GettingStartedView.requiredDocuments:
        return ImageString.HelpCenter2;
      case GettingStartedView.bookingTips:
        return ImageString.HelpCenter4;
      case GettingStartedView.mainDashboard:
      default:
        return ImageString.HelpCenter1;
    }
  }

  bool get isSubViewDetail => currentView.value != GettingStartedView.mainDashboard;
}
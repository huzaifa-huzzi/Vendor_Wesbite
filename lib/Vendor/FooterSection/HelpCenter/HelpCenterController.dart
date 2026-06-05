import 'package:get/get.dart';
import 'package:vendor_website/Resources/ImageString.dart';


enum GettingStartedView { mainDashboard, firstRentalGuide, requiredDocuments, bookingTips }


enum DocumentFlowView {
  documentsDashboard,
  idVerification,
  internationalPermit,
  paymentMethods
}

enum PricingFlowView {
  pricingDashboard,
  howPricingWorks,
  fuelPolicy,
  tollCharges
}

enum TroubleShootingFlowView {
  supportDashboard,
  breakdown,
  accident,
  lateReturn
}

enum LogisticsFlowView {
  logisticsDashboard,
  pickupProcess,
  returnChecklist,
  keyDropOff
}

enum InsuranceFlowView {
  insuranceDashboard,
  coverageOptions,
  reportDamage,
  personalInsurance
}

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



    /// Required Documents
  var currentDocumentView = DocumentFlowView.documentsDashboard.obs;

  void switchDocumentView(DocumentFlowView newView) {
    currentDocumentView.value = newView;
  }
  void resetDocumentToDashboard() {
    currentDocumentView.value = DocumentFlowView.documentsDashboard;
  }
  String get dynamicDocumentTitle {
    switch (currentDocumentView.value) {
      case DocumentFlowView.idVerification:
        return "ID Verification Requirements";
      case DocumentFlowView.internationalPermit:
        return "International Driving Permits";
      case DocumentFlowView.paymentMethods:
        return "Accepted Payment Methods";
      case DocumentFlowView.documentsDashboard:
      default:
        return "Required Documents";
    }
  }
  String get dynamicDocumentBackgroundImage {
    switch (currentDocumentView.value) {
      case DocumentFlowView.idVerification:
        return ImageString.requiredDocument4;
      case DocumentFlowView.internationalPermit:
        return ImageString.requiredDocument2;
      case DocumentFlowView.paymentMethods:
        return ImageString.requiredDocument3;
      case DocumentFlowView.documentsDashboard:
        return ImageString.requiredDocument1;
      default:
        return ImageString.requiredDocument1;
    }
  }
  bool get isDocumentSubViewDetail => currentDocumentView.value != DocumentFlowView.documentsDashboard;

   /// Pricing and Biiling
  var currentPricingView = PricingFlowView.pricingDashboard.obs;

  void switchPricingView(PricingFlowView newView) {
    currentPricingView.value = newView;
  }

  void resetPricingToDashboard() {
    currentPricingView.value = PricingFlowView.pricingDashboard;
  }

  String get dynamicPricingTitle {
    switch (currentPricingView.value) {
      case PricingFlowView.howPricingWorks:
        return "Rate Structure";
      case PricingFlowView.fuelPolicy:
        return "Full to Full Policy";
      case PricingFlowView.tollCharges:
        return "Toll Transponders";
      case PricingFlowView.pricingDashboard:
      default:
        return "Pricing";
    }
  }

  String get dynamicPricingTitle2 {
    switch (currentPricingView.value) {
      case PricingFlowView.howPricingWorks:
        return "How our Pricing Works";
      case PricingFlowView.fuelPolicy:
        return "Full Policy Explained";
      case PricingFlowView.tollCharges:
        return "How Toll Charges Work";
      case PricingFlowView.pricingDashboard:
      default:
        return "Pricing";
    }
  }

  String get dynamicPricingBackgroundImage {
    switch (currentPricingView.value) {
      case PricingFlowView.howPricingWorks:
        return ImageString.pricing2;
      case PricingFlowView.fuelPolicy:
        return ImageString.pricing3;
      case PricingFlowView.tollCharges:
        return ImageString.pricing4;
      case PricingFlowView.pricingDashboard:
        return ImageString.pricing1;
      default:
        return ImageString.pricing1;
    }
  }

  bool get isPricingSubViewDetail => currentPricingView.value != PricingFlowView.pricingDashboard;

   /// TroubleShooting
  var currentTroubleView = TroubleShootingFlowView.supportDashboard.obs;

  void switchTroubleView(TroubleShootingFlowView newView) {
    currentTroubleView.value = newView;
  }

  void resetTroubleToDashboard() {
    currentTroubleView.value = TroubleShootingFlowView.supportDashboard;
  }

  String get dynamicTroubleTitle {
    switch (currentTroubleView.value) {
      case TroubleShootingFlowView.breakdown:
        return "Immediate Steps";
      case TroubleShootingFlowView.accident:
        return "At the scene";
      case TroubleShootingFlowView.lateReturn:
        return "Grace Period";
      case TroubleShootingFlowView.supportDashboard:
      default:
        return "Support";
    }
  }

  String get dynamicTroubleTitle2 {
    switch (currentTroubleView.value) {
      case TroubleShootingFlowView.breakdown:
        return "what do In a Breakdown";
      case TroubleShootingFlowView.accident:
        return "What Do after Accident";
      case TroubleShootingFlowView.lateReturn:
        return "Late Return Policy";
      case TroubleShootingFlowView.supportDashboard:
      default:
        return "TroubleShooting";
    }
  }

  String get dynamicTroubleBackgroundImage {
    switch (currentTroubleView.value) {
      case TroubleShootingFlowView.breakdown:
        return ImageString.trouble2;
      case TroubleShootingFlowView.accident:
        return ImageString.trouble3;
      case TroubleShootingFlowView.lateReturn:
        return ImageString.trouble4;
      case TroubleShootingFlowView.supportDashboard:
      default:
        return ImageString.trouble1;
    }
  }

  bool get isTroubleSubViewDetail => currentTroubleView.value != TroubleShootingFlowView.supportDashboard;

   /// Pickup & Return
  var currentLogisticsView = LogisticsFlowView.logisticsDashboard.obs;

  void switchLogisticsView(LogisticsFlowView newView) {
    currentLogisticsView.value = newView;
  }

  void resetLogisticsToDashboard() {
    currentLogisticsView.value = LogisticsFlowView.logisticsDashboard;
  }

  String get dynamicLogisticsTitle {
    switch (currentLogisticsView.value) {
      case LogisticsFlowView.pickupProcess:
        return "At the counter";
      case LogisticsFlowView.returnChecklist:
        return "Before Returning";
      case LogisticsFlowView.keyDropOff:
        return "Key Drop Procedure";
      case LogisticsFlowView.logisticsDashboard:
      default:
        return "Logistics";
    }
  }

  String get dynamicLogisticsTitle2 {
    switch (currentLogisticsView.value) {
      case LogisticsFlowView.pickupProcess:
        return "Vehicle Pick up process";
      case LogisticsFlowView.returnChecklist:
        return "Vehicle Return Checklist";
      case LogisticsFlowView.keyDropOff:
        return "After Hour Key Drop off";
      case LogisticsFlowView.logisticsDashboard:
      default:
        return "Pickup and Return";
    }
  }

  String get dynamicLogisticsBackgroundImage {
    switch (currentLogisticsView.value) {
      case LogisticsFlowView.pickupProcess:
        return ImageString.pickup2;
      case LogisticsFlowView.returnChecklist:
        return ImageString.pickup3;
      case LogisticsFlowView.keyDropOff:
        return ImageString.pickup4;
      case LogisticsFlowView.logisticsDashboard:
      default:
        return ImageString.pricing1;
    }
  }

  bool get isLogisticsSubViewDetail => currentLogisticsView.value != LogisticsFlowView.logisticsDashboard;

   /// Insurance
  var currentInsuranceView = InsuranceFlowView.insuranceDashboard.obs;

  void switchInsuranceView(InsuranceFlowView newView) {
    currentInsuranceView.value = newView;
  }

  void resetInsuranceToDashboard() {
    currentInsuranceView.value = InsuranceFlowView.insuranceDashboard;
  }

  String get dynamicInsuranceTitle {
    switch (currentInsuranceView.value) {
      case InsuranceFlowView.coverageOptions:
        return "Coverage Tiers";
      case InsuranceFlowView.reportDamage:
        return "New Damage During Rental";
      case InsuranceFlowView.personalInsurance:
        return "Personal Auto Insurance";
      case InsuranceFlowView.insuranceDashboard:
      default:
        return "Insurance";
    }
  }

  String get dynamicInsuranceTitle2 {
    switch (currentInsuranceView.value) {
      case InsuranceFlowView.coverageOptions:
        return "Insurance Coverage Option";
      case InsuranceFlowView.reportDamage:
        return "How to Report Damage";
      case InsuranceFlowView.personalInsurance:
        return "Using Your Personal Insurance";
      case InsuranceFlowView.insuranceDashboard:
      default:
        return "Insurance and Coverage";
    }
  }

  String get dynamicInsuranceBackgroundImage {
    switch (currentInsuranceView.value) {
      case InsuranceFlowView.coverageOptions:
        return ImageString.Insurance2;
      case InsuranceFlowView.reportDamage:
        return ImageString.Insurance3;
      case InsuranceFlowView.personalInsurance:
        return ImageString.Insurance4;
      case InsuranceFlowView.insuranceDashboard:
      default:
        return ImageString.Insurance1;
    }
  }

  bool get isInsuranceSubViewDetail => currentInsuranceView.value != InsuranceFlowView.insuranceDashboard;

}
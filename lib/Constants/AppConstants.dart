import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class AppConstants{

  //for images
  static const String serverUrlImages = "https://landlord.cityproperties.ae/";
  static const String serverUrlTechImages ="http://tenant.cityproperties.ae";
  static const String callUs ='tel://+97165114000';
  //en to ar
  static const String vacantUnitArabicUrl ='https://propertiesre.com/en/properties/property-detail.aspx?propId=';
  static const String vacantUnitEnglishUrl ='https://propertiesre.com/en/properties/property-detail.aspx?propId=';
  static const String cityCodeSharjah ='16';
  static const String cityCodeDubai ='15';
  static const String cityCodeAjman ='14';
  static const String cityCodeAbuDhabi ='23';




  // Live
 static const String serverUrl = "http://40.119.162.165:8080";
  static const String serverUrlExt = "/JobVisitm/Rest/";
  static const String baseUrl = serverUrl+serverUrlExt;

  // Local 1603
  // static const String serverUrl = "http://192.168.1.127:8080";
  // static const String serverUrlExt = "/JobVisit/Rest/";
  // static const String baseUrl = serverUrl+serverUrlExt;

  static const String login = 'credsTenant/tenantAuth';
  static const String forgetPassword = 'user/userforgotpassword';
  static const String register = 'RegisterV2/RegisterUser';
  static const String announcement = 'Announcement/Announcementdetails';
  static const String tenantStatement = 'TenantStatement/TenantStatementdetails';
  static const String duePaymentDays = 'Duepaymentdays/Duepaymentdaysdetails';
  static const String duePaymentImage = 'DuepaymentimagechequesImages/DuepaymentimagechequesImagesdetail';
  static const String chequeReturn = 'Listofchequereturn/Listofchequereturndetails';
  static const String monthlyPayment = 'Monthlypayment/Monthlypaymentdays';
  static const String notifications = 'GetTenantNotifications/notifications';
  static const String myRental = 'ListofMyrentalPropertyV2/ListofMyrentalPropertydetails';
  static const String myRentalDetails = 'PropertyDetail/Contract';
  static const String vacantUnit = 'Vacantunit/Vacantunitdetails';
  static const String profile = 'TenantProfile/TenantProfiledetails';
  static const String changePassword = 'ChangePassword/ChangePassworddetails';
  static const String maintenanceHistory = 'MaintenanceservicehistoryV2/Maintenancehistory';
  static const String techDetails = 'TechnicianDetails/TechnicianDetailsemploye';
  static const String jobMaterial = 'EmpMaterialIssuedDetails/EmpMaterialIssuedDetailsm';
  static const String myRate = 'RatingTenant/ViewRating';
  static const String jobRate = 'jobvisitRating/tenantRating';
  static const String jobDetails = 'JobVisitReceipt/getJobdetails';
  static const String serviceType = 'KserviceUnit/KserviceUnitDetails';
  static const String getLocations= "KComplainunitloc/KComplainunitlocdetails";
  static const String getComplaint= "Kcomplaintunit/Kcomplaintunitdetails";
  static const String newComplaint= "registermaintainrequestV2/registermaintainrequestcreate";

}

class Er {
  static String error = tr(LocaleKeys.lbl_some_thing_wrong);
  static String networkError = tr(LocaleKeys.check_connection);
}
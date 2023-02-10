
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/WebView/WebViewer.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void sendEmail(){
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'direct@propertiesre.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Getting in Touch through city properties Mobile app',
      }),
    );

    launchUrl(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.colorBGBrown,
      appBar: AppBar(

        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
            size: 22.sp,
          ),
        ),
        title: Text(LocaleKeys.ttl_contact_us.tr(),
        style: TextStyle(
          fontSize: 16.sp
        ),
        ),
      ),

      body:  SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Image.asset('assets/ic_mailus.png'),
                      iconSize: 50.w,
                      onPressed: () {
                        sendEmail();
                      },

                    ),
                    IconButton(
                      icon: Image.asset('assets/ic_telephone.png'),
                      iconSize: 50.w,
                      onPressed: () {
                        launchUrlString("tel:+97165114000");

                      },
                    ),
                    IconButton(
                      icon: Image.asset('assets/ic_map.png'),
                      iconSize: 50.w,
                      onPressed: () {
                        String url = "https://cityproperties.ae/en/contactus/contactus.aspx";
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> WebViewer(
                                url: url
                            )));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Text(
                  LocaleKeys.detail_contact_us.tr(),
                  style: TextStyle(
                    color: MyColors.white,
                    fontSize: 15.sp,
                    height: 1.4
                  ),

                ),
                SizedBox(height: 20.h,),
                
              ],
            ),

          ),
        ),
      ),
    );
  }
}

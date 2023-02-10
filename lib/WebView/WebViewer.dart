
import 'dart:io';

import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

class WebViewer extends StatefulWidget {
  final String url;
  const WebViewer({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewer> createState() => _WebViewerState();
}

class _WebViewerState extends State<WebViewer>  with BaseMixin{
  String url="";
  int pro=0;

  @override
  void initState() {
    // TODO: implement initState
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    url = widget.url;
    print(url);
    print("url");
   // if (Platform.isAndroid) WebView.platform = AndroidWebView();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
          size: 22.sp,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body:pro>-1? Stack(
        children: [
          WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              // _controller.complete(webViewController);
            },
            onProgress: (int progress) {
              print('progress $progress');

              if(progress==100) {
                pro=progress;
                setState(() {

              });
              }
            },
            onWebResourceError: (err){
              print('err $err');
              pro =-1;
              setState(() {

              });
            },
            navigationDelegate: (NavigationRequest request) {

              print('allowing navigation to $request');
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
            geolocationEnabled: true,//support geolocation or not
          ),
          if(pro<100)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                SizedBox(height: 10.h,),
                SizedBox(width: 1.sw,),
                // Material(
                //   color: Colors.transparent,
                //   child: Text('$pro %',style: TextStyle(
                //       fontSize: 16.sp,
                //       color: MyColors.colorBGBrown
                //   ),),
                // )

              ],
            ),

        ],
      ):Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(width: 1.sw,),
          Material(
            color: Colors.transparent,
            child: Text(LocaleKeys.check_connection.tr(),
            style: TextStyle(
              fontSize: 15.sp
            ),
            ),
          )

        ],
      ),
    );
  }
}

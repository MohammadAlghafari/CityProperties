
import 'dart:math';

import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/DashBoardPage/Bloc/dashboard_bloc.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/Announcement/AnnouncementPage.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/ChequeReturn/ChequeReturnPage.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/DuePayment/DuePaymentPage.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/MonthlyPayment/MonthlyPaymentPage.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/TenantStatement/TenantStatementPage.dart';
import 'package:cityproperties/Screens/Notifications/NotificationsPage.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





import 'Widgets/DashboardWidget.dart';


class DashBoardPage extends StatefulWidget {
  final DashboardBloc dashboardBloc;
  const DashBoardPage({Key? key, required this.dashboardBloc}) : super(key: key);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> with BaseMixin ,AutomaticKeepAliveClientMixin{





  @override
  void initState() {
    super.initState();

  }


  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(

        title: Text(LocaleKeys.tab_dashboard.tr(),
          style: TextStyle(
              fontSize: 17.sp
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/ic_noti_settings.png',
              color: MyColors.white,
            ),
            onPressed:  ()  {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const NotificationsPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
                      return AnimatedBuilder(
                        animation: rotateAnim,
                        child: child,
                        builder: (context, widget) {
                          final value =  min(rotateAnim.value, pi / 2) ;
                          return Transform(
                            transform: Matrix4.rotationY(value),
                            child: widget,
                            alignment: Alignment.center,
                          );
                        },
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 700),
                  ));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h,),
            DashboardWidget(voidCallback: () {
              Navigator.push(context, MaterialPageRoute(builder:
              (context) =>  AnnouncementPage(dashboardBloc: widget.dashboardBloc,),
              ));
            },
            title: LocaleKeys.ttl_announcement.tr(),
            body: LocaleKeys.detail_announcement.tr(),
              imageIcon: 'assets/announcement.png',
            ),
            SizedBox(height: 20.h,),
            DashboardWidget(voidCallback: () {
              Navigator.push(context, MaterialPageRoute(builder:
                  (context) =>  TenantStatementPage(
                    dashboardBloc: widget.dashboardBloc,
                  ),
              ));

            },
              title: LocaleKeys.ttl_tenant_statement.tr(),
              body: LocaleKeys.detail_tenant_statement.tr(),
              imageIcon: 'assets/ic_tenantstatement.png',
            ),
            SizedBox(height: 20.h,),
            DashboardWidget(voidCallback: () {
              Navigator.push(context, MaterialPageRoute(builder:
                  (context) =>  DuePaymentPage(
                    dashboardBloc: widget.dashboardBloc,
                  ),
              ));

            },
              title: LocaleKeys.ttl_due_payment.tr(),
              body: LocaleKeys.detail_due_payment.tr(),
              imageIcon: 'assets/ic_duepayment.png',
            ),
            SizedBox(height: 20.h,),
            DashboardWidget(voidCallback: () {
              Navigator.push(context, MaterialPageRoute(builder:
                  (context) =>  ChequeReturnPage(
                    dashboardBloc: widget.dashboardBloc,
                  ),
              ));

            },
              title: LocaleKeys.ttl_list_cheque_returns.tr(),
              body: LocaleKeys.detail_list_cheque_returns.tr(),
              imageIcon: 'assets/ic_cheque.png',
            ),
            SizedBox(height: 20.h,),
            DashboardWidget(voidCallback: () {
              Navigator.push(context, MaterialPageRoute(builder:
                  (context) =>  MonthlyPaymentPage(
                    dashboardBloc: widget.dashboardBloc,
                  ),
              ));

            },
              title: LocaleKeys.ttl_monthly_payment.tr(),
              body: LocaleKeys.detail_monthly_payment.tr(),
              imageIcon: 'assets/ic_monthlypayment.png',
            ),
            SizedBox(height: 30.h,),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;


}
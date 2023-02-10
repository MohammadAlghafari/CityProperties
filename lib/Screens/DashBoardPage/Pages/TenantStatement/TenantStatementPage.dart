import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomLists/ListHeader.dart';
import 'package:cityproperties/CustomLists/ListNotifications.dart';
import 'package:cityproperties/CustomLists/ListUnitDetail.dart';
import 'package:cityproperties/CustomWidgets/ErrorWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/DashBoardPage/Bloc/dashboard_bloc.dart';
import 'package:cityproperties/Screens/DashBoardPage/Bloc/dashboard_state.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/TenantStatement/Model/TenantStateModel.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TenantStatementPage extends StatefulWidget {
  final DashboardBloc dashboardBloc;

  const TenantStatementPage({Key? key,
    required this.dashboardBloc
  }) : super(key: key);

  @override
  State<TenantStatementPage> createState() => _TenantStatementPageState();
}

class _TenantStatementPageState extends State<TenantStatementPage>
    with BaseMixin {
  List <String> iconList = [
    'assets/ic_hash_tag.png',
    'assets/ic_start_run.png',
    'assets/ic_sleepy_worker.png',
    'assets/ic_give_money.png',
    'assets/ic_money_bag.png',
    'assets/ic_people_trading.png',
    'assets/outstandingamount.png',
  ];

  List<String> typeList = [
    LocaleKeys.ttl_contract_number.tr(),
    LocaleKeys.ttl_start_date.tr(),
    LocaleKeys.ttl_end_date.tr(),
    LocaleKeys.ttl_rent_amount.tr(),
    LocaleKeys.ttl_collected_amount.tr(),
    LocaleKeys.ttl_cleared_amount.tr(),
    LocaleKeys.ttl_outstand_amount.tr(),

  ];

  @override
  void initState() {
    // TODO: implement initState

    widget.dashboardBloc.add(GetTenantEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<DashboardBloc, DashboardState>(
      bloc: widget.dashboardBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColors.liteWhite,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back,
                size: 22.sp,
              ),
            ),
            title: Text(LocaleKeys.ttl_tenant_statement.tr(),
              style: TextStyle(
                  fontSize: 16.sp
              ),
            ),

          ),
          body: RefreshIndicator(
            onRefresh: ()async{
              widget.dashboardBloc.add(GetTenantEvent());
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  state.isLoading!?
                  SizedBox(
                      height: 0.9.sh,
                      child: const  Center(child: CircularProgressIndicator(),)):
                  state.tenantStateModel!.listTenant!=null&&state.tenantStateModel!.listTenant!.isNotEmpty?
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),

                      itemBuilder:
                          (context, index1) =>
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 40.h
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  color: MyColors.colorBGBrown,
                                  padding: EdgeInsets.all(16.w),
                                  child: Text(
                                    "${isArabic(context)?
                                    state.tenantStateModel!.listTenant![index1].dEVNAMEAR??"Dev Name":
                                    state.tenantStateModel!.listTenant![index1].dEVNAME??"Dev Name"} - "
                                        "${state.tenantStateModel!.listTenant![index1].sHORTCODE??""}",
                                    style: TextStyle(
                                        fontSize: 14.5.sp,
                                        color: MyColors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                ListView.builder(
                                  itemCount: iconList.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index2) {
                                    return ListUnitDetail(
                                      icon: iconList[index2],
                                      type: typeList[index2],
                                      value:getValue(index2,state.tenantStateModel!.listTenant![index1]) ,
                                    );
                                  },

                                ),
                              ],
                            ),
                          ),

                      itemCount: state.tenantStateModel!.listTenant!.length):
                      SizedBox(
                        height: 0.9.sh,
                        child: ErrorTextWidget(error: state.error!.isNotEmpty?state.error!:
                        LocaleKeys.ttl_No_Record_Available.tr(),),
                      )
                  ,


                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String getValue(int index, ListTenant tenant){

    switch(index){
      case 0:
        return tenant.cONTRACTNO??"";

      case 1:
        return tenant.sTDATE!=null? tenant.sTDATE!.substring(0,10):"";
      case 2:
        return tenant.eXPDATE!=null? tenant.eXPDATE!.substring(0,10):"";
      case 3:
        return tenant.tRANSRENT==null||tenant.tRANSRENT!.isEmpty?"0 ${LocaleKeys.ttl_aed.tr()}":
        '${tenant.tRANSRENT!} ${LocaleKeys.ttl_aed.tr()}';
      case 4:
        return tenant.cOLLECTEDAMOUNT==null||tenant.cOLLECTEDAMOUNT!.isEmpty?"0":
        '${tenant.cOLLECTEDAMOUNT!} ${LocaleKeys.ttl_aed.tr()}';
      case 5:
        return tenant.cLEAREDAMOUNT==null||tenant.cLEAREDAMOUNT!.isEmpty?"0":
        '${tenant.cLEAREDAMOUNT!} ${LocaleKeys.ttl_aed.tr()}';
      case 6:
        return tenant.oUTSTANDING==null||tenant.oUTSTANDING!.isEmpty?"0":tenant.oUTSTANDING!;


    }



    return '';
  }



}

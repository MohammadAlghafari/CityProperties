import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomLists/ListMaintenanceHistory.dart';
import 'package:cityproperties/CustomWidgets/ErrorWidget.dart';
import 'package:cityproperties/Screens/Maintenance/Bloc/maintenance_bloc.dart';
import 'package:cityproperties/Screens/Maintenance/Bloc/maintenance_state.dart';
import 'package:cityproperties/Screens/Maintenance/FilterPage.dart';
import 'package:cityproperties/Screens/Maintenance/Widgets/ComplaintDetail/ComplaintDetailPage.dart';
import 'package:cityproperties/Screens/NewComplaint/NewComplaintPage.dart';
import 'package:cityproperties/injection.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaintenanceHistoryPage extends StatefulWidget {
  final String? shortCode;
  final String? propertyCode;
  final String? propertyName;
  final String? devCode;

  const MaintenanceHistoryPage(
      {Key? key,
      required this.shortCode,
      required this.propertyCode,
      required this.devCode,
      required this.propertyName
      })
      : super(key: key);

  @override
  _MaintenanceHistoryPageState createState() => _MaintenanceHistoryPageState();
}

class _MaintenanceHistoryPageState extends State<MaintenanceHistoryPage> {
  late MaintenanceBloc maintenanceBloc;

  String statusValue = "All";
  String categoryValue = "All";

  bool filterEmpty = true;

  @override
  void initState() {
    maintenanceBloc = sl<MaintenanceBloc>();
    maintenanceBloc
        .add(GetMaintenanceHistoryEvent(shortCode: widget.shortCode!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaintenanceBloc, MaintenanceState>(
      bloc: maintenanceBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColors.liteWhite,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 22.sp,
              ),
            ),
            title: Text(
              LocaleKeys.ttl_maintainance_history.tr(),
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilterPage(
                                categoryValue: categoryValue,
                                statusValue: statusValue,
                              ))).then((value) {
                    if (value is List) {
                      statusValue = value[0];
                      print(value[0]);
                      categoryValue = value[1];
                      maintenanceBloc.add(FilterMaintenanceHistoryEvent(
                          statusValue: statusValue,
                          categoryValue: categoryValue));
                    }
                  });
                },
                icon: Image.asset(
                  'assets/filter.png',
                  width: 24.w,
                  height: 24.w,
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              elevation: 0.0,
              backgroundColor: MyColors.colorBGBrown,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewComplaintPage(
                              shortCode: widget.shortCode!,
                              propertyCode: widget.propertyCode!,
                              devCode: widget.devCode!,
                          propertyName: widget.propertyName!,
                            ))).then((value) {
                  print("value");
                  print(value);
                  print("value");
                  if (value is bool) {
                    statusValue = "All";
                    categoryValue = "All";
                    maintenanceBloc.add(GetMaintenanceHistoryEvent(
                        shortCode: widget.shortCode!));
                  }
                });
              },
              child: Icon(
                Icons.add,
                size: 22.w,
              )),
          body: state.isLoading!
              ? SizedBox(
                  height: 0.9.sh,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : state.filterMaintenanceHistoryModel!.listMaintenanceHistory !=
                          null &&
                      state.filterMaintenanceHistoryModel!
                          .listMaintenanceHistory!.isNotEmpty
                  ? SafeArea(
                      child: Container(
                        color: MyColors.liteWhite,
                        child: RefreshIndicator(
                          onRefresh: () async {
                            statusValue = "All";
                            categoryValue = "All";
                            maintenanceBloc.add(GetMaintenanceHistoryEvent(
                                shortCode: widget.shortCode!));
                          },
                          child: ListView.separated(
                              itemCount: state.filterMaintenanceHistoryModel!
                                  .listMaintenanceHistory!.length,
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 10.w),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ComplaintDetailPage(
                                                      listMaintHistory: state
                                                          .filterMaintenanceHistoryModel!
                                                          .listMaintenanceHistory![index],
                                                    )));
                                      },
                                      child: ListMaintenanceHistoryWidget(
                                        complaint: state
                                                .filterMaintenanceHistoryModel!
                                                .listMaintenanceHistory![index]
                                                .cOMPLAINTDESC ??
                                            "",
                                        jobNo: state
                                                .filterMaintenanceHistoryModel!
                                                .listMaintenanceHistory![index]
                                                .cMDNO ??
                                            "",
                                        requestType: state
                                                .filterMaintenanceHistoryModel!
                                                .listMaintenanceHistory![index]
                                                .sERVICETYPENAME ??
                                            "",
                                        spotDesc: state
                                                .filterMaintenanceHistoryModel!
                                                .listMaintenanceHistory![index]
                                                .sPOTDESC ??
                                            "",
                                        status: state
                                                .filterMaintenanceHistoryModel!
                                                .listMaintenanceHistory![index]
                                                .sTATUSNAME ??
                                            "",
                                      )),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 7.h,
                                );
                              }),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 0.9.sh,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          statusValue = "All";
                          categoryValue = "All";
                          maintenanceBloc.add(GetMaintenanceHistoryEvent(
                              shortCode: widget.shortCode!));
                        },
                        child: ListView(
                          children: [
                            SizedBox(
                              height: 0.45.sh,
                            ),
                            ErrorTextWidget(
                              error: state.error!.isNotEmpty
                                  ? state.error!
                                  : LocaleKeys.ttl_NoMaintanance.tr(),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [MaterialButton(
                                onPressed: () {
                                  statusValue = "All";
                                  categoryValue = "All";
                                  maintenanceBloc.add(
                                      FilterMaintenanceHistoryEvent(
                                          statusValue: statusValue,
                                          categoryValue: categoryValue));
                                },
                                color: MyColors.colorPrimary,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8.h,
                                    horizontal: 12.w
                                  ),
                                  child: Text(
                                    'Reset Filter',
                                    style: TextStyle(
                                        color: MyColors.liteWhite, fontSize: 13.sp),
                                  ),
                                ),
                              ),],
                            )
                          ],
                        ),
                      ),
                    ),
        );
      },
    );
  }
}

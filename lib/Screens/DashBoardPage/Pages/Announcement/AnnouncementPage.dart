import 'package:cityproperties/CustomColors/MyColors.dart';
import 'dart:ui' as ui;
import 'package:cityproperties/CustomWidgets/ErrorWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/DashBoardPage/Bloc/dashboard_bloc.dart';
import 'package:cityproperties/Screens/DashBoardPage/Bloc/dashboard_state.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnouncementPage extends StatefulWidget {
  final DashboardBloc dashboardBloc;

  const AnnouncementPage({Key? key, required this.dashboardBloc})
      : super(key: key);

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> with BaseMixin {
  //late NotificationsBloc _bloc;
  List dataList = [], todayList = [], prevList = [];

  @override
  void initState() {
    widget.dashboardBloc.add(GetAnnouncementEvent());
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
              icon: Icon(
                Icons.arrow_back,
                size: 22.sp,
              ),
            ),
            title: Text(
              LocaleKeys.ttl_announcement.tr(),
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          body: SafeArea(
              child: state.isLoading!
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        widget.dashboardBloc.add(GetAnnouncementEvent());
                      },
                      child: state.announcementModel!.listAnnouncement !=
                                  null &&
                              state.announcementModel!.listAnnouncement!
                                  .isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.only(top: 30.h),
                              child: ListView.separated(
                                  itemBuilder: (context, index) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: MyColors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.w),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0.sp),
                                            child: Column(
                                              children: [
                                                Row(
                                                  textDirection: ui.TextDirection.ltr,
                                                  children: [
                                                    Image.asset(
                                                      'assets/pushpin.png',
                                                      width: 40.w,
                                                    ),
                                                    SizedBox(
                                                      width: 6.w,
                                                    ),
                                                    Expanded(
                                                        child: Text(

                                                      state
                                                          .announcementModel!
                                                          .listAnnouncement![
                                                              index]
                                                          .tITLE!,
                                                      style: TextStyle(
                                                          fontSize: 15.sp,
                                                          color: MyColors
                                                              .colorBGBrown,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                          textAlign: TextAlign.start,
                                                          textDirection: ui.TextDirection.ltr,
                                                    )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  textDirection: ui.TextDirection.ltr,
                                                  children: [
                                                    Expanded(
                                                        child: Html(
                                                          style: {
                                                            "body": Style(
                                                              textAlign: TextAlign.start,
                                                              fontSize:FontSize(14.5.sp
                                                              ) ,

                                                              direction: ui.TextDirection.ltr,
                                                            ),},


                                                      data: state
                                                          .announcementModel!
                                                          .listAnnouncement![
                                                              index]
                                                          .nEWSDETAIL!,
                                                    )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 12.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                  itemCount: state.announcementModel!
                                      .listAnnouncement!.length),
                            )
                          : ListView(
                              children: [
                                SizedBox(
                                  height: 0.9.sh,
                                  child: ErrorTextWidget(
                                    error: state.error!.isNotEmpty
                                        ? state.error!
                                        : LocaleKeys.ttl_No_Record_Available
                                            .tr(),
                                  ),
                                )
                              ],
                            ),
                    )),
        );
      },
    );
  }
}

import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomLists/ListHeader.dart';
import 'package:cityproperties/CustomLists/ListNotifications.dart';
import 'package:cityproperties/CustomWidgets/ErrorWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/Notifications/Bloc/notification_bloc.dart';
import 'package:cityproperties/Screens/Notifications/Bloc/notification_state.dart';
import 'package:cityproperties/injection.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> with BaseMixin {
  //late NotificationsBloc _bloc;

  late NotificationBloc notificationBloc;

  @override
  void initState() {
    notificationBloc = sl<NotificationBloc>();
    notificationBloc.add(GetNotificationEvent());
    //  _bloc = NotificationsBloc();
    // _bloc.add(NotificationsDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
      bloc: notificationBloc,
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
              LocaleKeys.ttl_notifications.tr(),
              style: TextStyle(fontSize: 16.sp),
            ),
            actions: [
              IconButton(
                icon: Transform.scale(
                    scale: 0.6.h,
                    child: Image.asset(
                      'assets/ic_cross.png',
                    )),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child:state.isLoading!?
                SizedBox(height: 0.9.sh,
                child:const Center(
                  child: CircularProgressIndicator(),
                ) ,
                ):
            Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                ListView.builder(
                  itemCount: state.todayList!.isNotEmpty
                      ? state.todayList!.length + 1
                      : 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return ListHeader(
                        bgColor: MyColors.colorGrey,
                        textColor: MyColors.colorBlack,
                        text: LocaleKeys.ttl_str_today.tr(),
                      );
                    }

                    return state.todayList!.isNotEmpty
                        ? ListNotifications(
                            title: state.todayList![index - 1].subject,
                            notification: state.todayList![index - 1].message,
                          )
                        : Center(
                            child: ErrorTextWidget(
                                error:
                                    LocaleKeys.ttl_No_Notification_today.tr()),
                          );
                  },
                ),
                ListView.separated(
                  itemCount: state.prevList!.isNotEmpty
                      ? state.prevList!.length + 1
                      : 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return ListHeader(
                        bgColor: MyColors.colorGrey,
                        textColor: MyColors.colorBlack,
                        text: LocaleKeys.ttl_str_previous.tr(),
                      );
                    }

                    return state.prevList!.isNotEmpty
                        ? ListNotifications(
                            title: state.prevList![index - 1].subject,
                            notification: state.prevList![index - 1].message,
                          )
                        : Padding(
                            padding: EdgeInsets.all(16.w),
                            child: ErrorTextWidget(
                                error: LocaleKeys.ttl_No_Notification_previous
                                    .tr()),
                          );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 2.h),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

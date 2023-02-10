



import 'package:cityproperties/Screens/MyRentals/Api/MyRentalsDetailsRemote.dart';
import 'package:cityproperties/Screens/Notifications/Api/NotificationRemote.dart';
import 'package:cityproperties/Screens/Notifications/Model/NotificationModel.dart';
import 'package:cityproperties/Screens/Register/Api/RegisterRemote.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

import '../../../translations/locale_keys.g.dart';
import 'notification_state.dart';


part 'notification_event.dart';


class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationDataSource notificationDataSource;


  NotificationBloc({
    required this.notificationDataSource,

   }) : super(NotificationState.initial()) {
    on<GetNotificationEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..isLoading = true
          ..error=''
        ..dataList=[]
        ..todayList=[]
        ..prevList=[]

        ));
      final result = await notificationDataSource.getNotification(

      );
      print("result");
      print(result);
      print("result");

      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isSuccess = false
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
        List<Notifications>? dataList = [], todayList = [], prevList = [];
        dataList = r.notifications!;
        String todayDate = DateFormat("yyyy-MM-dd").format(DateTime.now());

        todayList = dataList
            .where((i) => i.creationDate!.contains(todayDate))
            .toList();
        prevList = dataList
            .where((i) => !(i.creationDate!.contains(todayDate)))
            .toList();

          emit(state.rebuild((b) => b
            ..isSuccess = true
            ..isLoading = false
              ..dataList=dataList
            ..todayList=todayList
            ..prevList=prevList

          ));





      });
    });
  }


}


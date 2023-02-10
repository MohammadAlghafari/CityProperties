



import 'package:cityproperties/Screens/Notifications/Api/NotificationRemote.dart';
import 'package:cityproperties/Screens/Notifications/Model/NotificationModel.dart';
import 'package:cityproperties/Screens/Register/Api/RegisterRemote.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

import '../../../translations/locale_keys.g.dart';
import 'home_state.dart';


part 'home_event.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {


  HomeBloc() : super(HomeState.initial()) {
    on<ChangePageEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..page=event.page

        ));

    });
  }


}


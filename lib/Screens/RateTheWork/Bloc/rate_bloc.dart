



import 'package:cityproperties/Screens/MyRentals/Api/MyRentalsDetailsRemote.dart';
import 'package:cityproperties/Screens/MyRentals/Api/MyRentalsRemote.dart';
import 'package:cityproperties/Screens/MyRentals/Bloc/myrentals_state.dart';
import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsModel.dart';
import 'package:cityproperties/Screens/RateTheWork/Api/MyRateRemote.dart';
import 'package:cityproperties/Screens/RateTheWork/Api/RateJobRemote.dart';
import 'package:cityproperties/Screens/RateTheWork/Model/MyRateModel.dart';
import 'package:cityproperties/Screens/RateTheWork/Model/RateJobModel.dart';
import 'package:cityproperties/Screens/Vacant/Api/VacantUnitRemote.dart';
import 'package:cityproperties/Screens/Vacant/Model/VacantUnitModel.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import 'rate_state.dart';


part 'rate_event.dart';


class RateBloc extends Bloc<RateEvent, RateState> {
  RateJobDataSource rateJobDataSource;
  MyRateDataSource myRateDataSource;

  RateBloc({
    required this.myRateDataSource,
    required this.rateJobDataSource

   }) : super(RateState.initial()) {
    on<GetMyRateEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..isLoading = true
          ..error=''
        ..rateJobModel=RateJobModel(
            listRateJob: []
        )
         ..myRateModel=MyRateModel(
           listMyRate: []
         )

        ));
      final result = await myRateDataSource.getMyRate(
        jobNo: event.jobNo
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isSuccess = false
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
          emit(state.rebuild((b) => b
            ..isSuccess = true
            ..isLoading = false
              ..myRateModel=r
          ));
      });
    });

    on<RateWorkEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccessRateWork = false
        ..isLoadingRateWork = true
        ..errorRateWork=''
        ..rateJobModel=RateJobModel(
            listRateJob: []
        )

      ));
      final result = await rateJobDataSource.rateJob(
        comments: event.comments,
          jobNo: event.jobNo,
        userratings: event.userRating
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isSuccessRateWork = false
          ..isLoadingRateWork = false
          ..errorRateWork = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) => b
          ..isSuccessRateWork = true
          ..isLoadingRateWork = false
          ..rateJobModel=r
        ));
      });
    });
  }
}


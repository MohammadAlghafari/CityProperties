



import 'package:cityproperties/Screens/MyRentals/Api/MyRentalsDetailsRemote.dart';
import 'package:cityproperties/Screens/MyRentals/Api/MyRentalsRemote.dart';
import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsModel.dart';
import 'package:cityproperties/Screens/Vacant/Api/VacantUnitRemote.dart';
import 'package:cityproperties/Screens/Vacant/Model/VacantUnitModel.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import 'myrentals_state.dart';


part 'myrentals_event.dart';


class MyRentalsBloc extends Bloc<MyRentalsEvent, MyRentalsState> {
  MyRentalsDataSource myRentalsDataSource;
  MyRentalsDetailsDataSource myRentalsDetailsDataSource;
  VacantUnitDataSource vacantUnitDataSource;

  MyRentalsBloc({
    required this.myRentalsDataSource,
    required this.myRentalsDetailsDataSource,
    required this.vacantUnitDataSource
   }) : super(MyRentalsState.initial()) {
    on<GetMyRentalsEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..isLoading = true
          ..error=''
         ..myRentalsModel=MyRentalsModel(
           listMyRentals: []
         )

        ));
      final result = await myRentalsDataSource.getMyRentals(
        shortCode: ''

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
              ..myRentalsModel=r
          ));
      });
    });

    on<GetMyRentalsDetailsEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoadingDetails = true
        ..errorDetails=''
        ..myRentalsDetailsModel=null

      ));
      final result = await myRentalsDetailsDataSource.getMyRentalsDetails(
            propertyCode: event.propCode
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoadingDetails = false
          ..errorDetails = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) => b
          ..isLoadingDetails = false
          ..myRentalsDetailsModel=r

        ));
      });
    });


    on<GetVacantUnitEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoadingDetails = true
        ..errorDetails=''
        ..vacantUnitModel=VacantUnitModel(
             listVacantUnit: []
        )

      ));
      final result = await vacantUnitDataSource.getVacantUnit(
        cityCode: event.cityCode,
        devCode: event.devCode
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoadingDetails = false
          ..errorDetails = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) => b
          ..isLoadingDetails = false
          ..vacantUnitModel=r

        ));
      });
    });



  }


}


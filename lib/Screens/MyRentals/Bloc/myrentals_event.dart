part of 'myrentals_bloc.dart';

abstract class MyRentalsEvent extends Equatable {
  const MyRentalsEvent();
  @override
  List<Object> get props => [];
}

class GetMyRentalsEvent extends MyRentalsEvent {

}


// ignore: must_be_immutable
class GetMyRentalsDetailsEvent extends MyRentalsEvent {
   String propCode;
   GetMyRentalsDetailsEvent({
     required this.propCode
    });
}


// ignore: must_be_immutable
class GetVacantUnitEvent extends MyRentalsEvent {
  String cityCode;
  String devCode;
  GetVacantUnitEvent({
    required this.cityCode,
    required this.devCode
  });
}
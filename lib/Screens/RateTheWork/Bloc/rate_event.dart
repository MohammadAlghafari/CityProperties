part of 'rate_bloc.dart';

abstract class RateEvent extends Equatable {
  const RateEvent();
  @override
  List<Object> get props => [];
}

class GetMyRateEvent extends RateEvent {
  String jobNo;
  GetMyRateEvent({
    required this.jobNo
   });

}

// ignore: must_be_immutable
class RateWorkEvent extends RateEvent {
  String jobNo;
  String comments;
  String userRating;
  RateWorkEvent({
    required this.jobNo,
    required this.comments,
    required this.userRating
  });

}
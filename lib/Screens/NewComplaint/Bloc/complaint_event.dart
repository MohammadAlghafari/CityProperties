part of 'complaint_bloc.dart';

abstract class ComplaintEvent extends Equatable {
  const ComplaintEvent();
  @override
  List<Object> get props => [];
}

class GetMyRentalsEvent extends ComplaintEvent {
   final String shortCode;
   const GetMyRentalsEvent({
     required this.shortCode
   });
}


class GetServiceTypeEvent extends ComplaintEvent {
  final String propertyCode;
  const GetServiceTypeEvent({
    required this.propertyCode
  });
}

class GetSpotUnitEvent extends ComplaintEvent {
  final String serviceType;
  final String propertyCode;
  const GetSpotUnitEvent({
    required this.serviceType,
    required this.propertyCode
  });
}


class GetComplaintDataEvent extends ComplaintEvent {
  final String serviceType;
  final String propertyCode;
  final String spotId;
  const GetComplaintDataEvent({
    required this.serviceType,
    required this.propertyCode,
    required this.spotId
  });
}

class TakeImageEvent extends ComplaintEvent{
  final bool? isCamera;

  const TakeImageEvent({
    this.isCamera,
  });

}


class NewComplainEvent extends ComplaintEvent{
  final  Map<String, Object> complaintData;

  const NewComplainEvent({
    required this.complaintData,
  });

}

class ResetEvent extends ComplaintEvent{

}



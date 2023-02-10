part of 'maintenance_bloc.dart';

abstract class MaintenanceEvent extends Equatable {
  const MaintenanceEvent();
  @override
  List<Object> get props => [];
}




// ignore: must_be_immutable
class GetMaintenanceHistoryEvent extends MaintenanceEvent {
   String shortCode;
   GetMaintenanceHistoryEvent({
     required this.shortCode
    });
}


// ignore: must_be_immutable
class FilterMaintenanceHistoryEvent extends MaintenanceEvent {
  String statusValue ;
  String categoryValue ;
  FilterMaintenanceHistoryEvent({
    required this.statusValue,
    required this.categoryValue
  });
}


// ignore: must_be_immutable
class GetTechDetailsEvent extends MaintenanceEvent {
  String assignTo;
  GetTechDetailsEvent({
    required this.assignTo
  });
}



// ignore: must_be_immutable
class GetJobMaterialEvent extends MaintenanceEvent {
  String cmdNo;
  String status;
  GetJobMaterialEvent({
    required this.cmdNo,
   required this.status
  });
}

// ignore: must_be_immutable
class GetJobDetailsEvent extends MaintenanceEvent {
  String jobNo;
  GetJobDetailsEvent({
    required this.jobNo
  });
}



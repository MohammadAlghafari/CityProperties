part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
  @override
  List<Object> get props => [];
}

class GetAnnouncementEvent extends DashboardEvent {
}


class GetTenantEvent extends DashboardEvent {
}

class GetDuePaymentEvent extends DashboardEvent {
}

// ignore: must_be_immutable
class GetDuePaymentImageEvent extends DashboardEvent {
  String contractNo;
  String chqueNo;
  GetDuePaymentImageEvent({
    required this.contractNo,
  required this.chqueNo
  });
}
class GetChequeReturnEvent extends DashboardEvent {
}

class GetMonthlyPaymentEvent extends DashboardEvent {
}
part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ChangePageEvent extends HomeEvent {
  int page;
  ChangePageEvent({required this.page});

}



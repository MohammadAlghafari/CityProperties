



import 'package:built_value/built_value.dart';
import 'package:cityproperties/Screens/RateTheWork/Model/MyRateModel.dart';
import 'package:cityproperties/Screens/RateTheWork/Model/RateJobModel.dart';




part 'rate_state.g.dart';


abstract class RateState implements Built<RateState,
    RateStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  String? get error;
  bool? get isSuccessRateWork;
  bool? get isLoadingRateWork;
  String? get errorRateWork;
  MyRateModel? get myRateModel;
  RateJobModel? get rateJobModel;
  RateState._();

  factory RateState([void Function(RateStateBuilder) updates]) = _$RateState;

  factory RateState.initial() {
    return RateState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingRateWork = false
      ..isSuccessRateWork = false
      ..errorRateWork=''
      ..error=''
        ..myRateModel=MyRateModel(
          listMyRate: []
        )
        ..rateJobModel=RateJobModel(
          listRateJob: []
        )



    );
  }
}



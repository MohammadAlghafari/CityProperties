// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RateState extends RateState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? error;
  @override
  final bool? isSuccessRateWork;
  @override
  final bool? isLoadingRateWork;
  @override
  final String? errorRateWork;
  @override
  final MyRateModel? myRateModel;
  @override
  final RateJobModel? rateJobModel;

  factory _$RateState([void Function(RateStateBuilder)? updates]) =>
      (new RateStateBuilder()..update(updates))._build();

  _$RateState._(
      {this.isSuccess,
      this.isLoading,
      this.error,
      this.isSuccessRateWork,
      this.isLoadingRateWork,
      this.errorRateWork,
      this.myRateModel,
      this.rateJobModel})
      : super._();

  @override
  RateState rebuild(void Function(RateStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RateStateBuilder toBuilder() => new RateStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RateState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        error == other.error &&
        isSuccessRateWork == other.isSuccessRateWork &&
        isLoadingRateWork == other.isLoadingRateWork &&
        errorRateWork == other.errorRateWork &&
        myRateModel == other.myRateModel &&
        rateJobModel == other.rateJobModel;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, isSuccess.hashCode), isLoading.hashCode),
                            error.hashCode),
                        isSuccessRateWork.hashCode),
                    isLoadingRateWork.hashCode),
                errorRateWork.hashCode),
            myRateModel.hashCode),
        rateJobModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RateState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('isSuccessRateWork', isSuccessRateWork)
          ..add('isLoadingRateWork', isLoadingRateWork)
          ..add('errorRateWork', errorRateWork)
          ..add('myRateModel', myRateModel)
          ..add('rateJobModel', rateJobModel))
        .toString();
  }
}

class RateStateBuilder implements Builder<RateState, RateStateBuilder> {
  _$RateState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isSuccessRateWork;
  bool? get isSuccessRateWork => _$this._isSuccessRateWork;
  set isSuccessRateWork(bool? isSuccessRateWork) =>
      _$this._isSuccessRateWork = isSuccessRateWork;

  bool? _isLoadingRateWork;
  bool? get isLoadingRateWork => _$this._isLoadingRateWork;
  set isLoadingRateWork(bool? isLoadingRateWork) =>
      _$this._isLoadingRateWork = isLoadingRateWork;

  String? _errorRateWork;
  String? get errorRateWork => _$this._errorRateWork;
  set errorRateWork(String? errorRateWork) =>
      _$this._errorRateWork = errorRateWork;

  MyRateModel? _myRateModel;
  MyRateModel? get myRateModel => _$this._myRateModel;
  set myRateModel(MyRateModel? myRateModel) =>
      _$this._myRateModel = myRateModel;

  RateJobModel? _rateJobModel;
  RateJobModel? get rateJobModel => _$this._rateJobModel;
  set rateJobModel(RateJobModel? rateJobModel) =>
      _$this._rateJobModel = rateJobModel;

  RateStateBuilder();

  RateStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _isSuccessRateWork = $v.isSuccessRateWork;
      _isLoadingRateWork = $v.isLoadingRateWork;
      _errorRateWork = $v.errorRateWork;
      _myRateModel = $v.myRateModel;
      _rateJobModel = $v.rateJobModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RateState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RateState;
  }

  @override
  void update(void Function(RateStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RateState build() => _build();

  _$RateState _build() {
    final _$result = _$v ??
        new _$RateState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            error: error,
            isSuccessRateWork: isSuccessRateWork,
            isLoadingRateWork: isLoadingRateWork,
            errorRateWork: errorRateWork,
            myRateModel: myRateModel,
            rateJobModel: rateJobModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

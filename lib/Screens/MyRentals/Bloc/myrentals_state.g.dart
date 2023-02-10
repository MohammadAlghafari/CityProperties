// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myrentals_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MyRentalsState extends MyRentalsState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? error;
  @override
  final MyRentalsModel? myRentalsModel;
  @override
  final bool? isLoadingDetails;
  @override
  final String? errorDetails;
  @override
  final MyRentalsDetailsModel? myRentalsDetailsModel;
  @override
  final VacantUnitModel? vacantUnitModel;

  factory _$MyRentalsState([void Function(MyRentalsStateBuilder)? updates]) =>
      (new MyRentalsStateBuilder()..update(updates))._build();

  _$MyRentalsState._(
      {this.isSuccess,
      this.isLoading,
      this.error,
      this.myRentalsModel,
      this.isLoadingDetails,
      this.errorDetails,
      this.myRentalsDetailsModel,
      this.vacantUnitModel})
      : super._();

  @override
  MyRentalsState rebuild(void Function(MyRentalsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyRentalsStateBuilder toBuilder() =>
      new MyRentalsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyRentalsState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        error == other.error &&
        myRentalsModel == other.myRentalsModel &&
        isLoadingDetails == other.isLoadingDetails &&
        errorDetails == other.errorDetails &&
        myRentalsDetailsModel == other.myRentalsDetailsModel &&
        vacantUnitModel == other.vacantUnitModel;
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
                        myRentalsModel.hashCode),
                    isLoadingDetails.hashCode),
                errorDetails.hashCode),
            myRentalsDetailsModel.hashCode),
        vacantUnitModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MyRentalsState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('myRentalsModel', myRentalsModel)
          ..add('isLoadingDetails', isLoadingDetails)
          ..add('errorDetails', errorDetails)
          ..add('myRentalsDetailsModel', myRentalsDetailsModel)
          ..add('vacantUnitModel', vacantUnitModel))
        .toString();
  }
}

class MyRentalsStateBuilder
    implements Builder<MyRentalsState, MyRentalsStateBuilder> {
  _$MyRentalsState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  MyRentalsModel? _myRentalsModel;
  MyRentalsModel? get myRentalsModel => _$this._myRentalsModel;
  set myRentalsModel(MyRentalsModel? myRentalsModel) =>
      _$this._myRentalsModel = myRentalsModel;

  bool? _isLoadingDetails;
  bool? get isLoadingDetails => _$this._isLoadingDetails;
  set isLoadingDetails(bool? isLoadingDetails) =>
      _$this._isLoadingDetails = isLoadingDetails;

  String? _errorDetails;
  String? get errorDetails => _$this._errorDetails;
  set errorDetails(String? errorDetails) => _$this._errorDetails = errorDetails;

  MyRentalsDetailsModel? _myRentalsDetailsModel;
  MyRentalsDetailsModel? get myRentalsDetailsModel =>
      _$this._myRentalsDetailsModel;
  set myRentalsDetailsModel(MyRentalsDetailsModel? myRentalsDetailsModel) =>
      _$this._myRentalsDetailsModel = myRentalsDetailsModel;

  VacantUnitModel? _vacantUnitModel;
  VacantUnitModel? get vacantUnitModel => _$this._vacantUnitModel;
  set vacantUnitModel(VacantUnitModel? vacantUnitModel) =>
      _$this._vacantUnitModel = vacantUnitModel;

  MyRentalsStateBuilder();

  MyRentalsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _myRentalsModel = $v.myRentalsModel;
      _isLoadingDetails = $v.isLoadingDetails;
      _errorDetails = $v.errorDetails;
      _myRentalsDetailsModel = $v.myRentalsDetailsModel;
      _vacantUnitModel = $v.vacantUnitModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyRentalsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyRentalsState;
  }

  @override
  void update(void Function(MyRentalsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MyRentalsState build() => _build();

  _$MyRentalsState _build() {
    final _$result = _$v ??
        new _$MyRentalsState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            error: error,
            myRentalsModel: myRentalsModel,
            isLoadingDetails: isLoadingDetails,
            errorDetails: errorDetails,
            myRentalsDetailsModel: myRentalsDetailsModel,
            vacantUnitModel: vacantUnitModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

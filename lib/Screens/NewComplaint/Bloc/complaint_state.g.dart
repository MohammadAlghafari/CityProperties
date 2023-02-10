// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ComplaintState extends ComplaintState {
  @override
  final bool? isSuccess;
  @override
  final bool? isSuccessSpotUnit;
  @override
  final bool? isSuccessComplaint;
  @override
  final bool? isLoading;
  @override
  final String? error;
  @override
  final MyRentalsModel? myRentalsModel;
  @override
  final ServiceTypeModel? serviceTypeModel;
  @override
  final LocationData? locationData;
  @override
  final ComplaintData complaintData;
  @override
  final String? imagePath;
  @override
  final ResultData? resultData;

  factory _$ComplaintState([void Function(ComplaintStateBuilder)? updates]) =>
      (new ComplaintStateBuilder()..update(updates))._build();

  _$ComplaintState._(
      {this.isSuccess,
      this.isSuccessSpotUnit,
      this.isSuccessComplaint,
      this.isLoading,
      this.error,
      this.myRentalsModel,
      this.serviceTypeModel,
      this.locationData,
      required this.complaintData,
      this.imagePath,
      this.resultData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        complaintData, r'ComplaintState', 'complaintData');
  }

  @override
  ComplaintState rebuild(void Function(ComplaintStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ComplaintStateBuilder toBuilder() =>
      new ComplaintStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ComplaintState &&
        isSuccess == other.isSuccess &&
        isSuccessSpotUnit == other.isSuccessSpotUnit &&
        isSuccessComplaint == other.isSuccessComplaint &&
        isLoading == other.isLoading &&
        error == other.error &&
        myRentalsModel == other.myRentalsModel &&
        serviceTypeModel == other.serviceTypeModel &&
        locationData == other.locationData &&
        complaintData == other.complaintData &&
        imagePath == other.imagePath &&
        resultData == other.resultData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, isSuccess.hashCode),
                                            isSuccessSpotUnit.hashCode),
                                        isSuccessComplaint.hashCode),
                                    isLoading.hashCode),
                                error.hashCode),
                            myRentalsModel.hashCode),
                        serviceTypeModel.hashCode),
                    locationData.hashCode),
                complaintData.hashCode),
            imagePath.hashCode),
        resultData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ComplaintState')
          ..add('isSuccess', isSuccess)
          ..add('isSuccessSpotUnit', isSuccessSpotUnit)
          ..add('isSuccessComplaint', isSuccessComplaint)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('myRentalsModel', myRentalsModel)
          ..add('serviceTypeModel', serviceTypeModel)
          ..add('locationData', locationData)
          ..add('complaintData', complaintData)
          ..add('imagePath', imagePath)
          ..add('resultData', resultData))
        .toString();
  }
}

class ComplaintStateBuilder
    implements Builder<ComplaintState, ComplaintStateBuilder> {
  _$ComplaintState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isSuccessSpotUnit;
  bool? get isSuccessSpotUnit => _$this._isSuccessSpotUnit;
  set isSuccessSpotUnit(bool? isSuccessSpotUnit) =>
      _$this._isSuccessSpotUnit = isSuccessSpotUnit;

  bool? _isSuccessComplaint;
  bool? get isSuccessComplaint => _$this._isSuccessComplaint;
  set isSuccessComplaint(bool? isSuccessComplaint) =>
      _$this._isSuccessComplaint = isSuccessComplaint;

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

  ServiceTypeModel? _serviceTypeModel;
  ServiceTypeModel? get serviceTypeModel => _$this._serviceTypeModel;
  set serviceTypeModel(ServiceTypeModel? serviceTypeModel) =>
      _$this._serviceTypeModel = serviceTypeModel;

  LocationData? _locationData;
  LocationData? get locationData => _$this._locationData;
  set locationData(LocationData? locationData) =>
      _$this._locationData = locationData;

  ComplaintData? _complaintData;
  ComplaintData? get complaintData => _$this._complaintData;
  set complaintData(ComplaintData? complaintData) =>
      _$this._complaintData = complaintData;

  String? _imagePath;
  String? get imagePath => _$this._imagePath;
  set imagePath(String? imagePath) => _$this._imagePath = imagePath;

  ResultData? _resultData;
  ResultData? get resultData => _$this._resultData;
  set resultData(ResultData? resultData) => _$this._resultData = resultData;

  ComplaintStateBuilder();

  ComplaintStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isSuccessSpotUnit = $v.isSuccessSpotUnit;
      _isSuccessComplaint = $v.isSuccessComplaint;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _myRentalsModel = $v.myRentalsModel;
      _serviceTypeModel = $v.serviceTypeModel;
      _locationData = $v.locationData;
      _complaintData = $v.complaintData;
      _imagePath = $v.imagePath;
      _resultData = $v.resultData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ComplaintState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ComplaintState;
  }

  @override
  void update(void Function(ComplaintStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ComplaintState build() => _build();

  _$ComplaintState _build() {
    final _$result = _$v ??
        new _$ComplaintState._(
            isSuccess: isSuccess,
            isSuccessSpotUnit: isSuccessSpotUnit,
            isSuccessComplaint: isSuccessComplaint,
            isLoading: isLoading,
            error: error,
            myRentalsModel: myRentalsModel,
            serviceTypeModel: serviceTypeModel,
            locationData: locationData,
            complaintData: BuiltValueNullFieldError.checkNotNull(
                complaintData, r'ComplaintState', 'complaintData'),
            imagePath: imagePath,
            resultData: resultData);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

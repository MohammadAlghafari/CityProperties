// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MaintenanceState extends MaintenanceState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final bool? isLoadingJobInfo;
  @override
  final String? errorJobInfo;
  @override
  final String? error;
  @override
  final bool? isLoadingDetails;
  @override
  final String? errorDetails;
  @override
  final MaintenanceHistoryModel? maintenanceHistoryModel;
  @override
  final MaintenanceHistoryModel? filterMaintenanceHistoryModel;
  @override
  final TechData techData;
  @override
  final JobMaterialDataModel jobMaterialDataModel;
  @override
  final JobDetailsModel jobDetailsModel;

  factory _$MaintenanceState(
          [void Function(MaintenanceStateBuilder)? updates]) =>
      (new MaintenanceStateBuilder()..update(updates))._build();

  _$MaintenanceState._(
      {this.isSuccess,
      this.isLoading,
      this.isLoadingJobInfo,
      this.errorJobInfo,
      this.error,
      this.isLoadingDetails,
      this.errorDetails,
      this.maintenanceHistoryModel,
      this.filterMaintenanceHistoryModel,
      required this.techData,
      required this.jobMaterialDataModel,
      required this.jobDetailsModel})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        techData, r'MaintenanceState', 'techData');
    BuiltValueNullFieldError.checkNotNull(
        jobMaterialDataModel, r'MaintenanceState', 'jobMaterialDataModel');
    BuiltValueNullFieldError.checkNotNull(
        jobDetailsModel, r'MaintenanceState', 'jobDetailsModel');
  }

  @override
  MaintenanceState rebuild(void Function(MaintenanceStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MaintenanceStateBuilder toBuilder() =>
      new MaintenanceStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MaintenanceState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        isLoadingJobInfo == other.isLoadingJobInfo &&
        errorJobInfo == other.errorJobInfo &&
        error == other.error &&
        isLoadingDetails == other.isLoadingDetails &&
        errorDetails == other.errorDetails &&
        maintenanceHistoryModel == other.maintenanceHistoryModel &&
        filterMaintenanceHistoryModel == other.filterMaintenanceHistoryModel &&
        techData == other.techData &&
        jobMaterialDataModel == other.jobMaterialDataModel &&
        jobDetailsModel == other.jobDetailsModel;
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
                                        $jc(
                                            $jc($jc(0, isSuccess.hashCode),
                                                isLoading.hashCode),
                                            isLoadingJobInfo.hashCode),
                                        errorJobInfo.hashCode),
                                    error.hashCode),
                                isLoadingDetails.hashCode),
                            errorDetails.hashCode),
                        maintenanceHistoryModel.hashCode),
                    filterMaintenanceHistoryModel.hashCode),
                techData.hashCode),
            jobMaterialDataModel.hashCode),
        jobDetailsModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MaintenanceState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('isLoadingJobInfo', isLoadingJobInfo)
          ..add('errorJobInfo', errorJobInfo)
          ..add('error', error)
          ..add('isLoadingDetails', isLoadingDetails)
          ..add('errorDetails', errorDetails)
          ..add('maintenanceHistoryModel', maintenanceHistoryModel)
          ..add('filterMaintenanceHistoryModel', filterMaintenanceHistoryModel)
          ..add('techData', techData)
          ..add('jobMaterialDataModel', jobMaterialDataModel)
          ..add('jobDetailsModel', jobDetailsModel))
        .toString();
  }
}

class MaintenanceStateBuilder
    implements Builder<MaintenanceState, MaintenanceStateBuilder> {
  _$MaintenanceState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isLoadingJobInfo;
  bool? get isLoadingJobInfo => _$this._isLoadingJobInfo;
  set isLoadingJobInfo(bool? isLoadingJobInfo) =>
      _$this._isLoadingJobInfo = isLoadingJobInfo;

  String? _errorJobInfo;
  String? get errorJobInfo => _$this._errorJobInfo;
  set errorJobInfo(String? errorJobInfo) => _$this._errorJobInfo = errorJobInfo;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoadingDetails;
  bool? get isLoadingDetails => _$this._isLoadingDetails;
  set isLoadingDetails(bool? isLoadingDetails) =>
      _$this._isLoadingDetails = isLoadingDetails;

  String? _errorDetails;
  String? get errorDetails => _$this._errorDetails;
  set errorDetails(String? errorDetails) => _$this._errorDetails = errorDetails;

  MaintenanceHistoryModel? _maintenanceHistoryModel;
  MaintenanceHistoryModel? get maintenanceHistoryModel =>
      _$this._maintenanceHistoryModel;
  set maintenanceHistoryModel(
          MaintenanceHistoryModel? maintenanceHistoryModel) =>
      _$this._maintenanceHistoryModel = maintenanceHistoryModel;

  MaintenanceHistoryModel? _filterMaintenanceHistoryModel;
  MaintenanceHistoryModel? get filterMaintenanceHistoryModel =>
      _$this._filterMaintenanceHistoryModel;
  set filterMaintenanceHistoryModel(
          MaintenanceHistoryModel? filterMaintenanceHistoryModel) =>
      _$this._filterMaintenanceHistoryModel = filterMaintenanceHistoryModel;

  TechData? _techData;
  TechData? get techData => _$this._techData;
  set techData(TechData? techData) => _$this._techData = techData;

  JobMaterialDataModel? _jobMaterialDataModel;
  JobMaterialDataModel? get jobMaterialDataModel =>
      _$this._jobMaterialDataModel;
  set jobMaterialDataModel(JobMaterialDataModel? jobMaterialDataModel) =>
      _$this._jobMaterialDataModel = jobMaterialDataModel;

  JobDetailsModel? _jobDetailsModel;
  JobDetailsModel? get jobDetailsModel => _$this._jobDetailsModel;
  set jobDetailsModel(JobDetailsModel? jobDetailsModel) =>
      _$this._jobDetailsModel = jobDetailsModel;

  MaintenanceStateBuilder();

  MaintenanceStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _isLoadingJobInfo = $v.isLoadingJobInfo;
      _errorJobInfo = $v.errorJobInfo;
      _error = $v.error;
      _isLoadingDetails = $v.isLoadingDetails;
      _errorDetails = $v.errorDetails;
      _maintenanceHistoryModel = $v.maintenanceHistoryModel;
      _filterMaintenanceHistoryModel = $v.filterMaintenanceHistoryModel;
      _techData = $v.techData;
      _jobMaterialDataModel = $v.jobMaterialDataModel;
      _jobDetailsModel = $v.jobDetailsModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MaintenanceState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MaintenanceState;
  }

  @override
  void update(void Function(MaintenanceStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MaintenanceState build() => _build();

  _$MaintenanceState _build() {
    final _$result = _$v ??
        new _$MaintenanceState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            isLoadingJobInfo: isLoadingJobInfo,
            errorJobInfo: errorJobInfo,
            error: error,
            isLoadingDetails: isLoadingDetails,
            errorDetails: errorDetails,
            maintenanceHistoryModel: maintenanceHistoryModel,
            filterMaintenanceHistoryModel: filterMaintenanceHistoryModel,
            techData: BuiltValueNullFieldError.checkNotNull(
                techData, r'MaintenanceState', 'techData'),
            jobMaterialDataModel: BuiltValueNullFieldError.checkNotNull(
                jobMaterialDataModel,
                r'MaintenanceState',
                'jobMaterialDataModel'),
            jobDetailsModel: BuiltValueNullFieldError.checkNotNull(
                jobDetailsModel, r'MaintenanceState', 'jobDetailsModel'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

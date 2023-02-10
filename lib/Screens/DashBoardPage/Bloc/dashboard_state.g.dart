// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DashboardState extends DashboardState {
  @override
  final String? error;
  @override
  final String? errorImage;
  @override
  final bool? isLoading;
  @override
  final bool? isLoadingImage;
  @override
  final AnnouncementModel? announcementModel;
  @override
  final TenantStateModel? tenantStateModel;
  @override
  final DuePaymentModel? duePaymentModel;
  @override
  final DuePaymentImageModel duePaymentImageModel;
  @override
  final ChequeReturnModel chequeReturnModel;
  @override
  final MonthlyPaymentModel monthlyPaymentModel;

  factory _$DashboardState([void Function(DashboardStateBuilder)? updates]) =>
      (new DashboardStateBuilder()..update(updates))._build();

  _$DashboardState._(
      {this.error,
      this.errorImage,
      this.isLoading,
      this.isLoadingImage,
      this.announcementModel,
      this.tenantStateModel,
      this.duePaymentModel,
      required this.duePaymentImageModel,
      required this.chequeReturnModel,
      required this.monthlyPaymentModel})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        duePaymentImageModel, r'DashboardState', 'duePaymentImageModel');
    BuiltValueNullFieldError.checkNotNull(
        chequeReturnModel, r'DashboardState', 'chequeReturnModel');
    BuiltValueNullFieldError.checkNotNull(
        monthlyPaymentModel, r'DashboardState', 'monthlyPaymentModel');
  }

  @override
  DashboardState rebuild(void Function(DashboardStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardStateBuilder toBuilder() =>
      new DashboardStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DashboardState &&
        error == other.error &&
        errorImage == other.errorImage &&
        isLoading == other.isLoading &&
        isLoadingImage == other.isLoadingImage &&
        announcementModel == other.announcementModel &&
        tenantStateModel == other.tenantStateModel &&
        duePaymentModel == other.duePaymentModel &&
        duePaymentImageModel == other.duePaymentImageModel &&
        chequeReturnModel == other.chequeReturnModel &&
        monthlyPaymentModel == other.monthlyPaymentModel;
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
                                    $jc($jc(0, error.hashCode),
                                        errorImage.hashCode),
                                    isLoading.hashCode),
                                isLoadingImage.hashCode),
                            announcementModel.hashCode),
                        tenantStateModel.hashCode),
                    duePaymentModel.hashCode),
                duePaymentImageModel.hashCode),
            chequeReturnModel.hashCode),
        monthlyPaymentModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DashboardState')
          ..add('error', error)
          ..add('errorImage', errorImage)
          ..add('isLoading', isLoading)
          ..add('isLoadingImage', isLoadingImage)
          ..add('announcementModel', announcementModel)
          ..add('tenantStateModel', tenantStateModel)
          ..add('duePaymentModel', duePaymentModel)
          ..add('duePaymentImageModel', duePaymentImageModel)
          ..add('chequeReturnModel', chequeReturnModel)
          ..add('monthlyPaymentModel', monthlyPaymentModel))
        .toString();
  }
}

class DashboardStateBuilder
    implements Builder<DashboardState, DashboardStateBuilder> {
  _$DashboardState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  String? _errorImage;
  String? get errorImage => _$this._errorImage;
  set errorImage(String? errorImage) => _$this._errorImage = errorImage;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isLoadingImage;
  bool? get isLoadingImage => _$this._isLoadingImage;
  set isLoadingImage(bool? isLoadingImage) =>
      _$this._isLoadingImage = isLoadingImage;

  AnnouncementModel? _announcementModel;
  AnnouncementModel? get announcementModel => _$this._announcementModel;
  set announcementModel(AnnouncementModel? announcementModel) =>
      _$this._announcementModel = announcementModel;

  TenantStateModel? _tenantStateModel;
  TenantStateModel? get tenantStateModel => _$this._tenantStateModel;
  set tenantStateModel(TenantStateModel? tenantStateModel) =>
      _$this._tenantStateModel = tenantStateModel;

  DuePaymentModel? _duePaymentModel;
  DuePaymentModel? get duePaymentModel => _$this._duePaymentModel;
  set duePaymentModel(DuePaymentModel? duePaymentModel) =>
      _$this._duePaymentModel = duePaymentModel;

  DuePaymentImageModel? _duePaymentImageModel;
  DuePaymentImageModel? get duePaymentImageModel =>
      _$this._duePaymentImageModel;
  set duePaymentImageModel(DuePaymentImageModel? duePaymentImageModel) =>
      _$this._duePaymentImageModel = duePaymentImageModel;

  ChequeReturnModel? _chequeReturnModel;
  ChequeReturnModel? get chequeReturnModel => _$this._chequeReturnModel;
  set chequeReturnModel(ChequeReturnModel? chequeReturnModel) =>
      _$this._chequeReturnModel = chequeReturnModel;

  MonthlyPaymentModel? _monthlyPaymentModel;
  MonthlyPaymentModel? get monthlyPaymentModel => _$this._monthlyPaymentModel;
  set monthlyPaymentModel(MonthlyPaymentModel? monthlyPaymentModel) =>
      _$this._monthlyPaymentModel = monthlyPaymentModel;

  DashboardStateBuilder();

  DashboardStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _errorImage = $v.errorImage;
      _isLoading = $v.isLoading;
      _isLoadingImage = $v.isLoadingImage;
      _announcementModel = $v.announcementModel;
      _tenantStateModel = $v.tenantStateModel;
      _duePaymentModel = $v.duePaymentModel;
      _duePaymentImageModel = $v.duePaymentImageModel;
      _chequeReturnModel = $v.chequeReturnModel;
      _monthlyPaymentModel = $v.monthlyPaymentModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DashboardState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DashboardState;
  }

  @override
  void update(void Function(DashboardStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DashboardState build() => _build();

  _$DashboardState _build() {
    final _$result = _$v ??
        new _$DashboardState._(
            error: error,
            errorImage: errorImage,
            isLoading: isLoading,
            isLoadingImage: isLoadingImage,
            announcementModel: announcementModel,
            tenantStateModel: tenantStateModel,
            duePaymentModel: duePaymentModel,
            duePaymentImageModel: BuiltValueNullFieldError.checkNotNull(
                duePaymentImageModel,
                r'DashboardState',
                'duePaymentImageModel'),
            chequeReturnModel: BuiltValueNullFieldError.checkNotNull(
                chequeReturnModel, r'DashboardState', 'chequeReturnModel'),
            monthlyPaymentModel: BuiltValueNullFieldError.checkNotNull(
                monthlyPaymentModel, r'DashboardState', 'monthlyPaymentModel'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

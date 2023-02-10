// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SettingState extends SettingState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final bool? isLoadingChange;
  @override
  final LoginModel? logOutModel;
  @override
  final String? error;
  @override
  final String? errorChange;
  @override
  final ProfileModel? profileModel;
  @override
  final ChangePasswordModel? changePasswordModel;

  factory _$SettingState([void Function(SettingStateBuilder)? updates]) =>
      (new SettingStateBuilder()..update(updates))._build();

  _$SettingState._(
      {this.isSuccess,
      this.isLoading,
      this.isLoadingChange,
      this.logOutModel,
      this.error,
      this.errorChange,
      this.profileModel,
      this.changePasswordModel})
      : super._();

  @override
  SettingState rebuild(void Function(SettingStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingStateBuilder toBuilder() => new SettingStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        isLoadingChange == other.isLoadingChange &&
        logOutModel == other.logOutModel &&
        error == other.error &&
        errorChange == other.errorChange &&
        profileModel == other.profileModel &&
        changePasswordModel == other.changePasswordModel;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, isSuccess.hashCode), isLoading.hashCode),
                            isLoadingChange.hashCode),
                        logOutModel.hashCode),
                    error.hashCode),
                errorChange.hashCode),
            profileModel.hashCode),
        changePasswordModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SettingState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('isLoadingChange', isLoadingChange)
          ..add('logOutModel', logOutModel)
          ..add('error', error)
          ..add('errorChange', errorChange)
          ..add('profileModel', profileModel)
          ..add('changePasswordModel', changePasswordModel))
        .toString();
  }
}

class SettingStateBuilder
    implements Builder<SettingState, SettingStateBuilder> {
  _$SettingState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isLoadingChange;
  bool? get isLoadingChange => _$this._isLoadingChange;
  set isLoadingChange(bool? isLoadingChange) =>
      _$this._isLoadingChange = isLoadingChange;

  LoginModel? _logOutModel;
  LoginModel? get logOutModel => _$this._logOutModel;
  set logOutModel(LoginModel? logOutModel) => _$this._logOutModel = logOutModel;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  String? _errorChange;
  String? get errorChange => _$this._errorChange;
  set errorChange(String? errorChange) => _$this._errorChange = errorChange;

  ProfileModel? _profileModel;
  ProfileModel? get profileModel => _$this._profileModel;
  set profileModel(ProfileModel? profileModel) =>
      _$this._profileModel = profileModel;

  ChangePasswordModel? _changePasswordModel;
  ChangePasswordModel? get changePasswordModel => _$this._changePasswordModel;
  set changePasswordModel(ChangePasswordModel? changePasswordModel) =>
      _$this._changePasswordModel = changePasswordModel;

  SettingStateBuilder();

  SettingStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _isLoadingChange = $v.isLoadingChange;
      _logOutModel = $v.logOutModel;
      _error = $v.error;
      _errorChange = $v.errorChange;
      _profileModel = $v.profileModel;
      _changePasswordModel = $v.changePasswordModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SettingState;
  }

  @override
  void update(void Function(SettingStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SettingState build() => _build();

  _$SettingState _build() {
    final _$result = _$v ??
        new _$SettingState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            isLoadingChange: isLoadingChange,
            logOutModel: logOutModel,
            error: error,
            errorChange: errorChange,
            profileModel: profileModel,
            changePasswordModel: changePasswordModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

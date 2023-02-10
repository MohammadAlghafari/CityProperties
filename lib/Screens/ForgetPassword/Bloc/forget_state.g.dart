// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ForgetState extends ForgetState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? error;
  @override
  final ForgetPasswordModel? forgetPasswordModel;

  factory _$ForgetState([void Function(ForgetStateBuilder)? updates]) =>
      (new ForgetStateBuilder()..update(updates))._build();

  _$ForgetState._(
      {this.isSuccess, this.isLoading, this.error, this.forgetPasswordModel})
      : super._();

  @override
  ForgetState rebuild(void Function(ForgetStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForgetStateBuilder toBuilder() => new ForgetStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForgetState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        error == other.error &&
        forgetPasswordModel == other.forgetPasswordModel;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isSuccess.hashCode), isLoading.hashCode),
            error.hashCode),
        forgetPasswordModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ForgetState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('forgetPasswordModel', forgetPasswordModel))
        .toString();
  }
}

class ForgetStateBuilder implements Builder<ForgetState, ForgetStateBuilder> {
  _$ForgetState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  ForgetPasswordModel? _forgetPasswordModel;
  ForgetPasswordModel? get forgetPasswordModel => _$this._forgetPasswordModel;
  set forgetPasswordModel(ForgetPasswordModel? forgetPasswordModel) =>
      _$this._forgetPasswordModel = forgetPasswordModel;

  ForgetStateBuilder();

  ForgetStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _forgetPasswordModel = $v.forgetPasswordModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForgetState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ForgetState;
  }

  @override
  void update(void Function(ForgetStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForgetState build() => _build();

  _$ForgetState _build() {
    final _$result = _$v ??
        new _$ForgetState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            error: error,
            forgetPasswordModel: forgetPasswordModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

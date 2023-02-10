// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NotificationState extends NotificationState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? error;
  @override
  final List<Notifications>? dataList;
  @override
  final List<Notifications>? todayList;
  @override
  final List<Notifications>? prevList;

  factory _$NotificationState(
          [void Function(NotificationStateBuilder)? updates]) =>
      (new NotificationStateBuilder()..update(updates))._build();

  _$NotificationState._(
      {this.isSuccess,
      this.isLoading,
      this.error,
      this.dataList,
      this.todayList,
      this.prevList})
      : super._();

  @override
  NotificationState rebuild(void Function(NotificationStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationStateBuilder toBuilder() =>
      new NotificationStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        error == other.error &&
        dataList == other.dataList &&
        todayList == other.todayList &&
        prevList == other.prevList;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, isSuccess.hashCode), isLoading.hashCode),
                    error.hashCode),
                dataList.hashCode),
            todayList.hashCode),
        prevList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('dataList', dataList)
          ..add('todayList', todayList)
          ..add('prevList', prevList))
        .toString();
  }
}

class NotificationStateBuilder
    implements Builder<NotificationState, NotificationStateBuilder> {
  _$NotificationState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  List<Notifications>? _dataList;
  List<Notifications>? get dataList => _$this._dataList;
  set dataList(List<Notifications>? dataList) => _$this._dataList = dataList;

  List<Notifications>? _todayList;
  List<Notifications>? get todayList => _$this._todayList;
  set todayList(List<Notifications>? todayList) =>
      _$this._todayList = todayList;

  List<Notifications>? _prevList;
  List<Notifications>? get prevList => _$this._prevList;
  set prevList(List<Notifications>? prevList) => _$this._prevList = prevList;

  NotificationStateBuilder();

  NotificationStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _dataList = $v.dataList;
      _todayList = $v.todayList;
      _prevList = $v.prevList;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationState;
  }

  @override
  void update(void Function(NotificationStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationState build() => _build();

  _$NotificationState _build() {
    final _$result = _$v ??
        new _$NotificationState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            error: error,
            dataList: dataList,
            todayList: todayList,
            prevList: prevList);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

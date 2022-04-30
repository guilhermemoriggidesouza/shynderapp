///
//  Generated code. Do not modify.
//  source: user_position.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class UserPositionReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserPositionReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserPosition'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'log', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lat', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  UserPositionReq._() : super();
  factory UserPositionReq({
    $core.int? id,
    $core.int? log,
    $core.int? lat,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (log != null) {
      _result.log = log;
    }
    if (lat != null) {
      _result.lat = lat;
    }
    return _result;
  }
  factory UserPositionReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserPositionReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserPositionReq clone() => UserPositionReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserPositionReq copyWith(void Function(UserPositionReq) updates) => super.copyWith((message) => updates(message as UserPositionReq)) as UserPositionReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserPositionReq create() => UserPositionReq._();
  UserPositionReq createEmptyInstance() => create();
  static $pb.PbList<UserPositionReq> createRepeated() => $pb.PbList<UserPositionReq>();
  @$core.pragma('dart2js:noInline')
  static UserPositionReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserPositionReq>(create);
  static UserPositionReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get log => $_getIZ(1);
  @$pb.TagNumber(2)
  set log($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLog() => $_has(1);
  @$pb.TagNumber(2)
  void clearLog() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get lat => $_getIZ(2);
  @$pb.TagNumber(3)
  set lat($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLat() => $_has(2);
  @$pb.TagNumber(3)
  void clearLat() => clearField(3);
}

class UserPositionList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserPositionList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserPosition'), createEmptyInstance: create)
    ..pc<UserPositionReq>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usersPositions', $pb.PbFieldType.PM, protoName: 'usersPositions', subBuilder: UserPositionReq.create)
    ..hasRequiredFields = false
  ;

  UserPositionList._() : super();
  factory UserPositionList({
    $core.Iterable<UserPositionReq>? usersPositions,
  }) {
    final _result = create();
    if (usersPositions != null) {
      _result.usersPositions.addAll(usersPositions);
    }
    return _result;
  }
  factory UserPositionList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserPositionList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserPositionList clone() => UserPositionList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserPositionList copyWith(void Function(UserPositionList) updates) => super.copyWith((message) => updates(message as UserPositionList)) as UserPositionList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserPositionList create() => UserPositionList._();
  UserPositionList createEmptyInstance() => create();
  static $pb.PbList<UserPositionList> createRepeated() => $pb.PbList<UserPositionList>();
  @$core.pragma('dart2js:noInline')
  static UserPositionList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserPositionList>(create);
  static UserPositionList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UserPositionReq> get usersPositions => $_getList(0);
}


///
//  Generated code. Do not modify.
//  source: user_position.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'user_position.pb.dart' as $0;
export 'user_position.pb.dart';

class UserPositionClient extends $grpc.Client {
  static final _$syncUserPosition =
      $grpc.ClientMethod<$0.UserPositionReq, $0.UserPositionList>(
          '/UserPosition.UserPosition/SyncUserPosition',
          ($0.UserPositionReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UserPositionList.fromBuffer(value));

  UserPositionClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.UserPositionList> syncUserPosition(
      $async.Stream<$0.UserPositionReq> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$syncUserPosition, request, options: options);
  }
}

abstract class UserPositionServiceBase extends $grpc.Service {
  $core.String get $name => 'UserPosition.UserPosition';

  UserPositionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UserPositionReq, $0.UserPositionList>(
        'SyncUserPosition',
        syncUserPosition,
        true,
        true,
        ($core.List<$core.int> value) => $0.UserPositionReq.fromBuffer(value),
        ($0.UserPositionList value) => value.writeToBuffer()));
  }

  $async.Stream<$0.UserPositionList> syncUserPosition(
      $grpc.ServiceCall call, $async.Stream<$0.UserPositionReq> request);
}

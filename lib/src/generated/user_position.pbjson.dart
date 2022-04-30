///
//  Generated code. Do not modify.
//  source: user_position.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userPositionReqDescriptor instead')
const UserPositionReq$json = const {
  '1': 'UserPositionReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'log', '3': 2, '4': 1, '5': 5, '10': 'log'},
    const {'1': 'lat', '3': 3, '4': 1, '5': 5, '10': 'lat'},
  ],
};

/// Descriptor for `UserPositionReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userPositionReqDescriptor = $convert.base64Decode('Cg9Vc2VyUG9zaXRpb25SZXESDgoCaWQYASABKAVSAmlkEhAKA2xvZxgCIAEoBVIDbG9nEhAKA2xhdBgDIAEoBVIDbGF0');
@$core.Deprecated('Use userPositionListDescriptor instead')
const UserPositionList$json = const {
  '1': 'UserPositionList',
  '2': const [
    const {'1': 'usersPositions', '3': 1, '4': 3, '5': 11, '6': '.UserPosition.UserPositionReq', '10': 'usersPositions'},
  ],
};

/// Descriptor for `UserPositionList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userPositionListDescriptor = $convert.base64Decode('ChBVc2VyUG9zaXRpb25MaXN0EkUKDnVzZXJzUG9zaXRpb25zGAEgAygLMh0uVXNlclBvc2l0aW9uLlVzZXJQb3NpdGlvblJlcVIOdXNlcnNQb3NpdGlvbnM=');

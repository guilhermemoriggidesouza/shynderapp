cd ../
protoc -I protos/ protos/user_position.proto --dart_out=grpc:lib/src/generated --plugin=protoc-gen-dart=C:/Users/guilh/AppData/Local/Pub/Cache/bin/protoc-gen-dart.bat
$SHELL
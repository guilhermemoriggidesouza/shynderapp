import 'package:shynder/src/generated/user_position.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class UserPositionService {
  UserPositionList userPositionList = new UserPositionList();
  UserPositionReq userPositionReq = new UserPositionReq();

  static UserPositionClient? client;

  UserPositionService() {
    client = UserPositionClient(
      ClientChannel(
        "192.168.1.10",
        port: 4500,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      ),
    );
  }

  Future<void> sendPositionUser() async {
    Stream<UserPositionReq> outgoingUserPosition() async* {
      var i = 0;
      while (i < 10) {
        print('Sending message');
        await Future.delayed(Duration(milliseconds: 100));
        i++;
        yield userPositionReq
          ..id = i 
          ..lat = 2
          ..log = 2;
      }
    }

    print("vo envia uma msg");
    final call = client?.syncUserPosition(outgoingUserPosition());
    print(call);
    if(call != null){
      await for (var note in call) {
        print(note);
        print('Got message');
      }
    }
  }
}

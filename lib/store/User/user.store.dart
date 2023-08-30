import 'package:mobx/mobx.dart';
import 'package:shynder/models/user.dart';
import 'package:shynder/repositories/user.dart';

part 'user.store.g.dart';

class UserStore = _User with _$UserStore;

abstract class _User with Store {
  UserRepository userRepo = UserRepository();

  @observable
  ObservableFuture<User>? user;

  @action
  getValue() {
    ObservableFuture<User> userResponse = ObservableFuture(userRepo.getUser());
    user = userResponse;
  }
}

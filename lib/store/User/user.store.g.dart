// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _User, Store {
  late final _$userAtom = Atom(name: '_User.user', context: context);

  @override
  ObservableFuture<User>? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(ObservableFuture<User>? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$_UserActionController =
      ActionController(name: '_User', context: context);

  @override
  dynamic getValue() {
    final _$actionInfo =
        _$_UserActionController.startAction(name: '_User.getValue');
    try {
      return super.getValue();
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}

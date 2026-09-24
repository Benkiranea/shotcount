import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class ShotcountAuthUser {
  ShotcountAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<ShotcountAuthUser> shotcountAuthUserSubject =
    BehaviorSubject.seeded(ShotcountAuthUser(loggedIn: false));
Stream<ShotcountAuthUser> shotcountAuthUserStream() => shotcountAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);

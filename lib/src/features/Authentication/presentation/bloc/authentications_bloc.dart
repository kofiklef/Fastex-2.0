import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'authentications_event.dart';
part 'authentications_state.dart';
class AuthenticationsBloc extends Bloc<AuthenticationsEvent, AuthenticationsState> {
  AuthenticationsBloc() : super(AuthenticationsInitial());
  @override
  Stream<AuthenticationsState> mapEventToState(
    AuthenticationsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

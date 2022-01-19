import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'calls_event.dart';
part 'calls_state.dart';
class CallsBloc extends Bloc<CallsEvent, CallsState> {
  CallsBloc() : super(CallsInitial());
  @override
  Stream<CallsState> mapEventToState(
    CallsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

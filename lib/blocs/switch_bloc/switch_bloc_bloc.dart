import 'package:equatable/equatable.dart';
import 'package:todo/blocs/bloc_exports.dart';

part 'switch_bloc_event.dart';
part 'switch_bloc_state.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchBlocInitial(switchValue: false)) {
    on<SwitchOnEvent>(
      (event, emit) {
        emit(const SwitchState(switchValue: true));
      },
    );
    on<SwitchOffEvent>(
      (event, emit) {
        emit(const SwitchState(switchValue: false));
      },
    );
  }

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    return state.toMap();
  }
}

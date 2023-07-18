// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'switch_bloc_bloc.dart';

class SwitchState extends Equatable {
  final bool switchValue;
  const SwitchState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'switchValue': switchValue,
    };
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(
      switchValue: map['switchValue'] ?? false,
      //switchValue: map['switchValue'] as bool,
    );
  }
}

class SwitchBlocInitial extends SwitchState {
  const SwitchBlocInitial({required super.switchValue});
}

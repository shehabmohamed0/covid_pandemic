part of 'status_cubit.dart';

abstract class StatusState extends Equatable {
  const StatusState();
}

class StatusInitial extends StatusState {
  @override
  List<Object> get props => [];
}

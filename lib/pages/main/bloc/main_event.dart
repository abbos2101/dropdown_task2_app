part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainCheckLocalEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}

class MainTapItemRegEvent extends MainEvent {
  final SimpleModel item;

  const MainTapItemRegEvent(this.item);

  @override
  List<Object?> get props => [item];
}

class MainTapItemDisEvent extends MainEvent {
  final SimpleModel item;

  const MainTapItemDisEvent(this.item);

  @override
  List<Object?> get props => [item];
}

class MainTapItemOrgEvent extends MainEvent {
  final SimpleModel item;

  const MainTapItemOrgEvent(this.item);

  @override
  List<Object?> get props => [item];
}

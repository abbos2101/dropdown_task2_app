part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainInitialState extends MainState {
  final SimpleModel region;
  final SimpleModel district;
  final SimpleModel organization;
  final bool regEnabled;
  final bool disEnabled;
  final bool orgEnabled;

  const MainInitialState({
    required this.region,
    required this.district,
    required this.organization,
    this.regEnabled = true,
    this.disEnabled = false,
    this.orgEnabled = false,
  });

  @override
  List<Object> get props => [
        region,
        district,
        organization,
        regEnabled,
        disEnabled,
        orgEnabled,
      ];
}

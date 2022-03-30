import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:task2_app/data/models/simple_model.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  var _region = SimpleModel.empty();
  var _district = SimpleModel.empty();
  var _organization = SimpleModel.empty();

  MainBloc()
      : super(
          MainInitialState(
            region: SimpleModel.empty(),
            district: SimpleModel.empty(),
            organization: SimpleModel.empty(),
          ),
        ) {
    on<MainEvent>(
      (event, emit) async {
        if (event is MainCheckLocalEvent) {
          await _emitMainCheckLocalEvent(event, emit);
        } else if (event is MainTapItemRegEvent) {
          await _emitMainTapItemRegEvent(event, emit);
        } else if (event is MainTapItemDisEvent) {
          await _emitMainTapItemDisEvent(event, emit);
        } else if (event is MainTapItemOrgEvent) {
          await _emitMainTapItemOrgEvent(event, emit);
        }
      },
      transformer: sequential(),
    );
  }

  Future<void> _emitMainCheckLocalEvent(
    MainCheckLocalEvent event,
    Emitter<MainState> emit,
  ) async {}

  Future<void> _emitMainTapItemRegEvent(
    MainTapItemRegEvent event,
    Emitter<MainState> emit,
  ) async {
    if (event.item.id != _region.id) {
      _district = SimpleModel.empty();
      _organization = SimpleModel.empty();
      _region = event.item;
      emit(MainInitialState(
        region: _region,
        district: _district,
        organization: _organization,
        disEnabled: _region.id != -1,
        orgEnabled: _district.id != -1,
      ));
    }
  }

  Future<void> _emitMainTapItemDisEvent(
    MainTapItemDisEvent event,
    Emitter<MainState> emit,
  ) async {
    if (event.item.id != _district.id) {
      _organization = SimpleModel.empty();
      _district = event.item;
      emit(MainInitialState(
        region: _region,
        district: _district,
        organization: _organization,
        disEnabled: _region.id != -1,
        orgEnabled: _district.id != -1,
      ));
    }
  }

  Future<void> _emitMainTapItemOrgEvent(
    MainTapItemOrgEvent event,
    Emitter<MainState> emit,
  ) async {
    if (event.item.id != _organization.id) {
      _organization = event.item;
      emit(MainInitialState(
        region: _region,
        district: _district,
        organization: _organization,
        disEnabled: _region.id != -1,
        orgEnabled: _district.id != -1,
      ));
    }
  }
}

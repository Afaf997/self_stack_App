import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(BottomNavigationBarInitial(tabIndex: 0)) {
    on<ChangeTabIndexEvent>(_onChangeTabIndexEvent);
  }
  void _onChangeTabIndexEvent(ChangeTabIndexEvent event, Emitter<BottomNavigationBarState> emit) {
    emit(BottomNavigationBarInitial(tabIndex: event.index));
  }
}

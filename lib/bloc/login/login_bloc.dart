import 'package:bloc_state_manage/bloc/login/login_event.dart';
import 'package:bloc_state_manage/bloc/login/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  LoginBloc() : super(LoginStates()) {
    on<LoginEvent>((event, emit) {
      on<Emailchanges>(_onemailchanges);
      on<Passwordchange>(_onpasswordchanges);
    });
  }

  void _onemailchanges(Emailchanges event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onpasswordchanges(Passwordchange event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password));
  }
}

import 'package:bloc_state_manage/bloc/login/login_event.dart';
import 'package:bloc_state_manage/bloc/login/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  LoginBloc() : super(LoginStates()) {
    on<LoginEvent>((event, emit) {
      on<Emailchanges>(_onemailchanges);
      on<Passwordchange>(_onpasswordchanges);
      on<Loginapi>(_loginapi);
    });
  }

  void _onemailchanges(Emailchanges event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onpasswordchanges(Passwordchange event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginapi(Loginapi event, Emitter<LoginStates> emit) async {
    Map data = {'email': state.email, 'password': state.password};

    try {
      final response = await http
          .post(Uri.parse('https://reqres.in/api/users?page=2'), body: data);
      if (response.statusCode == 200) {
        emit(state.copyWith(
            loginstatus: Loginstatus.success, message: 'login success'));
      } else {
        emit(state.copyWith(
            loginstatus: Loginstatus.error, message: 'something went wrong'));
      }
    } catch (e) {
      emit(state.copyWith(
          loginstatus: Loginstatus.error, message: e.toString()));
    }
  }
}

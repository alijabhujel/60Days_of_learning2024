import 'package:bloc_state_manage/bloc/login/login_bloc.dart';
import 'package:bloc_state_manage/bloc/login/login_event.dart';
import 'package:bloc_state_manage/bloc/login/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  late LoginBloc loginBloc;
  final emailfocusnode = FocusNode();
  final passwordfocusnode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: BlocProvider(
        create: (_) => loginBloc,
        child: Column(
          children: [
            BlocBuilder<LoginBloc, LoginStates>(
                buildWhen: (current, previous) =>
                    current.email != current.email,
                builder: (context, state) {
                  return TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailfocusnode,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      context.read<LoginBloc>().add(Emailchanges(email: value));
                    },
                    onFieldSubmitted: (value) {},
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<LoginBloc, LoginStates>(
                buildWhen: (current, previous) =>
                    current.password != current.password,
                builder: (context, state) {
                  return TextFormField(
                    keyboardType: TextInputType.text,
                    focusNode: passwordfocusnode,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      context
                          .read<LoginBloc>()
                          .add(Passwordchange(password: value));
                    },
                    onFieldSubmitted: (value) {},
                  );
                }),
            ElevatedButton(onPressed: () {}, child: const Text('Login'))
          ],
        ),
      ),
      //
    );
  }
}

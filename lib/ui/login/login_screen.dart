import 'package:bloc_state_manage/bloc/login/login_bloc.dart';
import 'package:bloc_state_manage/bloc/login/login_event.dart';
import 'package:bloc_state_manage/bloc/login/login_states.dart';
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
            BlocListener<LoginBloc, LoginStates>(
              listener: (context, state) {
                if (state.loginstatus == Loginstatus.error) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                        SnackBar(content: Text(state.message.toString())));
                }
                if (state.loginstatus == Loginstatus.loading) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text('Submitting')));
                }
              },
              child: BlocBuilder<LoginBloc, LoginStates>(
                  buildWhen: (current, previous) => false,
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(Loginapi());
                        },
                        child: const Text('Login'));
                  }),
            )
          ],
        ),
      ),
      //
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/blocs/signup_bloc/bloc/sign_up_bloc.dart';
import 'package:self_stack/pages/authentication_screens/logIn_screens/Screens/login.dart';
import 'package:self_stack/pages/authentication_screens/signUp/widget/signup_form.dart';
import 'package:self_stack/utils/constans.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final SignUpBloc signUpBloc = SignUpBloc();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      bloc: signUpBloc,
      listenWhen: (previous, current) => current is SignUpActionState,
      buildWhen: (previous, current) => current is! SignUpActionState,
      listener: (context, state) {
        if (state is LoginActionState || state is SuccessState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        } else if (state is SignScreenActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kbackgroundmodel,
          body: SingleChildScrollView(
            child: SignUpForm(
              formKey: _formKey,
              nameController: _nameController,
              emailController: _emailController,
              passwordController: _passwordController,
              onSignUpPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  signUpBloc.add(SignUpButtonEvent(
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  ));
                }
              },
              onLoginPressed: () {
                signUpBloc.add(LoginScreenNavigationevent());
              },
            ),
          ),
        );
      },
    );
  }
}

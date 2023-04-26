import 'package:bloc_example/bloc/user_bloc/stream_bloc.dart';
import 'package:bloc_example/view/home.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _loginBloc = LoginBloc();

  FormGroup buildForm() => fb.group(<String, Object>{
        'email': FormControl<String>(
          validators: [Validators.required, Validators.email],
        ),
        'password': ['', Validators.required, Validators.minLength(8)],
        'rememberMe': false,
      });

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReactiveFormBuilder(
              form: buildForm,
              builder: (context, form, child) {
                return Column(
                  children: [
                    ReactiveTextField<String>(
                      formControlName: 'email',
                      validationMessages: {
                        ValidationMessage.required: (_) =>
                            'The email must not be empty',
                        ValidationMessage.email: (_) =>
                            'The email value must be a valid email',
                        'unique': (_) => 'This email is already in use',
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        helperText: '',
                        helperStyle: TextStyle(height: 0.7),
                        errorStyle: TextStyle(height: 0.7),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ReactiveTextField<String>(
                      formControlName: 'password',
                      obscureText: true,
                      validationMessages: {
                        ValidationMessage.required: (_) =>
                            'The password must not be empty',
                        ValidationMessage.minLength: (_) =>
                            'The password must be at least 8 characters',
                      },
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        helperText: '',
                        helperStyle: TextStyle(height: 0.7),
                        errorStyle: TextStyle(height: 0.7),
                      ),
                    ),
                    Row(
                      children: [
                        ReactiveCheckbox(formControlName: 'rememberMe'),
                        const Text('Remember me')
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    StreamBuilder<bool>(
                      stream: _loginBloc.isLoadingStream,
                      initialData: false,
                      builder: (context, snapshot) {
                        return ElevatedButton(
                          onPressed: _submit,
                          child: Text('Login'),
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () => form.resetState({
                        'email': ControlState<String>(value: null),
                        'password': ControlState<String>(value: null),
                        'rememberMe': ControlState<bool>(value: false),
                      }, removeFocus: true),
                      child: const Text('Reset all'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    _loginBloc.login();

    Navigator.push(context, MyHomePage.route(title: 'LOGIN'));

    print('got here');
  }
}

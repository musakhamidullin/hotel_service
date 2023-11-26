import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/modals.dart';
import '../cubit/auth_cubit.dart';
import 'login_form/cubit/login_form_cubit.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _formCubit = LoginFormCubit();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _formCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (_) => _formCubit,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: theme.canvasColor,
          resizeToAvoidBottomInset: true,
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: BlocBuilder<LoginFormCubit, LoginFormState>(
                    builder: (context, formState) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/logo.png'),
                          const SizedBox(
                            height: 32,
                          ),
                          Text(
                            'Авторизация',
                            style: theme.textTheme.headlineSmall,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          const _InputHeader(text: 'Логин'),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            initialValue: formState.email,
                            textAlign: TextAlign.left,
                            decoration: const InputDecoration(
                              hintText: 'Введите ваш логин',
                            ),
                            onChanged: (value) {
                              context
                                  .read<LoginFormCubit>()
                                  .emailChanged(value);
                            },
                            validator: (value) {
                              return value?.isEmpty ?? true
                                  ? 'введите логин'
                                  : null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const _InputHeader(text: 'Пароль'),
                          const SizedBox(
                            height: 16,
                          ),
                          _PasswordInput(
                            initValue: formState.password,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state.authStatus == AuthStatus.failure) {
                                  Modals.showInformationDialog(context,
                                      'Ошибка', Icons.warning_amber_rounded);
                                }
                              },
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: () {
                                    if (!(_formKey.currentState?.validate() ??
                                        true)) return;

                                    context.read<AuthCubit>().login(
                                          email: formState.email,
                                          password: formState.password,
                                        );
                                  },
                                  child: state.loading()
                                      ? CircularProgressIndicator(
                                          color: Theme.of(context).canvasColor,
                                        )
                                      : const Text('войти'),
                                );
                              },
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InputHeader extends StatelessWidget {
  const _InputHeader({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}

class _PasswordInput extends StatefulWidget {
  const _PasswordInput({required this.initValue});

  final String initValue;

  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  var _show = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initValue,
      obscureText: !_show,
      textAlign: TextAlign.left,
      onChanged: (value) {
        context.read<LoginFormCubit>().passwordChanged(value);
      },
      decoration: InputDecoration(
        hintText: 'Пароль',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _show = !_show;
            });
          },
          icon: Icon(
              _show ? Icons.visibility_rounded : Icons.visibility_off_rounded),
        ),
      ),
      validator: (value) {
        return value?.isEmpty ?? true ? 'введите пароль' : null;
      },
    );
  }
}

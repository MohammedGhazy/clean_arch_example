import 'package:clean_arch_example/core/utils/widgets.dart';
import 'package:clean_arch_example/modules/Auth_module/register/bloc/bloc.dart';
import 'package:clean_arch_example/modules/Auth_module/register/bloc/events.dart';
import 'package:clean_arch_example/modules/Auth_module/register/bloc/states.dart';
import 'package:clean_arch_example/modules/Auth_module/register/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: BlocProvider(
        create: (BuildContext context) {
          return SignUpBloc();
        },
        child: BlocBuilder<SignUpBloc, SignUpStates>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    state is SignUpErrorState
                        ? Text(
                            state.failure,
                            style: const TextStyle(color: Colors.red),
                          )
                        : Container(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text("Email"),
                    buildTextFormField(
                        hintText: "please Enter Email",
                        controller: _emailController,
                        keyboardType: TextInputType.text,
                        prefixIcon: Icons.person,
                        onChanged: (value) {
                          BlocProvider.of<SignUpBloc>(context)
                              .add(SignUpTextChangeEvent(
                            emailValue: _emailController.text,
                            passwordValue: _passwordController.text,
                            phoneValue: _phoneController.text,
                          ));
                        },
                        validator: () {},
                        onFieldSubmitted: () {}),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text("Phone"),
                    buildTextFormField(
                        controller: _phoneController,
                        hintText: "please Enter Phone Number",
                        keyboardType: TextInputType.text,
                        prefixIcon: Icons.phone,
                        validator: () {},
                        onChanged: (value) {
                          BlocProvider.of<SignUpBloc>(context)
                              .add(SignUpTextChangeEvent(
                            emailValue: _emailController.text,
                            passwordValue: _passwordController.text,
                            phoneValue: _phoneController.text,
                          ));
                        },
                        onFieldSubmitted: () {}),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text("Password"),
                    buildTextFormField(
                        hintText: "please Enter Password",
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        prefixIcon: Icons.password_outlined,
                        isPassword: true,
                        validator: () {},
                        onChanged: (value) {
                          BlocProvider.of<SignUpBloc>(context)
                              .add(SignUpTextChangeEvent(
                            emailValue: _emailController.text,
                            passwordValue: _passwordController.text,
                            phoneValue: _phoneController.text,
                          ));
                        },
                        onFieldSubmitted: () {}),
                    const SizedBox(
                      height: 20.0,
                    ),
                    state is SignUpLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : buildAppButton(
                            textColor: state is SignUpValidState
                                ? Colors.blue
                                : Colors.grey,
                            onTap: () {
                              /// TODO
                              state is SignUpValidState
                                  ? BlocProvider.of<SignUpBloc>(context)
                                      .add(SignUpSubmittedEvent(
                                      email: _emailController.text,
                                      phone: _phoneController.text,
                                      password: _passwordController.text,
                                    ))
                                  : null;
                            },
                            titleButton: "Sign Up")
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

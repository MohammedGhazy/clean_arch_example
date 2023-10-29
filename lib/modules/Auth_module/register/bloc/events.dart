import 'dart:ffi';

abstract class SignUpEvent {}

class SignUpTextChangeEvent extends SignUpEvent {
  final String emailValue;
  final String passwordValue;
  final String phoneValue;

  SignUpTextChangeEvent({
    required this.emailValue,
    required this.passwordValue,
    required this.phoneValue,
  });
}

class SignUpSubmittedEvent extends SignUpEvent {
  final String email;
  final String password;
  final String phone;

  SignUpSubmittedEvent({
    required this.email,
    required this.password,
    required this.phone,
  });
}

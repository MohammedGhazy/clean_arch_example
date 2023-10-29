import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_example/modules/Auth_module/register/bloc/events.dart';
import 'package:clean_arch_example/modules/Auth_module/register/bloc/states.dart';
import 'package:email_validator/email_validator.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpStates> {
  SignUpBloc() : super(SignUpInvalidState()) {
    on<SignUpTextChangeEvent>(_textChange);
    on<SignUpSubmittedEvent>(_signUpSubmitted);
  }

  _textChange(SignUpTextChangeEvent event, Emitter<SignUpStates> emit) {
    if(EmailValidator.validate(event.emailValue) == false) {
      emit(SignUpErrorState("Please Enter Valid Email Address"));
    } else if(event.phoneValue.isEmpty) {
      emit(SignUpErrorState("Please Enter Valid Phone"));
    } else if(event.passwordValue.length <= 7) {
      emit(SignUpErrorState("Please Enter Valid Password"));
    } else {
      emit(SignUpValidState());
    }
  }

  FutureOr<void> _signUpSubmitted(SignUpSubmittedEvent event, Emitter<SignUpStates> emit) {
    emit(SignUpLoadingState());
  }
}

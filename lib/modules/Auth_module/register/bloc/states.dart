abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpValidState extends SignUpStates {}

class SignUpInvalidState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  final String failure;

  SignUpErrorState(this.failure);
}

class SignUpLoadingState extends SignUpStates {}

part of 'create_account_cubit.dart';


abstract class CreateAccountStates extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateAccountInitialState extends CreateAccountStates {}

class CreateAccountLoadingState extends CreateAccountStates {}

class CreateAccountSuccessState extends CreateAccountStates {
  final String? message;
  CreateAccountSuccessState(this.message);

  @override
  List<Object> get props => [message ?? ''];
}


class CreateAccountFailedState extends CreateAccountStates {
  final String? message;
  CreateAccountFailedState(this.message);

  @override
  List<Object> get props => [message ?? ''];
}


//! Type States
class CreateAccountTypeState extends CreateAccountStates {
  final AccountType? type;
  CreateAccountTypeState(this.type);

  @override
  List<Object> get props => [type ?? ''];
}

class CreateAccountTypeErrorState extends CreateAccountStates {
  final String? message;
  CreateAccountTypeErrorState(this.message);

  @override
  List<Object> get props => [message ?? ''];
}

class CreateAccountTypeSuccessState extends CreateAccountStates {
  final String? message;
  CreateAccountTypeSuccessState(this.message);

  @override
  List<Object> get props => [message ?? ''];
}


//! Gender States
class CreateAccountGenderErrorState extends CreateAccountStates {
  final String? message;
  CreateAccountGenderErrorState(this.message);

  @override
  List<Object> get props => [message ?? ''];
}

class CreateAccountGenderSuccessState extends CreateAccountStates {
  final String? message;
  CreateAccountGenderSuccessState(this.message);

  @override
  List<Object> get props => [message ?? ''];
}

class CreateAccountGenderState extends CreateAccountStates {
  final GenderType? gender;
  CreateAccountGenderState(this.gender);

  @override
  List<Object> get props => [gender ?? ''];
}

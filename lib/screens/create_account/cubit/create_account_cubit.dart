import 'package:borcelle_wedding_app/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_account_states.dart';

class CreateAccountCubit extends Cubit<CreateAccountStates> {
  CreateAccountCubit() : super(CreateAccountInitialState());

  final formKey = GlobalKey<FormState>();

  final TextEditingController phoneCodeController = TextEditingController();
  String phoneCode = '';
  final TextEditingController phoneNumberController = TextEditingController();
  AccountType type = AccountType.none;
  GenderType gender = GenderType.none;

  void setType(AccountType type) {
    this.type = type;
    safeEmit(CreateAccountTypeState(type));
  }

  void setGender(GenderType gender) {
    this.gender = gender;
    safeEmit(CreateAccountGenderState(gender));
  }

  void checkAccountType() {
    if (type == AccountType.none) {
      safeEmit(CreateAccountTypeErrorState("Please select account type"));
    } else {
      safeEmit(CreateAccountTypeSuccessState("Account type selected"));
    }
  }

  void checkGender() {
    if (gender == GenderType.none) {
      safeEmit(CreateAccountGenderErrorState("Please select gender"));
    } else {
      safeEmit(CreateAccountGenderSuccessState("Gender selected"));
    }
  }


  @override
  Future<void> close() {
    phoneCode = '';
    phoneCodeController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }

  void safeEmit(CreateAccountStates state) {
    if (!isClosed) emit(state);
  }
}

import 'package:borcelle_wedding_app/gen/assets.gen.dart';
import 'package:borcelle_wedding_app/gen/colors.gen.dart';
import 'package:borcelle_wedding_app/gen/fonts.gen.dart';
import 'package:borcelle_wedding_app/screens/create_account/cubit/create_account_cubit.dart';
import 'package:borcelle_wedding_app/utils/app_alerts.dart';
import 'package:borcelle_wedding_app/utils/app_extensions.dart';
import 'package:borcelle_wedding_app/utils/screen_utils.dart';
import 'package:borcelle_wedding_app/utils/textfield_validations.dart';
import 'package:borcelle_wedding_app/widgets/app_button.dart';
import 'package:borcelle_wedding_app/widgets/app_text_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAccountCubit, CreateAccountStates>(
      listener: (context, state) {
        if (state is CreateAccountSuccessState) {
          AppAlerts.showSuccessSnackBar(state.message ?? '');
        } else if (state is CreateAccountFailedState) {
          AppAlerts.showErrorSnackBar(state.message ?? '');
        }
      },
      builder: (context, state) {
        final createAccountCubit = context.read<CreateAccountCubit>();
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: createAccountCubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.images.logo.image(width: context.width * 0.6),
                  20.sizeBoxHeight,
                  AppTextField(
                    hintText: "PAK(+92)",
                    controller: createAccountCubit.phoneCodeController,
                    borderColor: ColorName.secondaryColor,
                    suffixIcon: Assets.icons.downArrow
                        .svg(width: 10, height: 10)
                        .paddingAll(20),
                    readOnly: true,
                    onTap:
                        () => showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            createAccountCubit.phoneCode = '+${country.phoneCode}';
                            createAccountCubit.phoneCodeController.text =
                                '${country.countryCode} (+${country.phoneCode})';
                          },
                        ),
                    validator:
                        (value) => TextFieldValidators.emptyFieldValidator(
                          value,
                          "Select Phone Code",
                        ),
                  ),
                  20.sizeBoxHeight,
                  AppTextField(
                    hintText: "Phone Number",
                    borderColor: ColorName.secondaryColor,
                    keyboardType: TextInputType.phone,
                    controller: createAccountCubit.phoneNumberController,
                    validator:
                        (value) => TextFieldValidators.emptyFieldValidator(
                          value,
                          "Enter Phone Number",
                        ),
                  ),
                  20.sizeBoxHeight,
                  Text(
                    'We will send you a verification code soon, please apply',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.balooDa2,
                      color: ColorName.textGray,
                    ),
                  ),
                  70.sizeBoxHeight,
                  AppTextButton(
                    onPressed: () {
                      if (createAccountCubit.formKey.currentState!.validate()) {
                        debugPrint(
                            "SELECTED ${createAccountCubit.phoneCode} ${createAccountCubit.phoneNumberController.text}");
                      }
                    },
                    text: 'Sign Up',
                    textSize: 20,
                    height: 60,
                    textWeight: FontWeight.w500,
                    borderColor: ColorName.primaryColor,
                    backgroundColor: ColorName.primaryColor,
                    textColor: ColorName.white,
                  ),
                  50.sizeBoxHeight,
                ],
              ).paddingSymmetric(horizontal: 20),
            ),
          ),
        );
      },
    );
  }
}

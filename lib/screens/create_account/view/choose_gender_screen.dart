import 'package:borcelle_wedding_app/gen/assets.gen.dart';
import 'package:borcelle_wedding_app/gen/colors.gen.dart';
import 'package:borcelle_wedding_app/gen/fonts.gen.dart';
import 'package:borcelle_wedding_app/screens/create_account/cubit/create_account_cubit.dart';
import 'package:borcelle_wedding_app/screens/create_account/view/create_account_screen.dart';
import 'package:borcelle_wedding_app/utils/app_alerts.dart';
import 'package:borcelle_wedding_app/utils/app_extensions.dart';
import 'package:borcelle_wedding_app/utils/app_navigator.dart';
import 'package:borcelle_wedding_app/utils/enums.dart';
import 'package:borcelle_wedding_app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseGenderScreen extends StatelessWidget {
  const ChooseGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAccountCubit, CreateAccountStates>(
      listener: (context, state) {
        if (state is CreateAccountGenderSuccessState) {
          _openCreateAccountScreen(context);
        } else if (state is CreateAccountGenderErrorState) {
          AppAlerts.showErrorSnackBar(state.message ?? "Please select gender");
        }
      },
      builder: (context, state) {
        final createAccountCubit = context.read<CreateAccountCubit>();
        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  'What is your gender?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.balooDa2,
                    color: ColorName.textGray,
                  ),
                ),
                25.sizeBoxHeight,
                Text(
                  'I am a',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.balooDa2,
                    color: ColorName.primaryColor,
                  ),
                ),
        
                60.sizeBoxHeight,
                AppTextButton(
                  text: 'Female',
                  textSize: 20,
                  height: 60,
                  textWeight: FontWeight.w500,
                  borderColor:
                      createAccountCubit.gender == GenderType.female
                          ? ColorName.primaryColor
                          : ColorName.secondaryColor,
                  backgroundColor:
                      createAccountCubit.gender == GenderType.female
                          ? ColorName.primaryColor
                          : ColorName.white,
                  textColor:
                      createAccountCubit.gender == GenderType.female
                          ? ColorName.white
                          : ColorName.primaryColor,
                  onPressed: () => createAccountCubit.setGender(GenderType.female),
                ),
                20.sizeBoxHeight,
                AppTextButton(
                  text: 'Male',
                  textSize: 20,
                  height: 60,
                  textWeight: FontWeight.w500,
                  borderColor:
                      createAccountCubit.gender == GenderType.male
                          ? ColorName.primaryColor
                          : ColorName.secondaryColor,
                  backgroundColor:
                      createAccountCubit.gender == GenderType.male
                          ? ColorName.primaryColor
                          : ColorName.white,
                  textColor:
                      createAccountCubit.gender == GenderType.male
                          ? ColorName.white
                          : ColorName.primaryColor,
                  onPressed: () => createAccountCubit.setGender(GenderType.male),
                ),
                Spacer(),
                AppIconButton(
                  assetsIcon: Assets.icons.forwardArrow.path,
                  backgroundColor: ColorName.primaryColor,
                  shadowColor: ColorName.secondaryColor,
                  size: 45,
                  onPressed: () => createAccountCubit.checkGender(),
                ),
                50.sizeBoxHeight,
              ],
            ).paddingSymmetric(horizontal: 20),
          ),
        );
      }
    );
  }

  void _openCreateAccountScreen(BuildContext context) {
    AppNavigator.removeAllPreviousAndPush(context, CreateAccountScreen());
  }
}

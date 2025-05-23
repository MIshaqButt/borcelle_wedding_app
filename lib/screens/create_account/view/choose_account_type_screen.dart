import 'package:borcelle_wedding_app/gen/assets.gen.dart';
import 'package:borcelle_wedding_app/gen/colors.gen.dart';
import 'package:borcelle_wedding_app/gen/fonts.gen.dart';
import 'package:borcelle_wedding_app/screens/create_account/cubit/create_account_cubit.dart';
import 'package:borcelle_wedding_app/screens/create_account/view/choose_gender_screen.dart';
import 'package:borcelle_wedding_app/utils/app_alerts.dart';
import 'package:borcelle_wedding_app/utils/app_extensions.dart';
import 'package:borcelle_wedding_app/utils/app_navigator.dart';
import 'package:borcelle_wedding_app/utils/enums.dart';
import 'package:borcelle_wedding_app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseAccountTypeScreen extends StatelessWidget {
  const ChooseAccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAccountCubit, CreateAccountStates>(
      listener: (context, state) {
        if (state is CreateAccountTypeSuccessState) {
          _openChooseGenderScreen(context);
        } else if (state is CreateAccountTypeErrorState) {
          AppAlerts.showErrorSnackBar(
            state.message ?? "Please select account type",
          );
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
                  'Choose your account type',
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
                  text: 'Single User',
                  textSize: 20,
                  height: 60,
                  textWeight: FontWeight.w500,
                  borderColor:
                      createAccountCubit.type == AccountType.single
                          ? ColorName.primaryColor
                          : ColorName.secondaryColor,
                  backgroundColor:
                      createAccountCubit.type == AccountType.single
                          ? ColorName.primaryColor
                          : ColorName.white,
                  textColor:
                      createAccountCubit.type == AccountType.single
                          ? ColorName.white
                          : ColorName.primaryColor,
                  onPressed:
                      () => createAccountCubit.setType(AccountType.single),
                ),
                20.sizeBoxHeight,
                AppTextButton(
                  text: 'Marriage Bureau',
                  textSize: 20,
                  height: 60,
                  textWeight: FontWeight.w500,
                  borderColor:
                      createAccountCubit.type == AccountType.marriage
                          ? ColorName.primaryColor
                          : ColorName.secondaryColor,
                  backgroundColor:
                      createAccountCubit.type == AccountType.marriage
                          ? ColorName.primaryColor
                          : ColorName.white,
                  textColor:
                      createAccountCubit.type == AccountType.marriage
                          ? ColorName.white
                          : ColorName.primaryColor,
                  onPressed:
                      () => createAccountCubit.setType(AccountType.marriage),
                ),
                Spacer(),
                AppIconButton(
                  assetsIcon: Assets.icons.forwardArrow.path,
                  backgroundColor: ColorName.primaryColor,
                  shadowColor: ColorName.secondaryColor,
                  size: 45,
                  onPressed: () => createAccountCubit.checkAccountType(),
                ),
                50.sizeBoxHeight,
              ],
            ).paddingSymmetric(horizontal: 20),
          ),
        );
      },
    );
  }

  void _openChooseGenderScreen(BuildContext context) {
    AppNavigator.removeAllPreviousAndPush(context, ChooseGenderScreen());
  }
}

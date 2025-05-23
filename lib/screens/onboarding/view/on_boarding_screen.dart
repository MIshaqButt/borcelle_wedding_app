import 'package:borcelle_wedding_app/gen/assets.gen.dart';
import 'package:borcelle_wedding_app/gen/colors.gen.dart';
import 'package:borcelle_wedding_app/gen/fonts.gen.dart';
import 'package:borcelle_wedding_app/screens/create_account/view/choose_account_type_screen.dart';
import 'package:borcelle_wedding_app/screens/onboarding/cubit/on_boarding_cubit.dart';
import 'package:borcelle_wedding_app/utils/app_extensions.dart';
import 'package:borcelle_wedding_app/utils/app_navigator.dart';
import 'package:borcelle_wedding_app/utils/screen_utils.dart';
import 'package:borcelle_wedding_app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OnBoardingCubit, int>(
            builder: (context, state) {
              final OnBoardingData onboardController = OnBoardingData();
              final PageController pageController = PageController();
              final cubit = context.read<OnBoardingCubit>();
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: cubit.setPage,
                      itemCount: onboardController.onboardingItems.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            onboardController.onboardingItems[index].image,
                            70.sizeBoxHeight,
                            Text(
                              onboardController.onboardingItems[index].title,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                color: ColorName.black,
                                fontFamily: FontFamily.balooDa2,
                              ),
                            ),
                            20.sizeBoxHeight,
                            Text(
                              textAlign: TextAlign.center,
                              onboardController
                                  .onboardingItems[index]
                                  .description,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: ColorName.textGray,
                                fontFamily: FontFamily.balooDa2,
                              ),
                            ).paddingSymmetric(horizontal: 50),

                            
                          ],
                        ).paddingSymmetric(horizontal: 20);
                      },
                    ),
                  ),
                  BuildDots(),
                  20.sizeBoxHeight,
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorName.primaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50),
                      color: ColorName.white,
                    ),
                    child: Row(
                      children: [
                        20.sizeBoxWidth,
                        AppIconButton(assetsIcon: Assets.icons.google.path),
                        30.sizeBoxWidth,
                        AppIconButton(assetsIcon: Assets.icons.apple.path),
                        Spacer(),
                        AppTextButton(
                          width: context.width * 0.35,
                          height: 50,
                          onPressed: () => _openCreateAccountScreen(context),
                          text: 'Create Account',
                          textSize: 16,
                          textWeight: FontWeight.w400,
                          borderColor: ColorName.primaryColor,
                          textColor: ColorName.white,
                          backgroundColor: ColorName.primaryColor,
                        ),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 20),
                  15.sizeBoxHeight,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Already have an account?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: ColorName.textGray,
                            fontFamily: FontFamily.balooDa2,
                          ),
                        ),
                        TextSpan(text: 'Sign in!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: ColorName.primaryColor,
                            fontFamily: FontFamily.balooDa2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  30.sizeBoxHeight,
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _openCreateAccountScreen(BuildContext context) {
    AppNavigator.removeAllPreviousAndPush(context, ChooseAccountTypeScreen());
  }
}

class BuildDots extends StatelessWidget {
  const BuildDots({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.select((OnBoardingCubit cubit) => cubit.state);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        2,
        (index) => AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:
                currentIndex == index
                    ? ColorName.secondaryColor
                    : ColorName.secondaryColor.withValues(alpha: 0.2),
          ),
          height: 7,
          width: currentIndex == index ? 36 : 12,
          duration: const Duration(milliseconds: 700),
        ),
      ),
    );
  }
}

class OnBoardingInfo {
  final Widget image;
  final String title;
  final String description;

  OnBoardingInfo({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnBoardingData {
  List<OnBoardingInfo> onboardingItems = [
    OnBoardingInfo(
      title: 'Quality Matches',
      description: 'Find your perfect match & meaningfull connection with us.',
      image: Assets.images.onboardingFirst.image(height: 300),
    ),
    OnBoardingInfo(
      title: 'Quality Matches',
      description: 'Find your perfect match & meaningfull connection with us.',
      image: Assets.images.onboardingSecond.image(height: 300),
    ),
  ];
}

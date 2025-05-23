import 'package:borcelle_wedding_app/gen/colors.gen.dart';
import 'package:borcelle_wedding_app/gen/fonts.gen.dart';
import 'package:borcelle_wedding_app/utils/screen_utils.dart';
import 'package:borcelle_wedding_app/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final String text;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? sku;
  final double? textSize;
  final FontWeight? textWeight;

  const AppButton({
    super.key,
    this.isLoading = false,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.sku,
    this.textSize,
    this.textWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sku ?? double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        label: Text(
          text,
          style: TextStyle(
            fontSize: textSize ?? 18,
            color: textColor,
            fontWeight: textWeight ?? FontWeight.w500,
            fontFamily: FontFamily.balooDa2,
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        icon: isLoading ? const LoadingAnimation() : icon ?? const SizedBox(),
      ),
    );
  }
}

class AppOutlineButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final String text;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? sku; // <-- New SKU param

  const AppOutlineButton({
    super.key,
    this.isLoading = false,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.sku,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sku ?? double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: BorderSide(color: ColorName.primaryColor, width: 1),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: ColorName.primaryColor,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const AppBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        Icons.arrow_back_rounded,
        color: ColorName.primaryColor,
        size: 30,
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? assetsIcon;
  final Color? backgroundColor;
  final Color? shadowColor;
  final double? size;
  const AppIconButton({
    super.key,
    this.onPressed,
    this.assetsIcon,
    this.backgroundColor,
    this.shadowColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
        shadowColor: shadowColor ?? ColorName.iconBackground,
        child: Container(
          width: size ?? 40,
          height: size ?? 40,
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: backgroundColor ?? ColorName.iconBackground,
          ),
          child: SvgPicture.asset(assetsIcon ?? ''),
        ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? textSize;
  final FontWeight? textWeight;

  const AppTextButton({
    super.key,
    this.onPressed,
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.width,
    this.height,
    this.textSize,
    this.textWeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? context.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: borderColor ?? backgroundColor ?? ColorName.primaryColor,
            width: 1,
          ),
          color: backgroundColor ?? ColorName.white,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: textSize ?? 18,
            color: textColor,
            fontWeight: textWeight ?? FontWeight.w500,
            fontFamily: FontFamily.balooDa2,
          ),
        ),
      ),
    );
  }
}

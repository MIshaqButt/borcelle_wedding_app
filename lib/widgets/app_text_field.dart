import 'package:borcelle_wedding_app/gen/colors.gen.dart';
import 'package:borcelle_wedding_app/gen/fonts.gen.dart';
import 'package:borcelle_wedding_app/utils/helper_functions.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final bool isInstagramField;
  final String hintText;
  final String? labelText;
  final String? errorText;
  final TextStyle? textStyle;
  final int? maxLine;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool? enable;
  final bool isPassword;
  final int? minLines;
  final int? maxLines;
  final ValueChanged<String>? onChanged;
  final bool? readOnly;
  final Function()? onTap;
  final Color? filledColor;
  final double? borderRadius;
  final Color? borderColor;
  final EdgeInsetsGeometry? contentPadding;

  const AppTextField({
    super.key,
    required this.hintText,
    this.labelText,
    this.errorText,
    this.textStyle,
    this.keyboardType,
    this.maxLine,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.enable,
    this.isInstagramField = false,
    this.isPassword = false,
    this.validator,
    this.minLines,
    this.maxLines,
    this.onChanged,
    this.readOnly,
    this.onTap,
    this.filledColor,
    this.borderRadius,
    this.borderColor,
    this.contentPadding,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;
  bool _isFocused = false;

  void _changeTextVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _isFocused = hasFocus;
        });
      },
      child: TextFormField(
        cursorColor: ColorName.primaryColor,
        // Primary color for cursor
        onTapOutside: (_) => hideKeyBoard(),
        onChanged: widget.onChanged,
        enabled: widget.enable ?? true,
        readOnly: widget.readOnly ?? false,
        obscureText: widget.isPassword && _obscureText,
        controller: widget.controller,
        validator: widget.validator,
        minLines: widget.minLines,
        maxLines: widget.maxLines ?? 1,
        keyboardType: widget.keyboardType,
        onTap: widget.onTap,
        style:
            widget.textStyle ??
            Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 20,
              color: ColorName.primaryColor,
              fontWeight: FontWeight.w500,
              fontFamily: FontFamily.balooDa2,
            ),
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon:
              widget.isPassword
                  ? IconButton(
                    splashRadius: 1,
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: _isFocused ? ColorName.primaryColor : Colors.grey,
                    ),
                    onPressed: _changeTextVisibility,
                  )
                  : widget.suffixIcon,
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: ColorName.textGray,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.balooDa2,
          ),
          filled: true,
          fillColor: widget.filledColor ?? ColorName.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 30),
            borderSide: BorderSide(
              color: widget.borderColor ?? ColorName.primaryColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 30),
            borderSide: BorderSide(
              color: widget.borderColor ?? ColorName.primaryColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 30),
            borderSide: BorderSide(
              color: widget.borderColor ?? ColorName.primaryColor,
              width: 1,
            ), // No border
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 30),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 30),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          contentPadding:
              widget.contentPadding ??
              const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          errorText: widget.errorText,
        ),
      ),
    );
  }
}

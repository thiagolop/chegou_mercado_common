// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/font_family_outlet.dart';

// ignore: must_be_immutable
class InputField extends StatefulWidget {
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String hintText;
  final TextEditingController controller;
  final double fontSize;
  final double borderRadius;
  final validator;
  TextInputType keyboardType;
  final bool digitsOnly;
  final String prefixText;
  final String label;
  final EdgeInsets padding;
  final bool passwordMode;
  final Function()? suffixIconFunction;
  final Function()? prefixIconFunction;
  final Function()? onTap;
  final Function(String)? onChanged;
  final AutovalidateMode autovalidateMode;
  final int maxLength;
  final bool formatNumber;
  final String initialValue;
  final bool formatMoney;
  final bool multiline;
  InputField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.fontSize = 16,
    this.borderRadius = 14,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.digitsOnly = false,
    this.prefixText = '',
    this.label = '',
    this.padding = const EdgeInsets.all(0),
    this.passwordMode = false,
    this.suffixIconFunction,
    this.prefixIconFunction,
    this.onTap,
    this.maxLength = 15,
    this.onChanged,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.formatNumber = true,
    this.initialValue = '',
    this.formatMoney = false,
    this.multiline = false,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> passwordVisible = ValueNotifier<bool>(true);

    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return ValueListenableBuilder(
      valueListenable: passwordVisible,
      builder: (context, value, child) => Padding(
        padding: widget.padding,
        child: TextFormField(
          maxLength: widget.maxLength,
          controller: widget.controller,
          obscureText: widget.passwordMode ? passwordVisible.value : false,
          textInputAction: TextInputAction.done,
          inputFormatters: (widget.digitsOnly) ? [FilteringTextInputFormatter.digitsOnly] : null,
          keyboardType: (isIOS && widget.keyboardType == TextInputType.number) ? const TextInputType.numberWithOptions(signed: true, decimal: true) : widget.keyboardType,
          maxLines: widget.multiline ? 6 : 1,
          validator: widget.validator,
          autovalidateMode: widget.autovalidateMode,
          onChanged: (value) {
            //
          },
          onTap: widget.onTap,
          readOnly: widget.onTap != null,
          decoration: InputDecoration(
            counterText: '',
            prefixIcon: widget.prefixIcon != null
                ? InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: widget.prefixIconFunction ?? () {},
                    child: Icon(
                      widget.prefixIcon,
                      color: const Color(0xFF86869E),
                    ),
                  )
                : null,
            suffixIcon: widget.suffixIcon != null
                ? InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: widget.passwordMode ? () => passwordVisible.value = !passwordVisible.value : widget.suffixIconFunction ?? () {},
                    child: Icon(
                      widget.passwordMode ? (passwordVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined) : widget.suffixIcon,
                      color: const Color(0xFF86869E),
                    ),
                  )
                : widget.keyboardType == TextInputType.number
                    ? InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: const Icon(
                          Icons.check,
                          color: Color(0xFF86869E),
                        ),
                      )
                    : null,
            contentPadding: widget.prefixIcon != null ? EdgeInsets.symmetric(horizontal: 0, vertical: (widget.multiline) ? 15 : 0) : EdgeInsets.symmetric(horizontal: 15, vertical: (widget.multiline) ? 15 : 0),
            hintText: widget.label,
            prefixText: widget.prefixText,
            labelStyle: TextStyle(
              color: const Color(0xFF86869E),
              fontSize: widget.fontSize,
            ),
            hintStyle: TextStyle(
              fontSize: widget.fontSize,
              color: const Color(0xFFB4B4C0),
              fontFamily: context.fontStyle.fontName,
            ),
            filled: true,
            fillColor: const Color(0xFFB4B4C0).withOpacity(Theme.of(context).brightness == Brightness.dark ? 0.1 : 0.25),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
              borderSide: const BorderSide(color: Color.fromRGBO(244, 67, 54, 1)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
              borderSide: const BorderSide(color: Color.fromRGBO(244, 67, 54, 1)),
            ),
            errorStyle: TextStyle(
              fontSize: 12,
              color: const Color.fromRGBO(244, 67, 54, 1),
              fontFamily: context.fontStyle.fontName,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../theme/font_family_outlet.dart';
import 'input_field.dart';

class InputFieldPattern extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String prefixText;
  final bool digitsOnly;
  final int maxLength;
  final validator;
  final AutovalidateMode autovalidateMode;
  final Function(String)? onChanged;
  final bool formatNumber;
  final String initialValue;
  final bool infoButton;
  final String infoButtonLabel;
  final String infoButtonDescription;
  final IconData? suffixIcon;
  final Function()? suffixIconFunction;
  final Function()? onTap;
  final bool formatMoney;
  final bool multiline;

  const InputFieldPattern({
    super.key,
    this.label = '',
    this.prefixText = '',
    this.digitsOnly = false,
    this.keyboardType = TextInputType.text,
    this.maxLength = 10,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    required this.controller,
    this.onChanged,
    this.formatNumber = true,
    this.initialValue = '',
    this.infoButton = false,
    this.infoButtonLabel = '',
    this.infoButtonDescription = '',
    this.suffixIcon,
    this.suffixIconFunction,
    this.onTap,
    this.formatMoney = false,
    this.multiline = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          Visibility(
            visible: label.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        label,
                        style: context.fontStyle.textRegular.copyWith(fontSize: 14),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          InputField(
            suffixIcon: suffixIcon,
            suffixIconFunction: () {
              suffixIconFunction?.call();
            },
            autovalidateMode: autovalidateMode,
            validator: validator,
            maxLength: maxLength,
            digitsOnly: digitsOnly,
            prefixText: prefixText,
            keyboardType: keyboardType,
            controller: controller,
            onChanged: onChanged,
            formatNumber: formatNumber,
            initialValue: initialValue,
            onTap: onTap,
            formatMoney: formatMoney,
            multiline: multiline,
          ),
        ],
      ),
    );
  }
}

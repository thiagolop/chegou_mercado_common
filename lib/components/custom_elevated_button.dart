import 'package:flutter/material.dart';
import '../theme/color_outlet.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final double elevation;
  final void Function()? onPressed;

  const CustomElevatedButton({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.height = 50,
    this.borderRadius = 14,
    this.backgroundColor =  ColorOutlet.secondaryColor,
    this.borderColor = ColorOutlet.secondaryColor,
    this.elevation = 0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: borderColor,
            ),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

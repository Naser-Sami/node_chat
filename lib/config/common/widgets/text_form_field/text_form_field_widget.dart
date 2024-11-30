import 'package:flutter/material.dart';

import '/core/_core.dart';
import '/config/_config.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.leadingIcon,
    this.trailingIcon,
    this.onLeadingIconPressed,
    this.onTrailingIconPressed,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final void Function()? onLeadingIconPressed;
  final void Function()? onTrailingIconPressed;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: TPadding.p24, vertical: TPadding.p16),
      padding: const EdgeInsets.symmetric(horizontal: TPadding.p16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(TRadius.bR30),
        border: Border.all(
          color: Theme.of(context).colorScheme.scrim,
        ),
      ),
      child: Row(
        children: [
          if (leadingIcon != null)
            GestureDetector(
              onTap: onLeadingIconPressed,
              child: Icon(
                leadingIcon,
                color: Colors.grey,
              ),
            ),
          TSize.s10.toWidth,
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          TSize.s10.toWidth,
          if (trailingIcon != null)
            GestureDetector(
              onTap: onTrailingIconPressed,
              child: Icon(
                trailingIcon,
                color: Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

class RenderTextFormField extends StatelessWidget {
  const RenderTextFormField({
    super.key,
    required this.onSaved,
    required this.validator,
    required this.isObsecure,
  });

  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  final bool isObsecure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecure,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Sizes.size7,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size7,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size7,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size7,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size7,
          ),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}

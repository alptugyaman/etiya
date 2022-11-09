import 'package:etiya/src/config/color/app_color.dart';
import 'package:flutter/material.dart';

/// It's a TextFormField with a search icon and a hint text
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.isReadOnly,
    this.onTap,
    this.onChanged,
  });

  final bool isReadOnly;
  final void Function()? onTap;
  final void Function(String input)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.primary,
      enableSuggestions: false,
      readOnly: isReadOnly,
      style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
      onTap: onTap,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        suffixIcon: const Icon(Icons.search),
        hintText: 'ARA',
        hintStyle: const TextStyle(fontSize: 13),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        helperStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
        errorStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
      ),
    );
  }
}

import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color color = Colors.blue,
  bool isUpperCase = true,
  required VoidCallback function,
  required String buttonText,
}) => SizedBox(
  width: width,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(vertical: 10),
    ),
    onPressed: function,
    child: Text(
      isUpperCase ? buttonText.toUpperCase() : buttonText,
      style: const TextStyle(fontSize: 20, color: Colors.white),
    ),
  ),
);

Widget defaultInput({
  bool isPassword = false,
  bool readOnly = false,
  required TextEditingController controller,
  required TextInputType type,
  required String text,
  required String? Function(String?) validate,
  required Icon prefix,

  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChanged,
  VoidCallback? onTap,
  Widget? suffix,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  decoration: InputDecoration(
    prefixIcon: prefix,
    suffixIcon: suffix,
    labelText: text,
    border: OutlineInputBorder(),
  ),
  onFieldSubmitted: onSubmit,
  onChanged: onChanged,
  onTap: onTap,
  readOnly: readOnly,
  validator: validate,
);

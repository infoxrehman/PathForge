import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isObscure;
  final bool isPassword;
  final VoidCallback? onPressed;
  final bool isEmail;
  final bool isLogin;
  final bool readOnly;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isObscure = false,
    this.isPassword = false,
    this.onPressed,
    this.isEmail = false,
    this.isLogin = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      readOnly: readOnly,
      style: TextStyle(color: Colors.white),
      validator: isLogin
          ? null
          : (value) {
        if (value == null || value.isEmpty) {
          return '$hintText cannot be empty';
        }
        if (isEmail &&
            !RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                .hasMatch(value)) {
          return 'Enter a valid email';
        }
        if (isPassword && value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            isObscure ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: onPressed,
        )
            : null,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
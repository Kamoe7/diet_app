import 'package:flutter/material.dart';

class Components extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const Components(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obscureText = true});

  @override
  State<Components> createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
            hintText: widget.hintText,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(16),
            ),
            hintStyle: TextStyle(color: Colors.grey[500]),
            suffixIcon: widget.obscureText
                ? InkWell(
                    onTap: _toggle,
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                : null),
      ),
    );
  }
}

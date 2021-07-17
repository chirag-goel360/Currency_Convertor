import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  final String title;
  final String value;
  final String label;
  final bool enabled;
  final Function setAmount;

  CustomField({
    this.title,
    this.label,
    this.value,
    this.enabled,
    this.setAmount,
  });

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        onChanged: (value) {
          widget.setAmount(
            value,
          );
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.value,
          enabled: widget.enabled,
          suffix: Text(
            widget.title ?? "",
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
      ),
    );
  }
}

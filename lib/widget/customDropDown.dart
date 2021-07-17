import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function onChanged;

  CustomDropDown({
    this.value,
    this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            offset: Offset(
              3,
              3,
            ),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: DropdownButton(
        underline: SizedBox(),
        value: value,
        onChanged: (val) {
          onChanged(val);
        },
        items: items.map<DropdownMenuItem>((String item) {
          return DropdownMenuItem(
            child: Text(
              item,
            ),
            value: item,
          );
        }).toList(),
      ),
    );
  }
}

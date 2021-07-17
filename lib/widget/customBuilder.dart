import 'package:currency_convertor/widget/customButton.dart';
import 'package:currency_convertor/widget/customDropDown.dart';
import 'package:flutter/material.dart';

class CustomBuilder extends StatelessWidget {
  final Function swapCurrency;
  final List<String> currencies;
  final String from;
  final String to;
  final Function fromValues;
  final Function toValues;

  CustomBuilder({
    this.swapCurrency,
    this.currencies,
    this.from,
    this.to,
    this.fromValues,
    this.toValues,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomDropDown(
            items: currencies,
            value: from,
            onChanged: fromValues,
          ),
          CustomButton(
            function: swapCurrency,
          ),
          CustomDropDown(
            items: currencies,
            value: to,
            onChanged: toValues,
          ),
        ],
      ),
    );
  }
}
